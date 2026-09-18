# Windows Troubleshooting with Event Viewer



## Overview



In this lab I practised troubleshooting Windows 11 issues using Event Viewer and built-in PowerShell tools.



The aim was to work through real system warnings and errors rather than just reading about them. I filtered Windows System logs, investigated several different Event IDs, checked related services and system settings, and worked out which events actually needed attention.



This helped me practise the same kind of troubleshooting process I would use in an IT support role: identify the issue, gather evidence, check the relevant service or feature, and decide whether further action is required.



## Tools Used



- Windows 11

- Event Viewer

- PowerShell

- Windows Services

- File Explorer


## Investigation 1 - Filtering the Windows System Log



I started by opening \*\*Event Viewer\*\* and looking at the Windows \*\*System\*\* log.



Rather than trying to work through every event, I filtered the log to focus on \*\*Warnings and Errors\*\*. This made it much easier to identify events that might actually be relevant to a user-facing problem.



One of the events I investigated was:



- **Source:** TPM-WMI

- **Event ID:** 1801



Because the event related to the TPM and device security, I checked the system's BitLocker status using PowerShell with the command:



`Get-BitLockerVolume`



The Windows volume showed as **FullyEncrypted**, confirming that BitLocker was enabled and the drive was still correctly encrypted.



This was useful because it showed that an Event Viewer warning does not automatically mean a feature is broken. I used another source of information to verify the current state of the system before deciding whether any action was needed.



### What I learned



- Event Viewer can contain warnings even when the related Windows feature is working normally.

- Logs should be treated as evidence rather than a diagnosis on their own.

- PowerShell can be used to verify the current state of Windows features.

- Troubleshooting should involve confirming whether there is an actual user impact before making changes.



## Investigation 2 - Bluetooth Event Warning



Another warning I investigated was:



- **Source:** BTHUSB

- **Event ID:** 16



This event related to the Windows Bluetooth USB driver.



I checked whether Bluetooth was currently working normally and whether there were any obvious user-facing problems. Because the Bluetooth functionality was working, I treated the warning as something to investigate rather than assuming it represented a current fault.



This reinforced the importance of checking the actual state of the system alongside Event Viewer logs.



### What I learned



- A warning in Event Viewer does not always mean there is an active problem.

- Hardware and driver-related events should be compared against the actual behaviour of the device.

- Troubleshooting should focus on current symptoms and evidence, not just individual log entries.

- Avoiding unnecessary changes is part of good troubleshooting.



## Investigation 3 - BitLocker Driver Warning



I also investigated a BitLocker-related event:



- **Source:** BitLocker-Driver

- **Event ID:** 24641



Because the warning related to drive encryption, I checked the current BitLocker status rather than assuming the drive was in an unsafe state.



Using PowerShell, I confirmed that the Windows volume was still shown as \*\*FullyEncrypted\*\*.



This gave me a clearer picture of the system than relying on the Event Viewer warning by itself.



### What I learned



- Security-related warnings should be verified against the current state of the system.

- PowerShell can be useful for checking whether Windows security features are actually enabled and functioning.

- Event Viewer entries need context before deciding whether action is required.

- A warning can represent a past or temporary condition rather than a current failure.



## Investigation 4 - Service Control Manager Timeout



I then investigated a Service Control Manager error:



- **Source:** Service Control Manager

- **Event ID:** 7011

- **Service:** HPAppHelperCapService



The event showed that Windows had reached a timeout while waiting for a response from the service.



I checked the service in Windows Services and confirmed that it was:



- **Status:** Running

- **Startup type:** Automatic



I also checked the service executable path to make sure it pointed to the expected HP application location.



Because the service was running normally and there were no recent repeat errors, I did not make any unnecessary changes.



### What I learned



- A service can generate a timeout error even if it later starts and runs normally.

- Checking both **service status** and **startup type** gives a better picture than looking at one value alone.

- Verifying the executable path can help confirm that the expected program is being launched.

- Not every logged error needs immediate remediation if the service is currently healthy and the problem is not recurring.

- Good troubleshooting includes knowing when not to change a working system.



## Overall Troubleshooting Process



Across these investigations I used the same basic troubleshooting approach:



1. Identify the warning or error in Event Viewer.

2. Check whether there is an actual user-facing problem.

3. Verify the current state of the affected service or Windows feature.

4. Use additional tools such as PowerShell or Windows Services to gather more evidence.

5. Avoid making unnecessary changes when the system is already working correctly.

6. Keep monitoring if the issue appears to be temporary or non-recurring.



## Key Takeaways



This lab helped me understand that Event Viewer is useful for finding evidence, but individual warnings and errors should not be treated as a diagnosis on their own.



The most useful lesson was learning to confirm the current state of the system before making changes. This reduces the chance of causing additional problems while troubleshooting.



It also gave me more practical experience with Windows support tools that would be useful in a helpdesk or service desk environment, including Event Viewer, PowerShell and Windows Services.



