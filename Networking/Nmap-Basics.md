# Nmap
Nmap is a network scanner that can be used to both scan networks for live connections and discover services that are running on a specific host.

## Host Discovery

Nmap uses multiple ways to specify its targets:
* IP range using `-`: If we want to scan all IP addresses from 192.168.0.1 to 192.168.0.10 we can write `192.168.0.1-10`
* IP subnet using `/`: To express a subnet we can use `192.168.0.1/24` which would represent `192.168.0.1-255`.
* Hostname: We can also specify the target hostname.

### Scanning a "Local" Network
In this case. "Local" refers to the ethernet or wifi network that we are connected to. Say our IP address is `192.168.66.89` we can scan the `192.168.66.0/24` network using `nmap -sn 192.168.66.0/24`.
As we are scanning the network that we are connected to, we can also look up the MAC addresses of the connected devices.
Nmap labels hosts that respond to the ARP request with 'Host is up'.

### Scanning a "Remote" Network
In this context "Remote" means that at least one router seperates our system from this network. Say we are on the same network as before, to scan the `192.168.11.0/24` network we would use ` nmap -sn 192.168.11.0/24`.
Here nmap cannot use ARP so instead starts by sending ICMP echo requests.

We can also use the option `-sL` to just give us a list of all the targets without actually scanning them.

## Port Scanning: Who Is Listening?

Here we want to discover network services that are listening to the ports of the hosts. By a network service we mean any processes that are listening for incoming connections on the UDP or TCP ports.

### Scanning TCP Ports

**Connect Scan**

The connext scan can be triggered using `-sT`. It tries to complete a TCP three-way handshake with every target TCP port. If it is successful then it will tear down the connection after with TCP RST ACK

**SYn Scan (Stealth)**

Unlike the connect scan, the SYN scan only executes the first step, it sends a TCP SYN packet. As the three-way handshake is never completed, it should result in less logs and is a "stealthier" scan. We use the `-sS` for a SYN scan.

### Scanning UDP Ports

UDP does not require establishing a connection and tearing it down. Nmap offers the option `-sU` to scan for UDP services.

### Limiting the Target Ports

Nmap scans the most common 1000 ports by default. However, Nmap offers a few more options:
* `-F` is for Fast mode, which scans the 100 most common ports.
* -`p[range]` allows you to specify a range of ports to scan. For example `-p-25` scans the port 1-25. **Note:** `-p-` scans all the ports (1-65535).
* The most common services use ports 1-1024 for UDP or TCP services. Use `-p1-1023` to scan for the **well-known ports**.

## Version Detection: Extract More Information

### OS Detection

We can enable OS detection by adding the `-O` option. No OS detection is 100% accurate.

### Service and Version Detection

`-sV` enables version detection. If we want OS detection, version scanning and traceroute among other things we can use `-A`.

### Forcing the Scan

We can use `-Pn` to scan every port on every host, even ones that are appearing as down. Some hosts may appear as down if they did not respond to our ICMP requests.

## Timing

Nmap provides various options to control the scan speed and timing.
Nmap has 6 timing templates, the lower the number the slower the scan:
* T0 (paranoid)
* T1 (sneaky)
* T2 (polite)
* T3 (normal)
* T4 (aggressive)
* T5 (insane)

We can also control the number of parallel probes using `--min-parallelism <numprobes>` and `--max-parallelism <numprobes>`. This will set the minimum and maximum number of UDP or TCP port probes active simultaneously. 

`--min-rate <number>` and `--max-rate <number>` control the minimum and maximum rates at which Nmap sends packets, provided in *packets per second*.

`--host-timeout <time>` specifies the maximum time we are willing to wait and is useful for slow hosts or hosts with a slow network connection.

## Output: Controlling What You See

### Verbosity and Debugging

Adding `-v` will give us more updates about what is happening while the scan is running. We can also increase the verbosity further by adding more `v`'s.

If the verbosity isn't enough then we  can use `-d` for debugging-level output. This goes all the way up to `-d9`.

### Saving Scan Report

In many cases we will need to save the scan results. Some scan formats we can select are:
* `-oN <filename>` - Normal output
* `-oX <filename>` - XML output
* `-oG <filename>` - `grep`-able output
* `-oA <filename>` - Output in all major formats.

**Note:** It is best to run Nmap with `sudo` privileges so we can use all of its features.
