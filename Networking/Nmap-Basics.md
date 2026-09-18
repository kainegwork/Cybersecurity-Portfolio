# Nmap Basics

Nmap is a network-scanning tool used to discover hosts, identify open ports and gather information about services on systems that I am authorised to test.

## Host Discovery

Nmap supports several target formats.

### IP Range

```bash
nmap -sn 192.168.0.1-10
```

### Subnet

```bash
nmap -sn 192.168.0.0/24
```

### Hostname

A hostname can also be used as the target where name resolution is available.

## Local Network Discovery

On a directly connected IPv4 Ethernet network, Nmap can use ARP to discover hosts efficiently.

Example:

```bash
nmap -sn 192.168.1.0/24
```

This performs host discovery without carrying out a normal port scan.

## Remote Network Discovery

For hosts beyond the local network, Nmap may use ICMP and other probes instead of ARP.

Some systems may ignore discovery probes even when they are online, so a host appearing down does not always prove that it is unavailable.

The `-Pn` option skips host discovery and treats targets as online:

```bash
nmap -Pn <target>
```

## Listing Targets Without Scanning

```bash
nmap -sL 192.168.1.0/24
```

This lists targets without performing a port scan.

## TCP Port Scanning

### TCP Connect Scan

```bash
nmap -sT <target>
```

A connect scan asks the operating system to establish a normal TCP connection to each tested port.

### SYN Scan

```bash
sudo nmap -sS <target>
```

A SYN scan sends a TCP SYN and interprets the response without completing a normal application connection.

It normally requires elevated privileges.

## UDP Scanning

```bash
sudo nmap -sU <target>
```

UDP scanning can be slower than TCP scanning because UDP does not use a connection handshake and many services may not respond to unexpected probes.

## Selecting Ports

Nmap scans a default set of commonly used ports unless another range is specified.

Examples:

```bash
nmap -F <target>
nmap -p 1-25 <target>
nmap -p 22,80,443 <target>
nmap -p- <target>
```

- `-F` — fast scan using a smaller set of common ports.
- `-p` — specify ports or ranges.
- `-p-` — scan TCP ports 1-65535.

## Service and Version Detection

```bash
nmap -sV <target>
```

`-sV` attempts to identify the service and version listening on discovered ports.

## Operating System Detection

```bash
sudo nmap -O <target>
```

OS detection is based on network behaviour and fingerprints, so the result should be treated as an estimate rather than a guarantee.

## Aggressive Detection

```bash
sudo nmap -A <target>
```

`-A` enables several features, including OS detection, version detection, script scanning and traceroute.

Because it is more intrusive and generates more traffic, it should only be used when appropriate for the authorised environment.

## Timing Templates

Nmap provides timing templates from `-T0` to `-T5`.

Higher values are generally faster and more aggressive.

```text
T0 — Paranoid
T1 — Sneaky
T2 — Polite
T3 — Normal
T4 — Aggressive
T5 — Insane
```

Other useful controls include:

- `--min-rate`
- `--max-rate`
- `--host-timeout`
- `--min-parallelism`
- `--max-parallelism`

## Verbosity and Debugging

```bash
nmap -v <target>
nmap -vv <target>
nmap -d <target>
```

Verbosity provides more progress information, while debugging output provides deeper diagnostic information.

## Saving Scan Results

```bash
nmap -oN scan.txt <target>
nmap -oX scan.xml <target>
nmap -oG scan.gnmap <target>
nmap -oA scan <target>
```

- `-oN` — normal text output
- `-oX` — XML
- `-oG` — grepable format
- `-oA` — save in multiple major formats

## Key Lesson

Nmap is most useful when the scan is driven by a clear question.

Rather than scanning everything by default, I try to choose the discovery method, ports and detection options that are appropriate for the system and investigation.
