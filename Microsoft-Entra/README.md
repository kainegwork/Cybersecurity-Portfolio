# Microsoft 365, Entra ID and Intune

## Overview

This section documents my practical work with Microsoft 365, Microsoft Entra ID and Microsoft Intune.

The labs focus on cloud identity, endpoint management, application deployment, device compliance, Conditional Access and Windows Update management.

Rather than only studying the concepts, I built a Microsoft 365 Business Premium lab tenant and used a Windows 11 virtual machine to configure, test, troubleshoot and verify real management scenarios.

## Lab Environment

- Microsoft 365 Business Premium
- Microsoft Entra ID
- Microsoft Intune
- Windows 11 Pro
- Oracle VirtualBox
- Test device: `WIN11-INTUNE01`
- Test user: `jcarter`
- Test device group: `Intune-Test-Devices`

## Practical Labs

### [Intune Enrollment Troubleshooting](./Intune-Enrollment-Troubleshooting/)

Troubleshot a Windows 11 device that was successfully Microsoft Entra joined but was not enrolled into Intune.

Key areas included:

- `dsregcmd /status`
- Entra join state
- Primary Refresh Token verification
- MDM user scope
- MDM event logs
- EnterpriseMgmt scheduled tasks
- Manual MDM enrollment
- Verification of Intune management and compliance

---

### [Win32 App Deployment](./Win32-App-Deployment/)

Packaged and deployed 7-Zip as a Win32 application using Microsoft Intune.

The lab included:

- Microsoft Win32 Content Prep Tool
- `.intunewin` packaging
- Silent install and uninstall commands
- System-context installation
- Detection rules
- Required assignments
- Intune Management Extension logs
- Troubleshooting an incorrect detection path
- Troubleshooting an incorrect install command

---

### [Device Compliance and Conditional Access](./Compliance-and-Conditional-Access/)

Created an Intune compliance policy and used the compliance result as a Microsoft Entra Conditional Access requirement.

The final test demonstrated:

```text
Compliant Intune-managed device
        ↓
Access allowed
```

versus:

```text
Unmanaged / noncompliant device
        ↓
Access blocked
```

Areas covered included:

- BitLocker compliance
- TPM
- Firewall
- Antivirus
- Conditional Access
- Report-only testing
- What If analysis
- MFA
- Sign-in logs
- Conditional Access error code `53000`
- Emergency access planning

---

### [Windows Update Management](./Windows-Update-Management/)

Created and deployed a pilot Windows Update ring to a managed Windows 11 device.

Areas covered included:

- Pilot device groups
- Quality update deferrals
- Feature update deferrals
- Active hours
- Update deadlines
- Restart grace periods
- MDM policy verification
- Intune deployment reporting

## Microsoft Entra ID Fundamentals

### Users and Groups

Microsoft Entra ID provides cloud-based identity and access management.

Users can be organised into groups to simplify access and policy management.

Security groups can be used to target:

- Microsoft Intune policies
- Applications
- Device configurations
- Conditional Access policies
- Permissions

During the labs I used assigned security groups including:

```text
Sales-Users
Intune-Test-Devices
Emergency-Access-Accounts
```

## Microsoft 365 Licensing

A Microsoft Entra identity does not automatically provide access to Microsoft 365 services.

Users also require the appropriate Microsoft 365 licence.

Licences can provide services including:

- Exchange Online
- Microsoft Teams
- OneDrive
- SharePoint
- Microsoft 365 desktop applications
- Microsoft Intune

When troubleshooting service access, I would check:

1. Whether the user can authenticate successfully.
2. Whether the correct licence is assigned.
3. Whether the required service plan is enabled.
4. Whether Conditional Access is affecting the sign-in.
5. Whether the device meets required compliance conditions.

## User Offboarding

When an employee leaves an organisation, access should be removed in a controlled way.

A typical process may include:

1. Block the user's sign-in.
2. Revoke active sessions.
3. Remove group memberships.
4. Remove application and resource access.
5. Remove or reassign Microsoft 365 licences.
6. Preserve or transfer required business data.
7. Delete the account when appropriate and in line with company policy.

The key principle is to disable access first, then handle permissions, licences and data safely.

## Skills Developed

Through these labs I have practised:

- Microsoft Entra user and group administration
- Microsoft 365 licensing
- Microsoft Intune endpoint management
- Windows device enrollment
- MDM troubleshooting
- Win32 application packaging and deployment
- Intune Management Extension log analysis
- Device compliance
- Conditional Access
- MFA
- Microsoft Entra sign-in log investigation
- Windows Update rings
- Policy assignment and verification
- Troubleshooting using both cloud-side and endpoint-side evidence