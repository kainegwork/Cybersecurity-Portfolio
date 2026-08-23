# Sample Helpdesk Tickets

The following simulated support scenarios show how I approach troubleshooting, prioritisation and technical documentation.

---

## Ticket 001 — User Cannot Access Internet

**Priority:** P2 — High

**Impact:** One user is unable to access work applications that require an internet connection.

### Problem

The user says their computer is connected to Wi-Fi, but websites and online applications will not load.

### Information Gathered

* The device is connected to Wi-Fi.
* Other users can access the internet.
* The problem started around 30 minutes earlier.
* The user has not made any recent changes.

### Troubleshooting

1. Confirmed that Wi-Fi was enabled.
2. Checked the device's IP configuration.
3. Checked the default gateway.
4. Tested the connection to the gateway.
5. Tested connectivity to an external IP address.
6. Tested DNS resolution.
7. Retested web access after making the required correction.

### Network Troubleshooting Model

```text
Wi-Fi
↓
IP address
↓
Default gateway
↓
External connectivity
↓
DNS
↓
Application
```

### Resolution

The issue was caused by a DNS resolution problem. The DNS configuration was corrected, and name resolution was tested again.

### Verification

The user was able to access websites and the online applications they needed.

### Documentation

The troubleshooting steps and final resolution were recorded in the support ticket.

---

## Ticket 002 — Windows Application Not Opening

**Priority:** P3 — Medium

### Problem

The user reports that a required Windows application closes immediately after being opened.

### Troubleshooting

1. Confirmed the application and reproduced the reported behaviour.
2. Closed and reopened the application.
3. Checked whether the process remained running.
4. Checked available system resources.
5. Confirmed that the application was up to date.
6. Reviewed Windows Event Viewer for related errors.
7. Tested the application after restarting the computer.
8. Considered repairing or reinstalling the application if the problem continued.

### Resolution

A failed background process was identified. After restarting it, the application opened normally.

### Verification

The user was able to open the application and complete the required task.

### Documentation

The symptoms, checks performed and resolution were recorded in the ticket.

---

## Ticket 003 — macOS Wi-Fi Connectivity

**Priority:** P3 — Medium

### Problem

The user reports that their Mac cannot connect to the company Wi-Fi network.

### Troubleshooting

1. Confirmed that Wi-Fi was enabled.
2. Confirmed that the correct network had been selected.
3. Checked whether other devices could connect.
4. Reviewed the Mac's network configuration.
5. Removed and re-added the wireless network where appropriate.
6. Tested IP connectivity.
7. Tested DNS resolution.
8. Confirmed internet access.

### Resolution

The wireless network was reconfigured, which restored connectivity.

### Verification

The user was able to access the network resources they needed.

---

## Ticket 004 — VPN Connection Failure

**Priority:** P2 — High

### Problem

A remote user cannot connect to the organisation's VPN.

### Troubleshooting

1. Confirmed that the user had working internet access.
2. Confirmed that the VPN client was running.
3. Checked the user's credentials and MFA status.
4. Checked whether there was a wider VPN service outage.
5. Restarted the VPN client.
6. Checked for available client updates.
7. Reviewed the error message and other available information.
8. Retested the connection.

### Escalation

If the problem appeared to be related to the VPN infrastructure rather than the user's device, the incident would be escalated to the appropriate technical team.

### Verification

VPN connectivity was confirmed before the ticket was closed.

---

## Ticket 005 — Slow Windows Computer

**Priority:** P3 — Medium

### Problem

The user reports that their computer has become noticeably slower during normal use.

### Troubleshooting

1. Asked when the slowdown began.
2. Checked CPU usage.
3. Checked memory usage.
4. Checked available disk space.
5. Reviewed running processes.
6. Checked startup applications.
7. Looked for pending updates.
8. Considered whether a particular application was causing the problem.
9. Checked for any obvious security concerns.

### Resolution

The investigation identified a process using an unusually high amount of system resources.

The process was dealt with in line with normal organisational procedures.

### Verification

System performance was tested again, and the user confirmed that they could complete their normal work.

---

## Ticket 006 - Slow Internet Speed on Some Devices.

**Priority:** P3 - Medium

### Problem
User reported that some devices on the home network were receiving significantly lower internet speeds than others.

### Troubleshooting
1. Confirmed that all devices were connected to the same network.
2. Ran a speed test on the slower devices, result 40Mbps download speed.
3. Ran a speed test on the faster devices, result 400+Mbps download speed.
4. The slower devices appeared to be using the 2.4Ghz band, suggesting that these devices were not automatically connecting to the optimal band.
5. Tried restarting the router to rule out a temporary network issue, this did not resolve the problem.
6. Went into router settings and split the 2.4Ghz and 5Ghz bands onto separate networks so the user could manually select which band to use on which devices.

### Resolution

Connecting the slower device to the 5Ghz network then gave download speeds of 400+Mbps similar to the other devices. User now has 2 networks so they can split devices based on their needs.

**Lessons Learned:** Separating the wireless bands made it possible to identify which band each device was using and gave greater control over the network configuration. This reinforced the importance of testing individual network variables rather than assuming the router or internet connection was the cause.

### Verification

Another speed test ran on all devices, all around 400+Mbps download speed.

---


## Lessons Learned

These scenarios highlight the importance of:

* Gathering information before making changes.
* Following a structured troubleshooting process.
* Considering business impact when setting priorities.
* Recording findings clearly.
* Confirming the outcome with the user.
* Escalating issues that fall outside the technician's scope.
