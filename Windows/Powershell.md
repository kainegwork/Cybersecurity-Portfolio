# PowerShell Fundamentals

PowerShell is a command-line shell and scripting environment widely used for Windows administration.

PowerShell commands are called **cmdlets** and normally follow a `Verb-Noun` naming convention, such as `Get-Service` or `Set-Location`.

## Discovering Commands

### Get-Command

Lists available cmdlets, functions and commands.

```powershell
Get-Command
```

### Get-Help

Displays help for a cmdlet.

```powershell
Get-Help Get-Service
Get-Help Get-Service -Examples
```

### Modules

`Find-Module` can search for modules from configured repositories, while `Install-Module` installs a module.

Changes to a system should only be made after confirming the source and purpose of the module.

## Navigating the File System

### Get-ChildItem

Lists files and directories, similar to `dir`.

```powershell
Get-ChildItem
Get-ChildItem -Path C:\Windows
```

### Set-Location

Changes the current location.

```powershell
Set-Location -Path C:\Windows
```

### File Management

Useful cmdlets include:

- `New-Item`
- `Remove-Item`
- `Copy-Item`
- `Move-Item`
- `Get-Content`

Example:

```powershell
New-Item -Path ".\notes.txt" -ItemType File
Get-Content ".\notes.txt"
```

## PowerShell Pipeline

The pipeline operator `|` passes objects from one command to another.

This is one of the main differences between PowerShell and many traditional command shells: PowerShell normally passes structured objects rather than only plain text.

Example:

```powershell
Get-Service | Where-Object Status -eq "Running"
```

## Filtering Objects

`Where-Object` filters objects based on conditions.

Common comparison operators include:

| Operator | Meaning |
|---|---|
| `-eq` | Equal to |
| `-ne` | Not equal to |
| `-gt` | Greater than |
| `-ge` | Greater than or equal to |
| `-lt` | Less than |
| `-le` | Less than or equal to |

## Selecting Output

`Select-Object` can choose specific properties from objects.

```powershell
Get-Process | Select-Object Name, Id, CPU
```

## Searching Text

`Select-String` searches text for matching patterns and is similar in purpose to `grep`.

```powershell
Select-String -Path ".\system.log" -Pattern "error"
```

## Useful Administration Commands

Examples I have used or studied include:

```powershell
Get-Process
Get-Service
Get-NetIPConfiguration
Get-BitLockerVolume
```

These can help with process investigation, service troubleshooting, network configuration checks and verifying BitLocker status.
