## OSI Model

|Layer Number |Layer Name|Main Function|Example Protocols and Standards|
|---|---|---|---|
|Layer 7 |	Application layer |	Providing services and interfaces to applications |	HTTP, FTP, DNS, POP3, SMTP, IMAP|
|Layer 6 |	Presentation layer |	Data encoding, encryption, and compression |	Unicode, MIME, JPEG, PNG, MPEG|
|Layer 5 |	Session layer |	Establishing, maintaining, and synchronising sessions |	NFS, RPC|
|Layer 4 |	Transport layer |	End-to-end communication and data segmentation |	UDP, TCP|
|Layer 3 |	Network layer |	Logical addressing and routing between networks |	IP, ICMP, IPSec|
|Layer 2 |	Data link layer |	Reliable data transfer between adjacent nodes |	Ethernet (802.3), WiFi (802.11)|
|Layer 1 |	Physical layer |	Physical data transmission media |	Electrical, optical, and wireless signals|

### DHCP

### ARP (Address Resolution Protocol)
Address Resolution Protocol (ARP) makes it possible to find the MAC address of another device on the Ethernet. 
If we want to communicate via the data link layer, we can send an ARPRequest to the IP address of the device. The device will then send an ARPReply telling us the MAC address so we can communicate via the data link layer (Layer 2)
ARP allows the translation from Layer 3 (IP) addressing to Layer 2 addressing.

### ICMP (Internet Control Message Protocol)
ICMP is mainly used for network diagnostics and error reporting. Two popular commands rely on ICMP, namely ping and traceroute (Linux, tracert on Windows)

### NAT (Network Address Translation)
NAT was a proposed way to overcome the limits of IPv4 by using a public IP address to provide internet to many private IP addresses.

### DNS
Domain Name Sysytem (DNS) is partly responsible for mapping a domain name to an IP address. It works at Layer 7 of the OSI Model.
A few examples of DNS records are:
* A records
* AAAA records (for IPv6)
* CNAME records, which map domain names to other domain names
* MX records used by mail servers.

**WHOIS** can be used to look up the domain owner and the creation date of any domain. **Note:** Some domains can be created through a service that will redact personal information from the WHOIS records.

**HTTP** Designed for retrieving web pages, what browser applications use.
Telnet: telnet <ipaddress> <port>
Then use /GET /(filename) /HTTP/1.1

**FTP (File Transfer Protocol)**
FTP is designed to transfer files.
Example commands:
    - USER to input the username.
    - PASS to enter the password.
    - RETR to download a file from the FTP server.
    - STOR to upload a file to the FTP server.
FTP servers listen to TCP port 21 by default.

Here is an example from a Tryhackme room of me downloading a file with FTP:
![FTP login and file retrieval](images/ftp_anonymous_login.png)

**SMTP (Simple Mail Transfer Protocol)**
SMTP defines how a mail client talks to a mail server and how mail servers talk to each other.
Example commands:
    - HELO or EHLO initiates an SMTP session.
    - MAIL FROM specifies the senders email address.
    - RCPT TO specifies the recipients email address.
    - DATA indicates that the client will begin sending the content of the email.
    - . is sent by itself to show the end of the message.
SMTP servers listen to TCP port 25 by default.

**POP3 (The Post Office Protocol version 3)**
POP3 is designed to allow a mail client to communicate with a mail server and retrieve email messages.
Commom commands:
    - USER <username> identifies the user.
    - PASS <password> gives the password.
    - STAT requests the number of messages and the total size.
    - LIST lists the messages and their sizes.
    - RETR <message_number> gets a specific message.
    - DELE <message_number> marks a message for deletion.
    - QUIT ends the POP3 session applying changes, i.e. deletions.
The POP3 server listen on port 110 by default.

![Example of using POP3 over Telnet to retrieve an email](images/pop3_telnet.png)
