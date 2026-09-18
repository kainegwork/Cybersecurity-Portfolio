# Troubleshooting Methodology

## Overview

Effective troubleshooting should follow a clear, repeatable process rather than rely on guesswork.

My general approach is:

```text
Identify → Establish impact → Gather information → Isolate → Test → Resolve → Verify → Document
```

## 1. Identify the Issue

Start by understanding exactly what the user is experiencing.

Useful questions include:

- What are they trying to do?
- What happens when they attempt it?
- When did the issue begin?
- Is an error message displayed?
- Has the task worked before?
- Has anything changed recently?

## 2. Establish Impact

Determine how widely the issue is affecting the business.

For example, it may affect:

- One user
- Several users
- A single department
- The entire organisation

If multiple users are affected, the problem may relate to a wider infrastructure or service issue rather than an individual device.

Impact also helps determine how urgently the issue should be handled.

## 3. Gather Information

Collect the technical details needed to investigate the problem, such as:

- Device
- Operating system
- Username or account
- Application or service
- Network connection
- Error messages
- Recent changes
- Approximate time the issue began

Good information gathering reduces unnecessary troubleshooting and makes it easier to reproduce the issue.

## 4. Isolate the Problem

Identify which part of the system may be causing the issue.

For example, when investigating an internet connection problem, I might work through:

```text
Device
↓
Network adapter
↓
IP configuration
↓
Local network
↓
Default gateway
↓
DNS
↓
Internet
↓
Application
```

Checking each stage helps narrow down where the failure is occurring.

## 5. Test

Where possible, make one change at a time and record the outcome.

Changing several unrelated settings at once can make it difficult to identify which action fixed the problem or caused a new one.

Tests should be chosen based on the evidence already gathered rather than at random.

## 6. Resolve

Apply a suitable fix based on the identified cause.

The solution should be proportionate to the issue and carried out in line with organisational procedures and the technician's level of access.

## 7. Verify

After applying the fix, confirm that:

- The original issue has been resolved.
- The user can complete the task they were trying to perform.
- No additional problems have been introduced.
- Any affected service is working as expected.

## 8. Document

Record:

- Symptoms
- Impact
- Investigation carried out
- Tests performed
- Findings
- Resolution
- Preventative or follow-up actions
- Escalation details where relevant

Clear documentation means another technician can understand what happened and what was done without having to repeat the entire investigation.

## Escalation

If the issue is outside my access level, experience or responsibility, I would escalate it with the relevant evidence already gathered.

A good escalation should make it easier for the next technician to continue the investigation rather than starting again from the beginning.

## Key Principle

The aim is not to try as many fixes as possible. It is to make the smallest appropriate change based on the strongest available evidence, then verify the result.
