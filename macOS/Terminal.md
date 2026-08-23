# macOS Terminal

macOS has a Unix-based command-line environment, so my existing Linux experience gives me a useful starting point for working in Terminal.

## Basic Navigation

```bash
pwd
ls
cd
mkdir
touch
cp
mv
rm
```

These commands can be used to move around the file system, create files and folders, and copy, move, or remove items.

## File Investigation

```bash
cat
less
grep
find
file
```

These commands help with viewing file contents, searching for text or files, and identifying file types.

## Processes

```bash
ps
top
kill
```

These commands are useful for checking running processes, monitoring system activity, and stopping processes when necessary.

## Network Troubleshooting

```bash
ping
traceroute
```

These commands can help test connectivity and identify where delays or connection problems may be occurring.

macOS also includes several commands that are particularly useful for system administration and network troubleshooting.

## macOS-Specific Commands

### system_profiler

Displays detailed information about the Mac's hardware, software, and connected devices.

```bash
system_profiler
```

### networksetup

Used to view and configure network services and settings.

```bash
networksetup -listallnetworkservices
```

### diskutil

Used to inspect and manage disks, partitions, and volumes.

```bash
diskutil list
```

### scutil

Provides access to system configuration information, including DNS settings.

```bash
scutil --dns
```

## Important

Commands that change system settings, disks, or network configuration should only be used when their purpose and possible effects are understood.
