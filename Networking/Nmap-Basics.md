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
