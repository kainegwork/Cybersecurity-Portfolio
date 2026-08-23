# Network Troubleshooting

## Troubleshooting Approach

When looking into a network issue, I would start with the device and work outward until I find where the connection stops working.

```text
Physical connection / Wi-Fi
↓
Network adapter
↓
IP configuration
↓
Default gateway
↓
DNS
↓
Internet or internal network
↓
Application or service
```

## Step 1 — Check the Physical Connection

First, I would check the basics:

* Is Wi-Fi enabled?
* Is the device connected to the correct wireless network?
* Is the Ethernet cable connected properly?
* Is the network adapter enabled and working?
* Is there any visible damage to the cable or port?

## Step 2 — Check IP Configuration

Next, I would check whether the device has received the correct network details:

* IP address
* Subnet mask
* Default gateway
* DNS server

An address beginning with `169.254` usually means the device has assigned itself an APIPA address. This can point to a problem with DHCP or the connection to the network.

## Step 3 — Test the Default Gateway

I would then test the default gateway to see whether the device can communicate with the local network.

Example:

```bash
ping <gateway>
```

If the gateway cannot be reached, I would focus on the device, adapter, Wi-Fi connection, cable, or local network.

## Step 4 — Test External Connectivity

If the gateway responds, I would test an external IP address. This helps show whether the problem is limited to the local network or extends to the internet.

For example:

```bash
ping 8.8.8.8
```

If this works, the internet connection may be available even if websites are not loading by name.

## Step 5 — Test DNS

If an external IP address responds but domain names do not, I would investigate DNS.

Example:

```bash
nslookup example.com
```

This can help confirm whether the device is reaching a DNS server and receiving a response.

## Step 6 — Test the Application

If the network and DNS appear to be working, I would move on to the affected application or service. At that point, I would check for issues such as:

* Service outages
* Incorrect application settings
* Authentication problems
* Firewall restrictions
* Problems affecting only one user or device

## Example

**User reports:** “The internet isn’t working.”

Rather than immediately restarting the router or changing settings, I would work through the problem in order:

1. Is the device connected to the network?
2. Does it have a valid IP address?
3. Can it reach the default gateway?
4. Can it reach an external IP address?
5. Does DNS resolve domain names?
6. Can the affected application connect to its service?

This approach helps narrow down the cause before making changes. It also reduces the risk of changing settings unnecessarily and makes it easier to explain the issue and the steps taken to resolve it.
