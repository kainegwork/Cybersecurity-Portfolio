# SOC Investigation 001 — Suspected Session Hijacking

**Type:** Simulated SOC investigation  
**Incident ID:** INC-2026-001  
**Environment:** Fictional UK company, Microsoft Entra ID, Microsoft 365 and Defender for Endpoint  
**Date:** 8 November 2026  
**Severity:** High, with a recommendation to review for Critical severity

## Overview

This was a simulated SOC investigation where I worked through the evidence one step at a time and decided what to check next.

The initial alert was for several failed sign-in attempts against a user's Microsoft 365 account from Romania. One attempt used the correct password, but the user rejected the MFA request. While checking the sign-in logs, I found a separate, successful sign-in from an unmanaged Windows device in Amsterdam.

That session didn't require a new password or MFA prompt, which made me want to investigate how it had been authenticated. Endpoint logs from the user's company laptop showed a downloaded executable launching PowerShell. The script collected browser data and sent an archive to an external server. This suggested that stolen browser authentication data may have been used to access Microsoft 365, although the exact method was not proven.

Further investigation found suspicious mailbox activity and successful downloads of supplier payment information and an employee payroll spreadsheet.

## What I investigated

- Entra ID sign-in history and MFA results
- Active and recent sessions, including an unmanaged device
- Authentication and token-related metadata
- Defender for Endpoint process and network events
- PowerShell script block logs
- Microsoft 365 mailbox and SharePoint audit logs
- Potential impact on suppliers and employees

## My response

I recommended blocking the account while the incident was investigated, revoking existing sessions and isolating the affected laptop. I also escalated the potential data breach so that the incident response, Finance, HR, Legal and Data Protection teams could assess the impact.

My main takeaway was the importance of not treating a successful password or MFA-related claim as proof that a session was legitimate. I also had to separate what the logs confirmed from what I suspected had happened.

## Files

- [Incident report](incident-report.md) — Summary, findings, containment and recommendations
- [Evidence timeline](evidence-timeline.md) — Key events in order
- [MITRE ATT&CK mapping](mitre-attack-mapping.md) — Techniques linked to the observed activity

> **Training note:** This is a fictional investigation, not a real company incident. All accounts, addresses, files and events are simulated. The IP addresses are documentation-only examples, and their reported locations are invented for the exercise.
