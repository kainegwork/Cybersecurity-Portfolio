# Phishing SOC Simulator Investigation

## Overview

I completed a SOC simulation on TryHackMe involving the investigation and triage of five security alerts.

The alerts included potentially malicious emails and suspicious web activity. My role was to review the available evidence, determine whether each alert was a true or false positive, and escalate suspicious activity where appropriate.

This lab gave me practical experience with the structured investigation process used in security operations.

## Tools Used

- TryHackMe SOC Simulator
- TryDetectMe
- SIEM
- Security event and email logs

## Investigation Process

### 1. Alert Triage

I reviewed five security alerts and assessed each one based on the available evidence rather than assuming that every alert represented malicious activity.

### 2. Phishing Email Investigation

Several alerts involved potentially malicious emails.

I examined:

- Sender email addresses
- URLs contained within emails
- Source and destination information
- Related SIEM events

Some sender addresses attempted to imitate legitimate organisations by using visually similar characters. This reinforced the importance of checking sender details carefully rather than relying on how an address first appears.

### 3. URL and IP Reputation Checks

I extracted suspicious URLs and IP addresses from the alerts and checked them using TryDetectMe.

Where indicators were identified as malicious, I used that reputation information alongside the alert data as supporting evidence rather than treating it as the sole basis for a decision.

### 4. SIEM Investigation

I used the SIEM to examine activity associated with each alert.

The available logs included:

- Email timestamps
- Sender and recipient information
- Related network and system activity

Because the logs also contained a large amount of legitimate background traffic, I had to identify which events were relevant to the alert and correlate them with other evidence.

### 5. Classification and Escalation

The alerts included both true positives and false positives.

For each alert, I correlated the available evidence before deciding whether the activity represented a genuine security concern.

One alert involved a user attempting to access a blacklisted website directly. After reviewing the related evidence, I classified the activity as suspicious and escalated it for further investigation.

## Investigation Workflow

My general workflow during the simulation was:

1. Review the alert.
2. Identify suspicious indicators.
3. Examine sender and recipient information where email was involved.
4. Check suspicious URLs and IP addresses using TryDetectMe.
5. Search the SIEM for related activity.
6. Separate relevant events from normal background traffic.
7. Correlate the evidence.
8. Classify the alert as a true or false positive.
9. Escalate suspicious activity where appropriate.

## Skills Practised

- SOC alert triage
- Phishing investigation
- SIEM log analysis
- URL and IP reputation analysis
- Indicator of Compromise (IOC) investigation
- True-positive and false-positive classification
- Security alert escalation
- Evidence correlation
- Distinguishing relevant events from normal traffic

## What I Learned

The main lesson from this simulation was that a security alert should be treated as the beginning of an investigation rather than proof that malicious activity has occurred.

I also gained experience combining evidence from multiple sources. Sender details, reputation checks and SIEM events can each provide useful context, but the strongest decisions come from correlating them rather than relying on any single indicator.

The exercise also reinforced the importance of filtering normal activity from security-relevant events when working with SIEM data.
