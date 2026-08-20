# Linux
Here I will show my understanding of basic command for the CLI in Linux.

## Basic commands
- whoami - Tells you who you are on the system.
- echo - Terminal will output desired text.
- ls - Tells me what directories are around me.
- cd - Change directories
- cat - Prints the contents of a file in CLI
- pwd - Tells me where I am.
- find - Search for files by their name. e.g find -name example.txt
- grep - Look for text inside files. e.g grep "test" testscript.txt
- touch - Create file.
- mkdir - Create folder.
- cp - Copy file or folder.
- mv - Move file or folder.
- rm - Remove file or folder.
- file - Determine the file type.
- su - substitute user. need username and password.
- nano - edit files in CLI. e.g. nano testscript.txt
- fg - Bring a backgrounded process to the foreground.
- wget - download files from the web via HTTP.
- scp - copy files using the SSH protocol, between 2 computers. e.g. scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt
- python3
  python3 is used to create a HTTP server from a host to download files from a directory.
  e.g. python3 -m http.server will open a server in the current directory
  then use wget http://ip-address:port/filename on another terminal to download a file.
- ps and top
  These are used for viewing processes on our session or other users sessions. ps shows our session. ps aux shows all sessions.
  top shows real-time statistics about processes that are running.
- systemctl
  allows us to interact with the systemd process. Formatting: systemctl [option] [service]
  Options are: Start, Stop, Enable, Disable, Status.
- grep - used to find strings of text in documents.
## Operators
- & - Runs a command in the background, will not wait for completion before you can do anything else.
- && - Run 2 commands, but waits for the first to finish before starting the second.
- ">" - Sends the output somewhere else. e.g echo "test" > testscript will put test in the file testscript. NOTE: This will override anything already in the file.
- ">>" - Adds the output to the bottom line of the file.

## Permissions
Permissions are often shown as 'rwxrwxrwx', but these also have numeric values.
- r - read - 4
- w - write - 2
- x - execute - 1
To get the numeric value simply add the values for each group.
'rwxrwxrwx' = '777'
Many Linux commands use numeric values.

## Directories
- /etc - stores system files used by OS
- /var - stores data that is frequesntly accessed or written. e.g. log files.
- /root - the home directory for the root user.
- /tmp - temprorary storage, reset on reboot.

## Backgrounding and Foregrounding
We can background a process by following it with the & operator or by pressing Ctrl+Z
We can then foreground the process again using fg

## Scripting in shells
A script is just a set of commands. It must have the extension .sh for bash scripts.
Every script should start from shebang. Shebang is #! followed by the interpretor (bash,fish,etc).
A script must have execution permissions, use chmod +x scriptname.
use ./ before the script name to run it
Loops and conditions can be used in scripts.
Comment using '#' followed by text.


