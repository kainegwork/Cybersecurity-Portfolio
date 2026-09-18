# Networking Fundamentals

This section contains my networking notes and practical work covering core protocols, troubleshooting and packet analysis.

## OSI Model

| Layer | Name | Main Function | Examples |
|---|---|---|---|
| 7 | Application | Services and interfaces used by applications | HTTP, DNS, SMTP, IMAP |
| 6 | Presentation | Data representation, encoding, encryption and compression | TLS-related data handling, JPEG, PNG |
| 5 | Session | Establishing and managing communication sessions | RPC, NetBIOS session services |
| 4 | Transport | End-to-end transport, segmentation and reliability | TCP, UDP |
| 3 | Network | Logical addressing and routing between networks | IPv4, IPv6, ICMP |
| 2 | Data Link | Local network frames and hardware addressing | Ethernet, Wi-Fi |
| 1 | Physical | Transmission of raw bits over physical media | Copper, fibre, radio |

The OSI model is mainly useful to me as a troubleshooting framework. It provides a way to think about where a failure may be occurring rather than treating the network as one single system.

## DHCP

**Dynamic Host Configuration Protocol (DHCP)** automatically provides devices with network configuration such as:

- IP address
- Subnet mask
- Default gateway
- DNS server

DHCP helps reduce manual configuration and prevents many address conflicts.

DHCP uses UDP, with servers normally listening on port 67 and clients using port 68.

## ARP

**Address Resolution Protocol (ARP)** is used on IPv4 Ethernet networks to discover the MAC address associated with an IP address on the local network.

A device sends an ARP request asking which host owns an IPv4 address. The device using that address can then return an ARP reply containing its MAC address.

This allows Layer 3 IPv4 addressing to be mapped to Layer 2 hardware addressing for local delivery.

## ICMP

**Internet Control Message Protocol (ICMP)** is used for network diagnostics and error reporting.

Common tools that use ICMP include:

- `ping`
- `traceroute` on Linux
- `tracert` on Windows

## NAT

**Network Address Translation (NAT)** translates addresses as traffic passes between networks.

A common home-network use is allowing many devices with private IPv4 addresses to share one public IPv4 address when accessing the internet.

## DNS

**Domain Name System (DNS)** resolves names such as `example.com` to IP addresses and stores other information about domains.

Common DNS record types include:

- **A** — IPv4 address
- **AAAA** — IPv6 address
- **CNAME** — alias to another name
- **MX** — mail server information

DNS normally uses port 53. UDP is common for normal queries, while TCP is also used when required.

## Common Application Protocols

### HTTP and HTTPS

**HTTP** is used to transfer web content and normally uses TCP port 80.

**HTTPS** is HTTP protected by TLS and normally uses TCP port 443.

### Telnet

Telnet provides remote terminal access but does not encrypt traffic, making it unsuitable for normal secure administration.

Its default TCP port is 23.

### FTP

**File Transfer Protocol (FTP)** is used to transfer files. Its control connection normally uses TCP port 21.

Example FTP commands include:

- `USER`
- `PASS`
- `RETR`
- `STOR`

Example from a TryHackMe lab:

![FTP login and file retrieval](images/ftp_anonymous_login.png)

### SMTP

**Simple Mail Transfer Protocol (SMTP)** is used to send email between mail systems and from clients to mail servers.

Common SMTP commands include:

- `HELO` / `EHLO`
- `MAIL FROM`
- `RCPT TO`
- `DATA`

Traditional server-to-server SMTP uses TCP port 25.

### POP3

**Post Office Protocol version 3 (POP3)** is used by mail clients to retrieve messages from a mail server.

Common commands include:

- `USER`
- `PASS`
- `STAT`
- `LIST`
- `RETR`
- `DELE`
- `QUIT`

POP3 normally uses TCP port 110.

![Example of using POP3 over Telnet to retrieve an email](images/pop3_telnet.png)

### IMAP

**Internet Message Access Protocol (IMAP)** allows email clients to work with messages stored on a mail server while keeping mailbox state synchronised.

Common commands include:

- `LOGIN`
- `SELECT`
- `FETCH`
- `MOVE`
- `COPY`
- `LOGOUT`

IMAP normally uses TCP port 143.

## TLS and Secure Protocols

**Transport Layer Security (TLS)** provides encryption, integrity and server authentication for many application protocols.

Common secure service ports include:

| Protocol | Typical Port |
|---|---:|
| HTTPS | 443 |
| SMTP submission with STARTTLS | 587 |
| SMTP with implicit TLS | 465 |
| POP3S | 995 |
| IMAPS | 993 |

### SSH

**Secure Shell (SSH)** provides encrypted remote command-line access and other secure services.

SSH normally listens on TCP port 22.

Example:

```bash
ssh username@hostname
```

### SFTP

**SFTP** provides file transfer over SSH.

Once connected, commands such as `get` and `put` can be used to download and upload files.

## VPN

A **Virtual Private Network (VPN)** creates an encrypted tunnel between a client and a VPN endpoint.

VPNs can be used to provide secure remote access to organisational networks or protect traffic across untrusted networks.

## Related Work

- [Network Troubleshooting](Troubleshooting.md)
- [Wireshark Basics](Wireshark-Basics.md)
- [TCPdump Basics](Tcpdump-Basics.md)
- [Nmap Basics](Nmap-Basics.md)
- [Cryptography Basics](Cryptography-Basics.md)
