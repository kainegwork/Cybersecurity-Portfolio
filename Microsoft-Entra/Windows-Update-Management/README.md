# Windows Update Management with Microsoft Intune

## Overview

This lab documents the creation, deployment, and verification of a Windows Update ring using Microsoft Intune.

The goal was to create a pilot update ring for managed Windows devices so that updates could be tested on a small group before wider deployment.

## Environment

- Microsoft Intune
- Microsoft Entra ID
- Windows 11 Pro
- Device: `WIN11-INTUNE01`
- Device group: `Intune-Test-Devices`

## Update Ring

I created an Intune update ring named:

```text
Windows - Update Ring - Pilot
```

The ring was assigned only to:

```text
Intune-Test-Devices
```

This limited the deployment to the test device rather than every Windows device in the tenant.

## Update Configuration

The pilot ring was configured with:

```text
Microsoft product updates: Allow
Windows drivers: Block

Quality update deferral: 0 days
Feature update deferral: 14 days

Feature update uninstall period: 10 days
Pre-release builds: Not configured
```

The aim was to receive security and quality updates quickly while delaying major feature updates long enough to identify potential issues.

## User Experience Settings

The update experience was configured as:

```text
Automatic update behaviour:
Auto install at maintenance time

Active hours:
08:00 - 20:00

Windows Update pause option:
Disabled

Windows Update check option:
Enabled

Notifications:
Default Windows Update notifications
```

Active hours were configured to reduce the chance of automatic restarts during normal working hours.

## Update Deadlines

Deadline settings were enabled to prevent updates from being postponed indefinitely.

```text
Feature update deadline: 7 days
Quality update deadline: 3 days
Grace period: 2 days
Auto reboot before deadline: Yes
```

This provides users with some flexibility while still ensuring required updates are eventually installed.

## Deployment

The update ring was assigned to:

```text
Intune-Test-Devices
```

`WIN11-INTUNE01` was then manually synchronised with Intune.

## Endpoint Verification

On the Windows device, I checked:

```text
Settings
Windows Update
Advanced options
Configured update policies
```

Windows displayed the settings delivered through:

```text
Mobile Device Management
```

The device showed:

```text
Feature update deferral: 14 days
Quality update deadline: 3 days
Feature update deadline: 7 days
Grace period: 2 days
Active hours: 08:00 - 20:00
```

This independently confirmed that the Intune policy had reached the endpoint.

## Intune Verification

After Intune completed its reporting cycle, the update ring showed:

```text
Succeeded: 1
Error: 0
Conflict: 0
Not applicable: 0
In progress: 0
```

`WIN11-INTUNE01` reported:

```text
Check-in status: Success
```

This confirmed successful deployment from the Intune side.

## Update History

During the lab, Windows also installed a security update successfully.

This was useful for confirming that Windows Update itself was functioning, although the update installation was not treated as proof that the newly created update ring had triggered it.

The policy was verified separately through the configured update settings and Intune reporting.

## Skills Demonstrated

- Microsoft Intune Windows Update management
- Windows Update rings
- Pilot deployment groups
- Quality update deferrals
- Feature update deferrals
- Active hours
- Update deadlines
- Restart grace periods
- Device assignment
- Manual Intune synchronisation
- Endpoint-side policy verification
- Intune deployment reporting

## Key Takeaway

Successful update management requires more than confirming that Windows installed an update.

I verified the deployment in two places:

1. Microsoft Intune reported that the policy was successfully applied.
2. Windows showed the configured update settings as delivered through MDM.

This provides stronger evidence that the update-management policy itself was working correctly.