# MITRE ATT&CK Mapping — INC-2026-001

I mapped the observed activity to MITRE ATT&CK as part of the simulated investigation. I've separated directly observed behaviour from techniques that are plausible but not fully confirmed.

| Tactic | Technique | Supporting evidence | Confidence |
|---|---|---|---|
| Execution (TA0002) | [T1059.001 — PowerShell](https://attack.mitre.org/techniques/T1059/001/) | `InvoiceViewer.exe` launched `powershell.exe`; script block events were recovered. | High |
| Credential Access (TA0006) | [T1539 — Steal Web Session Cookie](https://attack.mitre.org/techniques/T1539/) | PowerShell copied Edge cookie and local-storage data. Usable session cookies were not independently recovered. | Suspected |
| Lateral Movement (TA0008) | [T1550.004 — Use Alternate Authentication Material: Web Session Cookie](https://attack.mitre.org/techniques/T1550/004/) | Unrecognised Amsterdam authentication reused an MFA-satisfied context without a new prompt. The exact artefact used is unknown. | Suspected |
| Initial Access / Persistence / Privilege Escalation / Defense Evasion (depending on context) | [T1078.004 — Valid Accounts: Cloud Accounts](https://attack.mitre.org/techniques/T1078/004/) | The suspicious source successfully used Sarah's Microsoft 365 identity. | High for account abuse; initial access method uncertain |
| Collection (TA0009) | [T1530 — Data from Cloud Storage](https://attack.mitre.org/techniques/T1530/) | SharePoint `FileDownloaded` records for the supplier payment and employee payroll spreadsheets. | High |
| Exfiltration (TA0010) | [T1041 — Exfiltration Over C2 Channel](https://attack.mitre.org/techniques/T1041/) | PowerShell sent an archive to an external HTTPS endpoint, but C2-channel use was not established. | Possible; exfiltration observed, specific technique uncertain |

## Additional observations

- **Initial Access (TA0001):** The downloaded ZIP and executable are important, but the original delivery method and full execution chain were not completely established.
- **Defense Evasion (TA0005):** Hidden PowerShell execution and an encoded command are suspicious; more analysis would be needed before making a more specific mapping.
- **Exfiltration:** The PowerShell upload is distinct from SharePoint collection. The audit logs establish successful downloads from cloud storage, but not what happened to those files after download.

## My takeaway

I found it useful to map each piece of activity separately rather than try to assign one technique to the whole incident. For example, collecting browser data is different from using a stolen session cookie, and accessing SharePoint is different from transferring information outside the organisation.

> This mapping is based on fictional case evidence and is intended for training.
