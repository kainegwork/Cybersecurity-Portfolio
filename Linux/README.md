# Linux Fundamentals

This section contains my Linux command-line notes and links to practical Linux projects in the portfolio.

My main focus is using Linux for administration, troubleshooting, networking and security work rather than only memorising commands.

## Basic Commands

| Command | Purpose |
|---|---|
| `whoami` | Show the current user |
| `pwd` | Show the current working directory |
| `ls` | List files and directories |
| `cd` | Change directory |
| `cat` | Display file contents |
| `find` | Search for files and directories |
| `grep` | Search text for matching patterns |
| `touch` | Create an empty file or update its timestamp |
| `mkdir` | Create a directory |
| `cp` | Copy files or directories |
| `mv` | Move or rename files and directories |
| `rm` | Remove files or directories |
| `file` | Identify a file type |
| `nano` | Edit text files in the terminal |
| `wget` | Download files over supported network protocols |
| `scp` | Copy files securely over SSH |
| `ps` | Display process information |
| `top` | Monitor processes and system resource usage |
| `systemctl` | Inspect and manage systemd services |
| `su` | Switch to another user account |
| `fg` | Bring a backgrounded job to the foreground |

## Useful Examples

Search for a file:

```bash
find . -name "example.txt"
```

Search inside a file:

```bash
grep "error" system.log
```

Copy a file to another machine over SSH:

```bash
scp important.txt ubuntu@192.168.1.30:/home/ubuntu/
```

Start a simple HTTP server from the current directory:

```bash
python3 -m http.server
```

## Operators and Redirection

- `&` — run a command in the background.
- `&&` — run the next command only if the first command succeeds.
- `>` — redirect output and overwrite the destination file.
- `>>` — append output to the destination file.
- `|` — pass the output of one command into another command.

Example:

```bash
grep -i "error" system.log | wc -l
```

## Permissions

Linux permissions are commonly shown using `r`, `w` and `x`:

- `r` — read — value 4
- `w` — write — value 2
- `x` — execute — value 1

Permissions are applied separately to the file owner, group and others.

For example:

```text
rwxr-xr-x = 755
rw-r----- = 640
```

I have also practised permissions in a simulated shared-support-directory scenario using users, groups, ownership, `chmod`, `chown` and setgid.

## Important Directories

- `/etc` — system and application configuration files
- `/var` — variable data such as logs, caches and service data
- `/home` — normal user home directories
- `/root` — root user's home directory
- `/tmp` — temporary files

## Processes and Services

I use commands such as:

```bash
ps aux
top
systemctl status <service>
systemctl start <service>
systemctl stop <service>
systemctl enable <service>
```

These are useful for investigating high resource usage, checking whether services are running and verifying service configuration.

## Backgrounding and Foregrounding

A process can be started in the background by adding `&` to the command.

`Ctrl+Z` suspends the current foreground job, and `fg` can bring a job back into the foreground.

## Shell Scripting

A Bash script is a text file containing shell commands. Scripts commonly begin with a shebang such as:

```bash
#!/bin/bash
```

The script needs execute permission before it can be run directly:

```bash
chmod +x script.sh
./script.sh
```

## Practical Linux Projects

- [External Linux Mint Workstation](External-Linux-Mint-Workstation/)
- [Linux Network Troubleshooting](Linux-Network-Troubleshooting/)
- [Linux Permissions Lab](Linux-Permissions-Lab/)
- [Linux Process & Service Troubleshooting](Linux-Process-Service-Troubleshooting/)
- [Linux SSH Authentication Investigation](Linux-SSH-Authentication-Investigation/)
