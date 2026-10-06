# SecurityTriage.ps1
# Collects and summarises selected Windows security events for basic SOC-style triage.
#
# Current coverage:
# - Event ID 4625: Failed logons
# - Event ID 4688: Process creation
# - Event ID 4104: PowerShell Script Block Logging
#
# Administrator privileges are required to query the Windows Security log.


# -----------------------------
# Administrator Check
# -----------------------------

$CurrentUser = [Security.Principal.WindowsIdentity]::GetCurrent()

$Principal = New-Object Security.Principal.WindowsPrincipal($CurrentUser)

$IsAdmin = $Principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)

if (-not $IsAdmin) {
    Write-Host "Please run SecurityTriage.ps1 as Administrator."
    exit
}


# -----------------------------
# Failed Logons - Event ID 4625
# -----------------------------

Write-Host "`n=== FAILED LOGONS ==="

try {
    $FailedLogons = Get-WinEvent -FilterHashtable @{
        LogName   = 'Security'
        Id        = 4625
        StartTime = (Get-Date).AddDays(-7)
    } -ErrorAction Stop
}
catch {
    if ($_.FullyQualifiedErrorId -like "*NoMatchingEventsFound*") {
        $FailedLogons = @()
    }
    else {
        Write-Host "Unable to query Event ID 4625: $($_.Exception.Message)"
        $FailedLogons = @()
    }
}

if ($FailedLogons) {

    $FailedLogonSummaries = @()

    foreach ($Event in $FailedLogons) {

        [xml]$EventXML = $Event.ToXml()

        $TargetUser = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "TargetUserName" }).'#text'

        $SourceIP = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "IpAddress" }).'#text'

        $LogonType = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "LogonType" }).'#text'

        $SubStatus = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "SubStatus" }).'#text'

        $FailureReason = switch ($SubStatus) {
            "0xc000006a" { "Incorrect password" }
            "0xc0000064" { "User does not exist" }
            "0xc0000234" { "Account locked out" }
            default      { "Unknown / other" }
        }

        $FailedLogonSummary = [PSCustomObject]@{
            TimeCreated   = $Event.TimeCreated
            User          = $TargetUser
            LogonType     = $LogonType
            SourceIP      = $SourceIP
            SubStatus     = $SubStatus
            FailureReason = $FailureReason
        }

        $FailedLogonSummaries += $FailedLogonSummary
    }

    Write-Host "Failed logons found: $($FailedLogonSummaries.Count)"

    $FailedLogonSummaries | Format-Table -AutoSize
}
else {
    Write-Host "No 4625 events found in the last 7 days."
}

# -----------------------------
# Process Creation - Event ID 4688
# -----------------------------

Write-Host "`n=== PROCESS CREATION EVENTS ==="

try {
    $ProcessEvents = Get-WinEvent -FilterHashtable @{
        LogName   = 'Security'
        Id        = 4688
        StartTime = (Get-Date).AddHours(-24)
    } -ErrorAction Stop
}
catch {
    if ($_.FullyQualifiedErrorId -like "*NoMatchingEventsFound*") {
        $ProcessEvents = @()
    }
    else {
        Write-Host "Unable to query Event ID 4688: $($_.Exception.Message)"
        $ProcessEvents = @()
    }
}

if ($ProcessEvents) {

    Write-Host "4688 events found: $($ProcessEvents.Count)"

    $ProcessSummaries = @()

    foreach ($Event in $ProcessEvents) {

        [xml]$EventXML = $Event.ToXml()

        $User = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "SubjectUserName" }).'#text'

        $ProcessName = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "NewProcessName" }).'#text'

        $ParentProcess = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "ParentProcessName" }).'#text'

        $CommandLine = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "CommandLine" }).'#text'

        $ProcessSummary = [PSCustomObject]@{
            TimeCreated   = $Event.TimeCreated
            User          = $User
            ProcessName   = $ProcessName
            ParentProcess = $ParentProcess
            CommandLine   = $CommandLine
        }

        $ProcessSummaries += $ProcessSummary
    }

    $ProcessSummaries | Format-List
}
else {
    Write-Host "No 4688 events found in the last 24 hours."
}

# -----------------------------
# PowerShell Script Blocks - Event ID 4104
# -----------------------------

Write-Host "`n=== POWERSHELL SCRIPT BLOCK EVENTS ==="

try {
    $PowerShellEvents = Get-WinEvent -FilterHashtable @{
        LogName   = 'Microsoft-Windows-PowerShell/Operational'
        Id        = 4104
        StartTime = (Get-Date).AddHours(-24)
    } -ErrorAction Stop
}
catch {
    if ($_.FullyQualifiedErrorId -like "*NoMatchingEventsFound*") {
        $PowerShellEvents = @()
    }
    else {
        Write-Host "Unable to query Event ID 4104: $($_.Exception.Message)"
        $PowerShellEvents = @()
    }
}

if ($PowerShellEvents) {

    Write-Host "4104 events found: $($PowerShellEvents.Count)"

    $PowerShellSummaries = @()

    foreach ($Event in $PowerShellEvents) {

        [xml]$EventXML = $Event.ToXml()

        $ScriptBlockText = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "ScriptBlockText" }).'#text'

        $Path = ($EventXML.Event.EventData.Data |
            Where-Object { $_.Name -eq "Path" }).'#text'

        $SuspiciousKeyword = if (
            $ScriptBlockText -match
            'Invoke-WebRequest|Invoke-Expression|\bIEX\b|EncodedCommand|ExecutionPolicy|DownloadString'
        ) {
            "YES"
        }
        else {
            "NO"
        }

        $PowerShellSummary = [PSCustomObject]@{
            TimeCreated     = $Event.TimeCreated
            Path            = $Path
            Suspicious      = $SuspiciousKeyword
            ScriptBlockText = $ScriptBlockText
        }

        $PowerShellSummaries += $PowerShellSummary
    }

    $FlaggedPowerShell = $PowerShellSummaries | 
		Where-Object { $_.Suspicious -eq "YES"}
		
	Write-Host "Flagged PowerShell events: $($FlaggedPowerShell.Count)"
	
	if ($FlaggedPowerShell) {
			$FlaggedPowerShell | Format-List
	}
	else {
		Write-Host "No PowerShell events matched the triage keywords."
	}
}