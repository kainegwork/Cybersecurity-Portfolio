# Win32 App Deployment with Microsoft Intune

## Overview

This lab documents packaging, deploying, verifying, and troubleshooting a Win32 application through Microsoft Intune.

I used 7-Zip as the test application and deployed it automatically to a managed Windows 11 device.

The lab also included two troubleshooting scenarios:

- Incorrect detection rule
- Incorrect install command

## Environment

- Microsoft Intune
- Microsoft Entra ID
- Windows 11 Pro
- Device: `WIN11-INTUNE01`
- Device group: `Intune-Test-Devices`
- Application: 7-Zip 26.03 x64
- Microsoft Win32 Content Prep Tool

## Packaging the Application

The 7-Zip installer was packaged using Microsoft's Win32 Content Prep Tool.

Source installer:

```text
7z2603-x64.exe
```

The tool converted the installer into an:

```text
.intunewin
```

package for upload to Microsoft Intune.

## Intune App Configuration

The application was added as:

```text
Windows app (Win32)
```

### Install Command

```cmd
7z2603-x64.exe /S
```

The `/S` switch performs a silent installation.

### Uninstall Command

```cmd
"C:\Program Files\7-Zip\Uninstall.exe" /S
```

### Install Behaviour

```text
System
```

This allows Intune to install the application in the system context rather than requiring the signed-in user to perform the installation.

## Requirements

The application was configured for:

```text
Architecture: x64
Operating system: Windows 10 and later
```

## Detection Rule

A file-based detection rule was configured.

```text
Path:
C:\Program Files\7-Zip

File:
7zFM.exe

Detection method:
File or folder exists
```

This allowed Intune to verify whether 7-Zip was successfully installed.

## Assignment

The application was assigned to:

```text
Intune-Test-Devices
```

with an assignment type of:

```text
Required
```

This meant Intune automatically installed the application on devices in the test group.

## Deployment Verification

After synchronising `WIN11-INTUNE01`, Intune downloaded and installed the application automatically.

Verification was performed in three places:

1. 7-Zip appeared on the Windows endpoint.
2. Intune reported the application as installed.
3. Intune Management Extension logs confirmed successful detection.

The application workload log showed:

```text
applicationDetected: True
```

This confirmed that the detection rule successfully located the installed application.

## Troubleshooting Scenario 1 - Incorrect Detection Rule

To practise troubleshooting, I created a second deployment with an intentionally incorrect detection path.

The broken rule checked:

```text
C:\Program Files\7-Zip-Broken
```

instead of:

```text
C:\Program Files\7-Zip
```

### Symptoms

- 7-Zip was already installed.
- Intune did not recognise the installation.
- `AppWorkload.log` reported that the detection path did not exist.

### Investigation

I compared:

- The actual 7-Zip installation location
- The Intune detection rule
- The Intune Management Extension logs

This confirmed that the application itself was installed correctly and the detection configuration was wrong.

### Resolution

The detection rule was corrected to:

```text
C:\Program Files\7-Zip\7zFM.exe
```

After synchronising the device again, Intune correctly detected the installation and reported the application as installed.

## Troubleshooting Scenario 2 - Incorrect Install Command

A second failure was created using an invalid install command.

The working command:

```cmd
7z2603-x64.exe /S
```

was temporarily replaced with an incorrect command.

### Symptoms

- Intune attempted to run the installer.
- The installer process remained running.
- The IME log showed the configured installer timeout:

```text
3600000 milliseconds
```

which equals one hour.

Task Manager confirmed that the 7-Zip installer process was still active.

### Resolution

The installer process was stopped and the correct silent command was restored:

```cmd
7z2603-x64.exe /S
```

After another device synchronisation, Intune successfully installed the application.

## Intune Management Extension Logs

The main log location used during troubleshooting was:

```text
C:\ProgramData\Microsoft\IntuneManagementExtension\Logs
```

The most useful log for this deployment was:

```text
AppWorkload.log
```

The log showed the application lifecycle including:

```text
Detection
Download
Hash verification
Decryption
Installation
Post-install detection
Status reporting
```

## Skills Demonstrated

- Microsoft Intune Win32 application deployment
- `.intunewin` packaging
- Silent installation commands
- System-context deployment
- Application requirements
- Detection rules
- Required application assignments
- Intune Management Extension troubleshooting
- Log analysis
- Root cause identification
- Endpoint verification
- Intune deployment reporting

## Key Takeaway

A successful installer does not automatically mean Intune will report an application as installed.

Intune must also successfully detect the application using its configured detection rules.

When troubleshooting Win32 deployments, I would verify:

1. Assignment
2. Requirements
3. Install command
4. Installer exit behaviour
5. Detection rule
6. Actual endpoint state
7. Intune Management Extension logs
8. Intune deployment reporting