# Evidence Timeline — INC-2026-001

All times are UTC on **8 November 2026**. These are fictional training records.

| Time | Source | Event | Why it mattered |
|---|---|---|---|
| 09:12 | Entra ID | Sarah signed in on a compliant company laptop and completed MFA. | Established an earlier legitimate authentication context. |
| 12:44–12:49 | Endpoint telemetry | Browser visited an external document-sharing site; ZIP downloaded and extracted. | Showed activity leading up to executable launch. |
| 12:51 | Defender for Endpoint | `InvoiceViewer.exe` launched from Downloads. | Identified the suspicious executable. |
| 12:52 | PowerShell event 4104 | PowerShell copied Edge cookies and local-storage data and created an archive. | Evidence of browser-data collection. |
| 12:53 | Endpoint and proxy logs | PowerShell made an HTTPS POST to an external server. | Evidence supporting an outbound data transfer. |
| 13:56 | Entra ID | Successful non-interactive authentication from Amsterdam with an earlier MFA-satisfied context. | Raised questions about how authentication was reused. |
| 13:57 | Entra ID | Unrecognised Microsoft 365 session established on an unmanaged Windows device. | Confirmed access from a device the user did not recognise. |
| 14:01–14:03 | Microsoft 365 audit | Finance-related email access and mailbox searches. | Indicated the suspicious session was being used. |
| 14:08 | SharePoint audit | `Supplier_Payment_Details_2026.xlsx` downloaded successfully. | Potential exposure of supplier payment and personal information. |
| 14:11 | Exchange audit | External forwarding-rule creation attempted and blocked. | Suggested an attempt to maintain access to future email content. |
| 14:16–14:18 | Entra and Exchange audit | Additional authentication and mailbox activity from Amsterdam. | Extended the known scope of activity. |
| 14:22–14:23 | Entra and SharePoint audit | Further authentication and successful download of `Employee_Payroll_Oct2026.xlsx`. | Expanded potential impact to 86 employee records. |
| 14:24–14:29 | Entra ID | Seven invalid-password attempts from Romania. | Triggered the original suspicious sign-in alert. |
| 14:31 | Entra ID | Correct password supplied from Romania, but MFA denied. | Suggested password compromise, without access from that attempt. |
| 14:39 | Incident response | Account sign-ins blocked. | Restricted new interactive access. |
| 14:51 | Incident response | Session revocation initiated. | Required follow-up verification of effective invalidation. |
| 15:05 | Defender for Endpoint | Sarah's work laptop isolated. | Restricted further endpoint communications. |
| 15:18 onwards | Incident response / DPO / Legal | Incident escalated and sensitive-file review requested. | Supported business impact and notification assessment. |

## Evidence limitations

- The original SIEM alert did not identify the earlier Amsterdam activity by itself.
- The available token metadata did not prove exactly how the unrecognised session obtained its authentication context.
- The browser-data upload and later Amsterdam authentication are strongly suspicious together, but the precise session-theft mechanism remains unconfirmed.
- The Microsoft 365 logs support successful downloads; they do not by themselves establish subsequent use of the downloaded files.
- Three suspicious authentication events from Amsterdam should not automatically be described as three separate hijacked sessions.
