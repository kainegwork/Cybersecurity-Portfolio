# Wireshark Basics

These are my notes from completing the **Wireshark: The Basics** room on TryHackMe.

## What is Wireshark?

Wireshark is a network packet analyser.

It allows network traffic to be captured and inspected so that I can see what is happening between devices on a network.

Wireshark can work with:

- Live network traffic
- Previously captured traffic
- PCAP/PCAPNG files

This can be useful for troubleshooting network problems as well as investigating suspicious network activity.

## Wireshark Interface

When looking at a packet capture, Wireshark separates the information into different sections.

The main areas are:

### Packet List

The packet list shows the packets contained within the capture.

Information shown can include:

- Packet number
- Time
- Source
- Destination
- Protocol
- Length
- Additional packet information

This gives a quick overview of the traffic inside the capture.

### Packet Details

Selecting a packet allows me to inspect the different protocols and layers contained within it.

For example, a packet might contain:

Ethernet  
↓  
IP  
↓  
TCP  
↓  
HTTP

Each section can be expanded to see more information about that part of the packet.

### Packet Bytes

Wireshark can also display the raw bytes that make up the selected packet.

This provides a lower-level view of the actual data contained within the packet.

## Packet Dissection

Wireshark breaks packets down into their different protocol layers.

This is known as packet dissection.

For example:

Ethernet  
↓  
Internet Protocol  
↓  
TCP  
↓  
Application Protocol

Looking through these layers allows me to find information such as:

- MAC addresses
- Source and destination IP addresses
- Source and destination ports
- Protocols being used
- Information contained within the traffic

This helped me connect the networking concepts I have already learned with what the traffic actually looks like in a packet capture.

## Navigating Packets

Packet captures can contain a large amount of traffic, so being able to navigate through packets is important.

Rather than inspecting every packet individually, Wireshark provides tools that make it easier to find traffic I am interested in.

Being able to identify the source, destination and protocol of packets makes it easier to follow communication between devices and investigate a particular connection.

## Display Filters

Display filters allow me to reduce the traffic being shown without changing the original packet capture.

For example, instead of looking through every packet, I can filter the capture to only show a particular type of traffic.

Examples include:

`tcp`

Shows TCP traffic.

`udp`

Shows UDP traffic.

`icmp`

Shows ICMP traffic.

`http`

Shows HTTP traffic.

Filtering makes larger captures much easier to work with because I can focus on traffic relevant to what I am investigating.

## Filtering by IP Address

Traffic can also be filtered based on IP addresses.

For example:

`ip.addr == 192.168.1.10`

This can be useful when investigating traffic involving a particular device.

Being able to isolate one host from a larger capture would be useful when troubleshooting a network problem or investigating suspicious activity involving a specific machine.

## Filtering by Port

Ports can also be used when filtering traffic.

For example:

`tcp.port == 80`

This allows me to focus on traffic using a particular TCP port.

This becomes useful when I know which service or protocol I am interested in.

## Combining Filters

Filters can be made more specific by combining conditions.

For example:

`ip.addr == 192.168.1.10 && tcp`

This would allow me to focus on TCP traffic involving a particular IP address.

The more specific the filter, the easier it becomes to isolate the traffic I actually want to investigate.

## Why Wireshark is Useful

Wireshark gives much more visibility into network communication than tools such as `ping` or `ipconfig`.

Those tools can tell me whether certain parts of the network are working, whereas a packet capture can allow me to inspect the actual communication taking place.

From a troubleshooting point of view, this could help investigate things such as:

- Connectivity problems
- DNS issues
- Failed connections
- Unexpected network traffic
- Communication between devices

From a cybersecurity point of view, packet analysis can also be used to investigate unusual or potentially malicious network activity.

## What I Learned

The main things I took from this room were:

- What Wireshark is used for
- How to navigate the Wireshark interface
- How packets are broken down into different protocol layers
- How to inspect information contained within packets
- How to navigate through packet captures
- How display filters can isolate useful traffic
- How packet analysis relates to networking and troubleshooting

The most useful part for me was being able to see networking concepts in practice.

Instead of only learning about things such as IP addresses, ports and protocols, Wireshark allowed me to see that information inside real captured network traffic.

## Lab

**Platform:** TryHackMe  
**Room:** Wireshark: The Basics  
**Status:** Completed
