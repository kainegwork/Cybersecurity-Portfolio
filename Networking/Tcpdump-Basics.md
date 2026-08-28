# TCPdump
## Basic Packet Capture
### Specify the Network Interface
We choose which network interface to listen to using `-i INTERFACE`. We can choose to listen to all devices with `-i any` or specify an interface, for example `-i eth0`.

Using a command like `ip address show` (`ip a s`) will list all of the available network interfaces. 

### Save Captured Packets
To save the captured packets use `-w FILE`. The most common file extension is `.pcap`.

### Read Captured Packets from a File
Use `-r FILE` to read the captured packets from a file. This can be used for inspecting a specific protocol or for inspecting a capture file that contains a network attack.

### Limit the Number of Captured Packets
You can specify the number of packets to capture using `-c COUNT`. Otherwise the packet capture will continue until interrupted.

### Don't Resolve IP Addresses and Port Numbers
Tcpdump will resolve IP addresses and provide domain names where possible. To avoid this use the `-n` argument. Also, if we don't want port numbers being resolved (i.e. `80` to `http`) then we can use `-nn` to stop both DNS and port number lookups.

### Produce (More) Verbose Output
Use the `-v` arugment to produce a slightly more verbose output. We can also use `-vv` and `-vvv` for even more verbosity.

## Filtering Expressions

### Filtering by Host
We can easily filter packets by using `host IP` or `host HOSTNAME`. 
If we want to filter the packets to be from a particular source IP address or hostname, then use `src host IP` or `src host HOSTNAME`. We can also do the same for packets sent to a specific destination using `dst host IP` or `dst host HOSTNAME`.

### Filtering by Port
We can limit to packets send from or to a particular port number using `src port PORT_NUMBER` and `dst port PORT_NUMBER`. For example: to view only DNS traffic we would use `port 53`.

### Filtering by Protocol
We can also filter by a specific protocol, such as `ip`,`ip6`,`udp`,`tcp` or `icmp`.
An example would be `tcpdump -i ens5 icmp -n`.

### Logical Operators
* `and`: Captures packets where both conditions are true. For example, `tcpdump host 1.1.1.1 and tcp` captures tcp traffic with host 1.1.1.1.
* `or`: Captures packets when either one of the conditions is true. For instance, `tcpdump udp or icmp` captures udp or ICMP traffic.
* `not`: Captures packets when the condition is not true. For example, `tcpdump not tcp` captures all packets except segments; we expect to find UDP, ICMP, and ARP packets among the results.

## Advanced Filtering
In real life we may need to filter through thousands or even millions of packets, so we need to be able to look at exactly the packets we want.
We can filter packets that are longer or shorter than a certain length using:
* `greater LENGTH`: Filters packets that are greater than or equal to the length.
* `less LENGTH`: Filter packets that are less then or equal to the length.

### Binary Operations
A binary operation takes one or two bits and returns one bit. Lets consider the operations `&`,`|` and `!`.

`&` takes two bits and returns 0 unless both inputs are 1.
`|` (Or) takes two bits and returns 1 unless both inputs are 0.
`!` (Not) takes one bit and inverts it.

### Header Bytes

Using `pcap-filter` Tcpdump allows us to refer to the contents of any byte in the header using the syntax `proto[expr;size]`, where:
* `proto` refers to the protocol. e.g. arp, ip, etc.
* `expr` indicates the byte offset, where `0` refers to the first byte.
* `size` indicates the number of bytes that we are interested in, 1,2, or 4, and is at 1 by default.

## Displaying Packets

### Brief Packet Information

Shorter packet outputs can be printed using the `-q` option.

### Display Link Level Header

If we are on Ethernet or Wifi and want to include the MAC addresses in the output, we just need to add `-e`.

### Display Packets as ASCII

WE can use `-A` to map all of the bytes to ASCII.

### Diplay Packets in Hexadecimal Format

We can display the packet in hexadecimal format using `-xx`. This is helpful if the packet contents is not in plain-text English or has undergone encryption or compression.

### Best of Both

We can also use `-X` to display the packets in both hexadecimal and ASCII format.
