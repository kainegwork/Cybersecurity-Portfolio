# Windows Active Directory Home Lab

**Environment:** Windows Server and Windows 11 running in VirtualBox  
**Domain Controller:** `DC01`  
**Domain:** `kaine.lab`  
**Purpose:** Build a small business-style Active Directory environment to practise common IT support and system administration tasks.

In this lab, I installed and configured Windows Server as a domain controller and created an Active Directory environment for practising common helpdesk and administration tasks.

I configured the server's networking, installed Active Directory Domain Services (AD DS) and DNS, promoted the server to a domain controller, and then used Active Directory Users and Computers to create and manage organisational units, groups and user accounts.

The lab was designed to give me practical experience with tasks commonly encountered in IT support roles, including user administration, password resets, account lockouts, domain connectivity and troubleshooting.

## Environment Setup

I created a Windows Server virtual machine in VirtualBox to act as the domain controller for the lab.

The server was configured with:

- **Hostname:** `DC01`
- **IPv4 address:** `10.0.2.10`
- **Role:** Active Directory Domain Services and DNS

Before installing Active Directory, I confirmed that the server had a stable network configuration and could communicate correctly on the virtual network.

## Installing Active Directory Domain Services

After configuring the Windows Server virtual machine, I installed the Active Directory Domain Services role so the server could be used as a domain controller.

I then promoted the server to a domain controller and configured the `kaine.lab` domain so that Active Directory and DNS services were available on `DC01`.

Once the domain controller was operational, I used Active Directory Users and Computers to begin creating and managing the directory structure.

## Creating Organisational Units and User Accounts

I created Organisational Units (OUs) to separate users into logical groups, similar to how users may be organised by department or function in a business environment.

I then created user accounts inside the appropriate OUs and configured group membership and account settings.

This gave me practical experience with:

- Creating and managing user accounts
- Organising users with OUs
- Managing security-group membership
- Resetting user passwords
- Identifying and unlocking locked accounts
- Verifying that users could authenticate successfully

## DNS and Network Troubleshooting

During the lab, I encountered DNS resolution issues while configuring the domain environment.

I tested connectivity separately from name resolution so I could determine whether the problem was with the network itself or with DNS.

The main checks I used were:

1. Verify the server and client IPv4 configuration.
2. Confirm the configured DNS server.
3. Test basic IP connectivity.
4. Test DNS resolution separately.
5. Verify the correct domain name.
6. Retest after configuration changes.

This reinforced the importance of separating network connectivity problems from DNS problems when troubleshooting Active Directory environments.

## Windows 11 Client VM Troubleshooting

When I first created the Windows 11 client virtual machine, it repeatedly booted to a black screen and would not continue into the installer.

I reviewed the VirtualBox configuration and logs and tested possible causes rather than repeatedly recreating the VM.

The troubleshooting included:

- Reviewing VirtualBox logs for boot-related errors
- Checking the VM firmware and Windows 11 requirements
- Updating the VirtualBox Extension Pack
- Adjusting the VM's CPU allocation
- Retesting the VM after each change

After updating the Extension Pack and assigning four virtual CPUs, the Windows 11 VM booted correctly with UEFI enabled.

This was a useful troubleshooting exercise because an earlier workaround had allowed the VM to boot with UEFI disabled, but I continued investigating until I had a cleaner configuration that worked with UEFI enabled.

## Domain Join and Authentication

Once the client VM was working, I configured it to use the domain controller for DNS and joined it to `kaine.lab`.

I then:

- Logged in using a domain user account
- Verified domain authentication
- Changed the user's password
- Triggered an account lockout through failed login attempts
- Unlocked the account from the domain controller
- Confirmed the user could log in again

This connected the server-side Active Directory configuration with the end-user experience on a domain-joined Windows 11 client.

## What I Learned

This lab gave me practical experience with Active Directory administration, Windows client configuration and structured troubleshooting.

The most useful lesson was that a workaround is not always the same as a full resolution. The Windows 11 VM could initially be made to boot by changing the firmware configuration, but continuing to investigate led to a better result with UEFI enabled.

The DNS work also reinforced the importance of testing IP connectivity and name resolution separately. In an Active Directory environment, a device can have network connectivity while still being unable to locate domain services if its DNS configuration is incorrect.
