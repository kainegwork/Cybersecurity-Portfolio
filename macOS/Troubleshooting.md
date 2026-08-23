# macOS Troubleshooting

## Common Troubleshooting Workflow

When looking into a macOS problem, I would start by getting a clear picture of what is happening:

* What is the user trying to do?
* What happens when they try?
* Do they see an error message?
* When did the problem begin?
* Does it affect one application or the whole Mac?
* Are other users experiencing the same issue?
* Has anything changed recently, such as an update, new software or a settings change?

## Application Problems

If an application will not open, I would work through the following checks:

1. Confirm which application is affected and ask the user to describe the exact symptoms.
2. Check whether the application is already running in the background.
3. Force quit it if necessary.
4. Try opening it again.
5. Check available CPU, memory and storage resources.
6. Look for any available application updates.
7. Check whether the application has the permissions it needs.
8. Restart the Mac if the issue continues.
9. Reinstall the application if that is appropriate and authorised.

## Wi-Fi Problems

A straightforward troubleshooting sequence would be:


Confirm Wi-Fi is enabled
->
Confirm the correct network is selected
->
Check the connection status
->
Check the IP configuration
->
Test the local gateway
->
Test external connectivity
->
Test DNS resolution
->
Test the required application or service


## Performance Problems

For a slow or unresponsive Mac, I would check:

* Activity Monitor
* CPU usage
* Memory pressure
* Available disk space
* Applications currently running
* Login items
* Pending macOS or application updates

These checks can help identify whether the problem is caused by a resource-heavy process, limited storage, too many startup items or outdated software.

## Disk Problems

Disk Utility can be used to review storage devices and volumes, check their status and carry out suitable disk checks. Any repair actions should be performed carefully, particularly where there is a risk of data loss or the device is managed by an organisation.

## Security and Permissions

If an application cannot access a file, folder, camera, microphone or another resource, I would check whether macOS privacy settings are blocking it.

Permissions should only be changed when there is a clear business or technical reason, and any changes should follow the organisation's security policies.

## Escalation

Problems involving security controls, managed devices, MDM restrictions, hardware faults or privileged system settings should be escalated when they fall outside the technician's authority or experience.
