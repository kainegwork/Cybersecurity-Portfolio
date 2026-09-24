# Intune Enrollment Troubleshooting

## Overview

This lab documents the troubleshooting of a Windows 11 device that successfully joined Microsoft Entra ID but did not automatically enroll into Microsoft Intune.

The aim was to identify why the device appeared in Entra as unmanaged, correct the enrollment issue, and verify that the endpoint became fully Intune managed.

## Environment

- Microsoft 365 Business Premium lab tenant
- Microsoft Entra ID
- Microsoft Intune
- Windows 11 Pro virtual machine
- Oracle VirtualBox
- Device: `WIN11-INTUNE01`
- Test user: `jcarter`

## Initial Problem

`WIN11-INTUNE01` successfully joined Microsoft Entra ID, but the device did not appear as managed by Microsoft Intune.

Running:

```cmd
dsregcmd /status
```

confirmed:

```text
AzureAdJoined : YES
DomainJoined  : NO
```

The device therefore had a valid Entra identity, but MDM enrollment had not completed.

## Investigation

### 1. Checked Intune automatic enrollment

The tenant's MDM user scope was initially configured as:

```text
None
```

This meant users could join devices to Entra ID without the devices automatically enrolling into Intune.

I changed the MDM user scope to:

```text
All
```

After restarting the Windows VM, `dsregcmd /status` showed that the MDM discovery URLs were now populated.

### 2. Verified user authentication

The SSO section of `dsregcmd /status` showed:

```text
AzureAdPrt : YES
```

This confirmed that the signed-in user had a valid Microsoft Entra Primary Refresh Token and that authentication was functioning correctly.

### 3. Investigated MDM event logs

I checked:

```text
Event Viewer
Applications and Services Logs
Microsoft
Windows
DeviceManagement-Enterprise-Diagnostics-Provider
Admin
```

Event ID **844** showed Windows detecting and cleaning up a bad MDM enrollment.

This suggested that an invalid or incomplete enrollment state existed, although the event alone was not treated as the root cause.

### 4. Checked EnterpriseMgmt scheduled tasks

I checked:

```text
Task Scheduler
Microsoft
Windows
EnterpriseMgmt
```

The location was initially empty.

This supported the conclusion that Intune MDM enrollment had not completed successfully.

## Resolution

Because the device was already correctly joined to Entra ID, I avoided rebuilding or rejoining the VM.

Instead, I used:

```text
Settings
Accounts
Access work or school
Enroll only in device management
```

I authenticated using the test account:

```text
jcarter@kaineitlab.onmicrosoft.com
```

Windows then completed the MDM enrollment.

## Verification

After enrollment:

- `WIN11-INTUNE01` appeared correctly in Microsoft Entra ID
- MDM showed **Microsoft Intune**
- The device showed as **Compliant**
- EnterpriseMgmt scheduled tasks were created
- Windows displayed Intune management information under Access work or school

The device was now both:

```text
Microsoft Entra joined
Microsoft Intune managed
```

## Root Cause

The Windows device was originally Entra joined while the Intune MDM user scope was configured as **None**.

This allowed the device identity to be created in Entra ID, but automatic Intune enrollment did not occur.

Changing the MDM scope enabled enrollment, but the existing device still required manual MDM enrollment to complete the management relationship.

## Skills Demonstrated

- Microsoft Entra device troubleshooting
- Microsoft Intune enrollment
- `dsregcmd /status`
- Primary Refresh Token verification
- Windows Event Viewer analysis
- MDM troubleshooting
- Task Scheduler investigation
- Identifying Entra join and Intune enrollment as separate processes
- Evidence-based troubleshooting without immediately rebuilding a device

## Key Takeaway

A device being Microsoft Entra joined does not automatically mean it is Microsoft Intune managed.

When troubleshooting enrollment, I would separately verify:

1. Entra join state
2. User authentication and PRT
3. MDM enrollment configuration
4. Device management event logs
5. Intune management tasks
6. Device status in both Entra ID and Intune