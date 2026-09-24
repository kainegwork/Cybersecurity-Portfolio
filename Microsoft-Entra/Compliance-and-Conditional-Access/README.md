# Device Compliance and Conditional Access

## Overview

This lab documents the creation of a Microsoft Intune compliance policy and its integration with Microsoft Entra Conditional Access.

The objective was to require a managed Windows device to meet defined security requirements before allowing access to Microsoft 365 resources.

The final test demonstrated that:

- A compliant Intune-managed Windows device was allowed access.
- An unmanaged Windows device using the same user account was blocked.

## Environment

- Microsoft Entra ID
- Microsoft Intune
- Microsoft 365 Business Premium
- Windows 11 Pro
- Managed device: `WIN11-INTUNE01`
- Test user: `jcarter`
- Test device group: `Intune-Test-Devices`

## Compliance Policy

I created a Windows 10/11 compliance policy in Microsoft Intune.

The policy evaluated the following security requirements:

```text
BitLocker: Required
Firewall: Required
TPM: Required
Antivirus: Required
Antispyware: Required
```

The policy was assigned to:

```text
Intune-Test-Devices
```

After synchronising the managed Windows device, Intune evaluated:

```text
WIN11-INTUNE01
```

as:

```text
Compliant
```

This confirmed that the endpoint met the defined security requirements.

## Configuration vs Compliance

This lab reinforced the difference between two important Intune concepts.

A configuration policy is used to:

```text
Configure a device to behave in a particular way.
```

A compliance policy is used to:

```text
Evaluate whether the device meets defined requirements.
```

The compliance result can then be used by Microsoft Entra Conditional Access when making access decisions.

## Conditional Access Policy

I created a Conditional Access policy named:

```text
CA - Require Compliant Device - Lab
```

The policy was configured to target:

```text
User:
James Carter

Platform:
Windows

Target resources:
Microsoft 365 / Office 365

Grant control:
Require device to be marked as compliant
```

The policy was initially placed into:

```text
Report-only
```

mode so that its behaviour could be evaluated before enforcement.

## Testing with What If

Before enabling the policy, I used the Microsoft Entra Conditional Access **What If** tool.

The test was performed using:

```text
User:
James Carter

Cloud resource:
Office 365 Exchange Online

Platform:
Windows

Client:
Browser
```

The result confirmed that:

```text
CA - Require Compliant Device - Lab
```

would apply to the sign-in.

This allowed the policy logic to be verified before enforcement.

## Conditional Access Safety

During testing, administrator access was protected by keeping administrative sessions open and using exclusions while policies were being validated.

Dedicated emergency-access accounts were also created and placed into:

```text
Emergency-Access-Accounts
```

This group was excluded from organisation-controlled Conditional Access policies intended for normal users and administrators.

The exercise demonstrated why Conditional Access policies should be tested carefully before being enabled.

## Enforcement Test

After validating the policy, it was changed from:

```text
Report-only
```

to:

```text
On
```

Two sign-in scenarios were then tested using the same account.

## Test 1 - Intune Managed and Compliant Device

James signed into Microsoft 365 from:

```text
WIN11-INTUNE01
```

The device was:

```text
Microsoft Entra joined
Microsoft Intune managed
Compliant
```

The sign-in succeeded.

The Conditional Access sign-in log showed:

```text
CA - Require Compliant Device - Lab
Result: Success
```

This confirmed that the compliant device satisfied the Conditional Access grant requirement.

## Test 2 - Unmanaged Device

The same James Carter account was then used from a separate Windows computer that was not managed by Intune.

Authentication succeeded, including the MFA requirement, but access to the Microsoft 365 resource was denied.

Microsoft Entra reported:

```text
Error code: 53000
```

with the failure reason indicating that the Conditional Access policy required a compliant device and the device did not satisfy that requirement.

The Conditional Access log showed:

```text
CA - Require Compliant Device - Lab
Result: Failure
```

## Analysis

The unmanaged-device failure demonstrated that authentication alone was not enough to gain access.

James successfully authenticated and satisfied the MFA requirement, but Conditional Access independently evaluated the security state of the endpoint.

The access decision therefore became:

```text
Valid user + compliant device = Access allowed
```

versus:

```text
Valid user + unmanaged/noncompliant device = Access denied
```

This demonstrated how Microsoft Entra and Intune can combine identity and endpoint security when making access decisions.

## Skills Demonstrated

- Microsoft Intune compliance policies
- BitLocker compliance
- TPM compliance
- Firewall and antivirus compliance
- Microsoft Entra Conditional Access
- Report-only policy testing
- Conditional Access What If tool
- Device-based access controls
- Microsoft 365 access protection
- Sign-in log investigation
- MFA and device-compliance troubleshooting
- Error code analysis
- Emergency-access planning
- Safe Conditional Access deployment

## Key Takeaway

Conditional Access can make access decisions using more than just a username and password.

By combining Microsoft Entra identity with Microsoft Intune device compliance, an organisation can require users to access company resources only from devices that meet defined security standards.

When investigating a Conditional Access failure, I would check:

1. User authentication result
2. MFA result
3. Device identity
4. Intune enrollment status
5. Device compliance state
6. Targeted Conditional Access policies
7. Grant controls
8. Microsoft Entra sign-in logs
9. Conditional Access failure codes