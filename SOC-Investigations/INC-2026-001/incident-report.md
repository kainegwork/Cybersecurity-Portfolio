# Incident Report — INC-2026-001

**Date:** 8 November 2026  
**Incident type:** Suspected account compromise and session hijacking, with unauthorised Microsoft 365 access  
**Severity:** High; escalation to Critical recommended due to the sensitive data involved  
**Status at handover:** Containment in progress; further forensic work and recovery required

## Incident summary

Our SIEM flagged suspicious sign-in activity against Sarah Mitchell's account from Romania. There were seven failed password attempts followed by an attempt where the correct password was entered, but MFA was denied.

When reviewing the Entra sign-in logs, I found successful authentication activity from an unmanaged Windows 11 device in Amsterdam. There was no new password or MFA challenge recorded for that activity. I wanted to understand how the authentication had been completed, so I checked the existing sessions and the authentication records.

I then checked the endpoint security logs from Sarah's work laptop. These showed that a downloaded executable called `InvoiceViewer.exe` had launched PowerShell. The recovered script logs showed browser cookies and local storage being copied, archived and sent to an external server. My main suspicion was that the attacker may have obtained authentication data from the browser and used it to hijack a session. We did not conclusively prove that mechanism.

Microsoft 365 audit logs then showed unauthorised access to finance-related emails and successful downloads of two SharePoint files containing sensitive supplier and employee information. The incident was escalated for further investigation and a data breach assessment.

## Key evidence

1. **Entra ID:** Seven failed passwords and a correct-password attempt from Romania, with MFA denied and no authenticated session established from that attempt.
2. **Unrecognised activity:** Successful authentication from Amsterdam on an unmanaged Windows device, with an earlier MFA-satisfied authentication context but no new MFA challenge recorded.
3. **Endpoint:** `InvoiceViewer.exe` launched a hidden PowerShell process from the user's Downloads folder.
4. **PowerShell and proxy:** Script logs showed browser data being copied and archived. A proxy record showed an HTTPS POST with approximately 180 KB in the request body to an external endpoint.
5. **Microsoft 365:** Audit records showed mailbox activity, a blocked attempt to create an external forwarding rule, and successful SharePoint downloads.
6. **Affected files:** `Supplier_Payment_Details_2026.xlsx` contained supplier financial information, including records relating to sole traders. `Employee_Payroll_Oct2026.xlsx` contained information relating to 86 employees, including addresses, National Insurance numbers and bank details.

## Assessment

I assessed this as a compromised Microsoft 365 account with suspected browser-session hijacking. The evidence strongly supports unauthorised access to the account and downloads of sensitive files from the suspicious source. The exact way the Amsterdam authentication was established remains under investigation, and the available logs do not conclusively prove a stolen cookie or token was used.

The exposure of personal and financial information meant that the Data Protection Officer and Legal team needed to assess regulatory and contractual notification requirements. I would not make those notification decisions independently as a Tier 1 analyst.

## Containment and escalation

The following actions were approved or initiated during the simulation:

- Account sign-ins were blocked.
- Session revocation was initiated, but its effectiveness still needed verification.
- Sarah's laptop was isolated using Microsoft Defender for Endpoint.
- The incident was escalated to the Incident Response Lead.
- Finance, HR, Legal and the Data Protection Officer were involved in assessing the information at risk.

## Recommended next steps

- Confirm that sessions have been revoked and check for any further suspicious authentication.
- Reset the user's credentials using a trusted recovery process and review MFA methods.
- Preserve endpoint evidence, investigate additional malware activity and check for persistence or lateral movement.
- Search other company devices for related file hashes, domains and PowerShell behaviour.
- Investigate why the unmanaged device was permitted access and review Conditional Access and device-based restrictions.
- Assess whether the laptop should be reimaged before being returned to use.
- Complete the personal data breach risk assessment, including possible notifications to affected individuals, regulators and suppliers where required.
- Review user awareness training, download protection and endpoint detection controls.

## What I learned

This investigation showed me why it's important to follow the evidence instead of jumping straight to a conclusion. The Romanian MFA failure was the original alert, but the more serious activity involved an earlier session from Amsterdam. Checking identity, endpoint and Microsoft 365 audit logs together was what helped establish the likely sequence of events and the impact.

> **Simulation only:** All evidence and entities in this report are fictional. The report describes decisions made in a guided SOC exercise, not actions performed against a real environment.
