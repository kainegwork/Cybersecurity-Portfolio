# Phishing SOC Simulator Investigation

## Overview

I completed a SOC simulation on TryHackMe involving the investigation and triage of five security alerts.

The alerts included potentially malicious emails and suspicious web activity. My role was to investigate the available evidence, determine whether each alert was a true or false positive, and escalate activity where appropriate.

This lab gave me practical experience of the basic investigation process that a SOC analyst may follow when responding to security alerts.

## Tools Used

- TryHackMe SOC Simulator
- TryDetectMe
- SIEM
- Security event and email logs

## Investigation Process

### 1. Alert Triage

I investigated five alerts that had been generated for potentially suspicious activity.

Rather than assuming that every alert represented malicious activity, I reviewed the available evidence to determine whether each alert was a true or false positive.

### 2. Phishing Email Investigation

Several alerts involved potentially malicious emails.

I checked information such as:

- Sender email addresses
- URLs contained within emails
- Source and destination information
- Related SIEM events

Some sender addresses attempted to imitate legitimate organisations. For example, an address used a name similar to "Microsoft" but replaced characters to make the address appear legitimate at first glance.

This demonstrated the importance of carefully checking sender information rather than relying on how an address initially appears.

### 3. URL and IP Reputation Checks

I extracted suspicious URLs and IP addresses from the alerts and checked them using TryDetectMe.

Some of the indicators were identified as malicious, providing additional evidence that the associated activity should be treated as suspicious.

This showed me how threat intelligence and reputation information can be combined with alert data when making a triage decision.

### 4. SIEM Investigation

I used the SIEM to examine events associated with the alerts.

The logs contained information including:

- When emails were sent
- Sender information
- Recipient information
- Other network and system activity occurring around the same time

There was also a large amount of normal traffic in the logs, so I had to identify which events were relevant to the alert rather than treating all activity as suspicious.

### 5. True and False Positives

The five alerts contained both true positives and false positives.

For each alert, I used the available evidence to decide whether the activity represented a genuine security concern.

This reinforced that an alert itself does not necessarily mean malicious activity has occurred and that alerts need to be investigated before a decision is made.

### 6. Escalation

One alert involved a user attempting to access a blacklisted website.

Unlike the phishing-related alerts, this activity did not originate from an external email. The evidence indicated that the user had attempted to access the blacklisted resource directly.

After reviewing the available evidence, I classified the activity as suspicious and escalated the alert for further investigation.

## Investigation Workflow

My general investigation process during the simulation was:

1. Review the security alert.
2. Identify potentially suspicious indicators.
3. Examine the sender and recipient information where email was involved.
4. Check suspicious URLs and IP addresses using TryDetectMe.
5. Search the SIEM for relevant activity.
6. Separate relevant events from normal background traffic.
7. Correlate the available evidence.
8. Determine whether the alert was a true or false positive.
9. Escalate suspicious activity where appropriate.

## Skills Practised

- SOC alert triage
- Phishing investigation
- SIEM log analysis
- URL reputation analysis
- IP reputation analysis
- Indicator of Compromise (IOC) investigation
- Distinguishing relevant events from normal traffic
- True-positive and false-positive classification
- Security alert escalation
- Evidence-based investigation

## What I Learned

The main lesson I took from this simulation was that a security alert should be treated as the beginning of an investigation rather than proof that malicious activity has occurred.

I also gained experience correlating information from different sources. A suspicious sender address, URL reputation result, IP reputation result or SIEM event may not provide the complete answer individually, but combining the evidence makes it easier to make a justified decision.

The simulation also showed me the importance of filtering out normal activity when investigating SIEM logs, as relevant security events can appear alongside a large amount of legitimate traffic.
