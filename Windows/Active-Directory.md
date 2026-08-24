# Active Directory Basics

These are my notes from completing the Active Directory Basics room on TryHackMe.

## Windows Domains

A Windows domain allows a business to manage users and computers from one central location.

Instead of creating and managing local accounts on every individual computer, users and devices can be managed through **Active Directory (AD)**.

A server running **Active Directory Domain Services (AD DS)** is known as a **Domain Controller (DC)**.

This makes it possible to centrally manage things such as:

* Users
* Computers
* Groups
* Permissions
* Security policies
* Authentication

## Active Directory Objects

Active Directory stores information as objects.

Some of the main objects I learned about were:

* Users
* Computers
* Groups
* Organisational Units

### Users

Users represent people or services that need access to resources within the domain.

From a helpdesk point of view, common tasks involving user accounts could include:

* Resetting passwords
* Unlocking accounts
* Enabling or disabling accounts
* Checking group membership
* Troubleshooting login problems

### Computers

Computers that are joined to the domain also have their own objects within Active Directory.

This allows administrators to centrally manage computers across the organisation rather than configuring every machine individually.

## Organisational Units

**Organisational Units (OUs)** are used to organise users and computers within Active Directory.

For example:

```text
Company
│
├── Users
│   ├── IT
│   ├── Finance
│   └── HR
│
└── Computers
    ├── Workstations
    └── Servers
```

This makes the environment easier to manage and allows different policies to be applied to different users or computers.

## Groups

Groups are used to manage access and permissions.

Instead of giving permissions to users individually, users can be added to a group and permissions can then be assigned to that group.

For example:

```text
Finance User
     ↓
Finance Group
     ↓
Finance Resources
```

This makes permissions easier to manage when users join, leave or move between departments.

## Delegation

Active Directory also allows certain administrative tasks to be delegated.

This means a user can be given permission to carry out specific tasks without being given full administrator access.

For example, a helpdesk technician could be allowed to reset passwords for users in a particular OU without being given control over the whole domain.

This is useful because users should only be given the permissions they actually need.

## Group Policy

**Group Policy** allows settings to be applied centrally to users and computers within the domain.

These settings are stored in **Group Policy Objects (GPOs)**.

GPOs can be linked to OUs so that different groups of users or computers receive different settings.

Examples could include:

* Password policies
* Security settings
* Desktop settings
* User restrictions
* Computer configuration

This means administrators do not need to configure every computer manually.

## Authentication

The room covered two authentication methods used within Windows domains:

* Kerberos
* NetNTLM

### Kerberos

Kerberos uses tickets to authenticate users and allow them to access services.

A simplified version of the process is:

```text
User logs in
    ↓
Receives a Ticket Granting Ticket (TGT)
    ↓
Requests access to a service
    ↓
Receives a service ticket
    ↓
Accesses the service
```

The main thing I took from this is that the user's credentials do not need to be sent every time they access another service within the domain.

### NetNTLM

NetNTLM uses a challenge-response process for authentication.

It is still supported within Windows environments, although Kerberos is generally the preferred authentication method in a domain.

## Trees and Forests

A **tree** is a collection of related domains.

For example:

```text
company.com
│
├── uk.company.com
└── us.company.com
```

A **forest** can contain multiple domain trees.

This allows larger organisations to have multiple domains while still managing relationships between them.

## Trusts

Trusts allow users from one domain to access resources in another domain where the correct permissions have been given.

This becomes useful in environments containing multiple domains.

## Helpdesk Relevance

Active Directory seems particularly important for helpdesk work because many common support requests involve user accounts, permissions and domain computers.

Examples include:

* Password resets
* Account lockouts
* Login problems
* Group membership
* Access to shared resources
* User permissions
* Computer accounts
* Group Policy problems

Understanding how users, computers, groups and OUs fit together gives me a better idea of what is actually happening when troubleshooting these types of issues.

## What I Learned

The main things I took from this room were:

* How Windows domains work
* The purpose of a Domain Controller
* How Active Directory stores users and computers
* How OUs are used to organise objects
* How groups can be used to manage permissions
* How administrative tasks can be delegated
* How Group Policy is used to manage users and computers
* The basics of Kerberos and NetNTLM
* How trees, forests and trusts work

The most useful part for me was seeing how all of these pieces fit together in a business environment and how Active Directory can be used to manage a large number of users and computers from one place.

## Lab

**Platform:** TryHackMe
**Room:** Active Directory Basics
**Status:** Completed
