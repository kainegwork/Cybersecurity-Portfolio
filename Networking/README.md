#OSI Model

Layer Number 	Layer Name 	    Main Function 	                                    Example Protocols and Standards
Layer 7 	Application layer 	Providing services and interfaces to applications 	HTTP, FTP, DNS, POP3, SMTP, IMAP
Layer 6 	Presentation layer 	Data encoding, encryption, and compression 	Unicode, MIME, JPEG, PNG, MPEG
Layer 5 	Session layer 	Establishing, maintaining, and synchronising sessions 	NFS, RPC
Layer 4 	Transport layer 	End-to-end communication and data segmentation 	UDP, TCP
Layer 3 	Network layer 	Logical addressing and routing between networks 	IP, ICMP, IPSec
Layer 2 	Data link layer 	Reliable data transfer between adjacent nodes 	Ethernet (802.3), WiFi (802.11)
Layer 1 	Physical layer 	Physical data transmission media 	Electrical, optical, and wireless signals

DHCP

ARP (Address Resolution Protocol)
Address Resolution Protocol (ARP) makes it possible to find the MAC address of another device on the Ethernet. 
If we want to communicate via the data link layer, we can send an ARPRequest to the IP address of the device. The device will then send an ARPReply telling us the MAC address so we can communicate via the data link layer (Layer 2)
ARP allows the translation from Layer 3 (IP) addressing to Layer 2 addressing.

ICMP (Internet Control Message Protocol)
ICMP is mainly used for network diagnostics and error reporting. Two popular commands rely on ICMP, namely ping and traceroute (Linux, tracert on Windows)

NAT (Network Address Translation)
NAT was a proposed way to overcome the limits of IPv4 by using a public IP address to provide internet to many private IP addresses.
