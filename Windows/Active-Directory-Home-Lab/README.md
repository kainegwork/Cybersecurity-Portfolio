### Windows Active Directory Home Lab

**Environment:** Windows Server running in VirtualBox
**Domain Controller:** DC01
**Purpose:** Build a small business-style Active Directory environment to practise common IT support and system administration tasks.

In this lab, I installed and configured Windows Server as a domain controller and created an Active Directory environment for practising common helpdesk and administration tasks.

I configured the server's networking, installed Active Directory Domain Services and DNS, promoted the server to a domain controller, and then used Active Directory Users and Computers to create and manage organisational units and user accounts.

The lab was designed to give me practical experience with tasks commonly encountered in IT support roles, including user account administration, password resets, organisational structure and domain connectivity.
### Environment Setup

I created a Windows Server virtual machine in VirtualBox to act as the domain controller for the lab.

The server was configured with:

- **Hostname:** `DC01`
- **IPv4 address:** `10.2.2.10`
- **DNS server:** `127.0.0.1`
- **Role:** Active Directory Domain Services and DNS

Before installing Active Directory, I confirmed the server had a stable network configuration and could communicate correctly on the virtual network.
## Installing Active Directory Domain Services

After configuring the Windows Server virtual machine, I installed the Active Directory Domain Services role so the server could be used as a domain controller.

I then promoted the server to a domain controller and configured the environment so that Active Directory and DNS services were available on `DC01`.

Once the domain controller was operational, I used Active Directory Users and Computers to begin creating and managing the directory structure.
## Creating Organisational Units and User Accounts

Once the domain controller was operational, I used Active Directory Users and Computers to create a basic organisational structure for the lab.

I created Organisational Units (OUs) to separate users into logical groups, similar to how users may be organised by department or function in a business environment.

I then created user accounts inside the appropriate OUs and configured their account details.

## Password Reset and Account Lockout

I practised common helpdesk tasks by resetting user passwords through Active Directory Users and Computers.

I also simulated an account lockout so I could practise identifying and resolving a locked user account.

This gave me practical experience with several common support tasks:

- Creating and managing user accounts
    
- Organising users with OUs
    
- Resetting user passwords
    
- Identifying locked accounts
    
- Unlocking user accounts
    
- Verifying that the user could access the account again
    

These tasks helped reinforce how Active Directory is used in day-to-day IT support and user administration.
## DNS and Network Troubleshooting

During the lab, I encountered a DNS resolution issue while configuring the domain environment.

I checked the server's IP configuration and confirmed that `DC01` was using the expected IPv4 address and local DNS configuration. I then tested connectivity separately from name resolution to determine whether the problem was with the network itself or with DNS.

This helped isolate the issue to name resolution rather than general connectivity.

After correcting the configuration and retesting, DNS resolution worked successfully and I was able to continue with the Active Directory lab.

### Troubleshooting Approach

The main checks I used were:

- Verify the server's IPv4 configuration
    
- Confirm the configured DNS server
    
- Test basic IP connectivity
    
- Test DNS resolution separately
    
- Retest after configuration changes
    

This reinforced the importance of separating network connectivity problems from DNS problems when troubleshooting domain environments.
## Windows 11 Client VM Troubleshooting

When I attempted to create a Windows 11 client virtual machine, the VM initially booted to a black screen and would not continue into the installer.

I reviewed the VirtualBox logs and identified an error relating to the system hypervisor. Based on this, I worked through several troubleshooting steps to determine what was preventing the VM from booting correctly.

The troubleshooting included:

- Reviewing VirtualBox logs for boot-related errors
    
- Investigating possible conflicts with the host hypervisor
    
- Disabling Windows security features such as Memory Integrity that could interfere with virtualisation
    
- Recreating and retesting the virtual machine
    
- Testing different firmware and security configurations
    

Eventually, I found that disabling UEFI allowed the virtual machine to begin booting successfully.

Although this provided a working initial boot, I recognised that disabling UEFI is not an ideal long-term configuration for a Windows 11 client. Further investigation is still required to identify the underlying compatibility issue and establish a cleaner solution.

### What I Learned

This part of the lab reinforced the importance of using logs rather than making configuration changes at random.

The VirtualBox logs provided the first useful indication that the issue was related to virtualisation or firmware configuration, which helped narrow down the troubleshooting process.

It also highlighted that a workaround is not always the same as a complete resolution. The VM was able to boot, but the underlying cause still needs to be understood and corrected.
