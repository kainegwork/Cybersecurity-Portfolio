\# Active Directory User Management and Account Lockout Lab



\## Overview



In this lab, I used a Windows Server Active Directory environment and a Windows 11 client to practise common helpdesk and Active Directory administration tasks.



The goal was to simulate a realistic user onboarding and account support workflow, including creating a user, assigning group membership, joining a workstation to the domain, testing authentication, triggering an account lockout, and restoring access.



\## Environment



\- Windows Server 2025

\- Active Directory Domain Services

\- Domain: `kaine.lab`

\- Domain Controller: `DC01`

\- Windows 11 Pro client: `W11-CLIENT01`

\- Test user: `jcarter`

\- Security group: `Sales-Users`



\## Tasks Completed



\### 1. Created a New Active Directory User



I created a new user called \*\*James Carter\*\* with the username:



`jcarter`



The account was placed inside the \*\*Sales OU\*\* to keep the directory organised by department.



!\[James Carter in Sales OU](01-sales-ou-user.png)



\---



\### 2. Added the User to a Security Group



I added `jcarter` to the \*\*Sales-Users\*\* security group.



This demonstrated how group membership can be used to manage user access and permissions more efficiently instead of assigning permissions directly to individual users.



!\[Sales Users group membership](02-sales-users-membership.png)



\---



\### 3. Reset the User's Password



I reset the user's password in Active Directory Users and Computers and configured the account so that the user was required to change the password at the next logon.



This is a common helpdesk task when onboarding users or responding to forgotten-password requests.



\---



\### 4. Joined a Windows 11 Client to the Domain



I configured the Windows 11 client so that it could communicate with the domain controller.



The client was configured to use the domain controller as its DNS server:



`10.0.2.10`



I then verified connectivity and Active Directory DNS resolution before joining the client to the `kaine.lab` domain.



The workstation successfully joined the domain as:



`W11-CLIENT01.kaine.lab`



!\[Windows 11 client joined to domain](03-client-domain-join.png)



\---



\### 5. Logged In Using the Domain Account



After restarting the client, I logged in using the `jcarter` Active Directory account.



I verified the authenticated user using:



```cmd

whoami

```



Result:



```text

kaine\\jcarter

```



I also checked which domain controller handled the login using:



```cmd

echo %LOGONSERVER%

```



Result:



```text

\\\\DC01

```



This confirmed that the Windows 11 client was authenticating successfully against the domain controller.



!\[Domain authentication verification](04-domain-user-authentication.png)



\---



\### 6. Tested the Account Lockout Policy



The domain was configured with an account lockout threshold of three failed login attempts.



I intentionally entered the wrong password three times for `jcarter`.



The account was then locked and Windows displayed a message confirming that the account could not be logged on.



!\[Account lockout](05-account-lockout.png)



\---



\### 7. Unlocked the Account



On the domain controller, I opened the `jcarter` account properties in Active Directory Users and Computers.



The account showed as locked out.



I unlocked the account and then successfully logged back into the Windows 11 client using the correct password.



!\[Account unlock](06-account-unlock.png)



\---



\## Skills Practised



\- Active Directory user creation

\- Organisational Unit management

\- Security group membership

\- Password resets

\- Forced password changes

\- Windows domain joining

\- Active Directory DNS configuration

\- Domain authentication

\- Account lockout policies

\- Unlocking user accounts

\- Basic helpdesk troubleshooting



\## What I Learned



This lab helped me understand how common helpdesk tasks fit together in a real Active Directory environment.



Rather than only managing users from the domain controller, I was able to test the full process from both the administrator and end-user sides.



I also saw how important DNS is in an Active Directory environment. The Windows 11 client needed to use the domain controller as its DNS server before it could correctly discover and communicate with the domain.



Testing the lockout policy also showed how failed login attempts are handled and how an administrator can restore access to a user account.

