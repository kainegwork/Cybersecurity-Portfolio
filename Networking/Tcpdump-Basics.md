# tcpdump Basics

`tcpdump` is a command-line packet-capture and analysis tool.

It is useful for troubleshooting connectivity, inspecting protocol behaviour and analysing network traffic in environments where I am authorised to capture packets.

## Basic Packet Capture

### Select an Interface

```bash
tcpdump -i eth0
```

Use `-i any` to capture from all supported interfaces.

Available interfaces can be identified using commands such as:

```bash
ip address show
```

### Limit the Number of Packets

```bash
tcpdump -i eth0 -c 50
```

`-c` stops the capture after the specified number of packets.

### Save a Capture

```bash
tcpdump -i eth0 -w capture.pcap
```

The resulting PCAP file can be opened later in tcpdump or Wireshark.

### Read a Capture File

```bash
tcpdump -r capture.pcap
```

## Disable Name Resolution

```bash
tcpdump -n
tcpdump -nn
```

- `-n` prevents hostname resolution.
- `-nn` also prevents service-name resolution for port numbers.

This can make output faster and easier to interpret during troubleshooting.

## Verbose Output

```bash
tcpdump -v
tcpdump -vv
tcpdump -vvv
```

Each level provides additional packet details.

## Filtering by Host

```bash
tcpdump host 192.168.1.10
tcpdump src host 192.168.1.10
tcpdump dst host 192.168.1.10
```

These filters isolate traffic involving a specific host.

## Filtering by Port

```bash
tcpdump port 53
tcpdump src port 443
tcpdump dst port 22
```

For example, `port 53` is useful when investigating DNS traffic.

## Filtering by Protocol

```bash
tcpdump tcp
tcpdump udp
tcpdump icmp
tcpdump ip
tcpdump ip6
```

Example:

```bash
tcpdump -i eth0 -n icmp
```

## Combining Filters

tcpdump filter expressions support logical operators.

### AND

```bash
tcpdump host 1.1.1.1 and tcp
```

### OR

```bash
tcpdump udp or icmp
```

### NOT

```bash
tcpdump not tcp
```

## Packet Length Filters

```bash
tcpdump greater 500
tcpdump less 100
```

These filters can help isolate unusually large or small packets.

## Header Byte Filters

tcpdump uses the pcap-filter syntax to inspect particular protocol-header bytes.

The general format is:

```text
protocol[offset:size]
```

For example, a filter can inspect individual fields or bits within an IP or TCP header.

These filters are more advanced and are most useful when normal protocol, host or port filters are not specific enough.

## Display Options

### Brief Output

```bash
tcpdump -q
```

### Link-Layer Header

```bash
tcpdump -e
```

This can include MAC-address information on supported link types.

### ASCII Payload

```bash
tcpdump -A
```

### Hexadecimal Output

```bash
tcpdump -xx
```

### Hexadecimal and ASCII

```bash
tcpdump -X
```

## Key Lesson

A packet capture can contain a huge amount of data, so filtering is one of the most important tcpdump skills.

I try to start with a clear question — such as whether DNS requests are leaving a device or whether a TCP connection is being established — and build the filter around the traffic needed to answer it.
