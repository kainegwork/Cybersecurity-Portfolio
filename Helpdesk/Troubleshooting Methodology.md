# Troubleshooting Methodology
## Overview
Effective troubleshooting should follow a clear, repeatable process rather than rely on guesswork.

My usual approach is:

Identify → Gather information → Isolate → Test → Resolve → Verify → Document

1. Identify

Start by understanding exactly what the user is experiencing.

Useful questions include:
- What are they trying to do?
- What happens when they attempt it?
- When did the issue begin?
- Is an error message displayed?
- Has the task worked before?
- Has anything changed recently?
  
2. Establish Impact

Next, determine how widely the issue is affecting the business.

For example, it may affect:

One user
Several users
A single department
The entire organisation

If multiple users are affected, the problem may be related to a wider infrastructure or service issue rather than an individual device.

3. Gather Information

Collect the technical details needed to investigate the problem, including:

Device
Operating system
Username or account
Application
Network connection
Error messages
Recent changes
Approximate time the issue began

4. Isolate the Problem

Identify which part of the system may be causing the issue.

For example, when investigating an internet connection problem, I would consider each stage in the connection:

Device
↓
Network adapter
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

Checking each layer helps narrow down where the failure is occurring.

5. Test

Where possible, make one change at a time and record the outcome.

Making several unrelated changes at once can make it difficult to determine which action fixed the problem or caused a new one.

6. Resolve

Apply a suitable fix based on the evidence gathered during the investigation.

The solution should be proportionate to the issue and carried out in line with organisational procedures.

7. Verify

After applying the fix, confirm that:
- The original issue has been resolved.
- The user can complete the task they were trying to perform.
- No additional problems have been introduced.

8. Document

Record the following:
- Symptoms
- Investigation carried out
- Tests performed
- Findings
- Resolution
Preventative or follow-up actions

Clear documentation means another technician can understand what happened and what was done without having to repeat the entire investigation.
