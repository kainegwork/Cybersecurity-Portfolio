# Windows

This section documents my development of practical Windows administration, troubleshooting and Active Directory skills.

## Featured Windows Project

### [Windows Active Directory Home Lab](Active-Directory-Home-Lab/)
Built a Windows Server domain controller in VirtualBox, configured Active Directory Domain Services and DNS, created and managed OUs and user accounts, practised password resets and account lockouts, and troubleshot DNS and Windows 11 VM boot issues.

## Active Directory Fundamentals

### [Active Directory Notes](Active-Directory.md)
Reference notes covering Windows domains, domain controllers, OUs, groups, Group Policy, Kerberos, NetNTLM, trusts, trees and forests.

## PowerShell

### [PowerShell Notes](Powershell.md)
PowerShell fundamentals and command-line administration notes.

## Windows Fundamentals

### NTFS

NTFS (New Technology File System) is the standard file system used by modern Windows systems.

Key areas I have studied include:

- File and folder permissions
- Access control
- Alternate Data Streams (ADS)

### User Account Control

User Account Control (UAC) prompts users with administrative privileges to confirm actions that require elevated permissions.

## Windows Command Line

Commands I have practised include:

- `set` — view environment variables such as PATH
- `ver` — display the Windows version
- `systeminfo` — display detailed system information
- `help` — view command help
- `cls` — clear the command prompt
- `ping` — test connectivity to another host
- `tracert` — trace the network path to a destination
- `nslookup` — query DNS records
- `netstat` — display network connections and listening ports
- `cd` — change directory
- `dir` — list directory contents
- `tree` — show a directory structure
- `mkdir` — create a directory
- `rmdir` — remove a directory
- `type` — display file contents in the terminal
- `copy` — copy files
- `move` — move files
- `del` / `erase` — delete files
- `tasklist` — list running processes
- `taskkill` — terminate a process

Useful `netstat` options include:

- `-a` — show all active connections and listening ports
- `-b` — show the executable associated with each connection
- `-o` — show the process ID associated with each connection
- `-n` — show addresses and ports numerically
