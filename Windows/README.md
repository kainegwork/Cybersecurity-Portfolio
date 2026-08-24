# Windows
## NTFS
NTFS - New Technology File System, the current file system Windows uses.
  - can set permissions
  - Can utilise ADS (Alternate Data Stream)

## UAC
User Account Control (UAC) is what asks a user with administrator permissions to confirm if they want to execute a priveleged taks,  

## Windows Command Line
- set - Check the path where we are running commands
- ver - Check windows version.
- systeminfo - Gives general system information.
- | - used to pipe commands. e.g. driveryquery | more lists the output with spacebar presses to see more information.
- help - Help information for specific commands.
- cls - Clears the command prompt.
- ping - Ping a target server and see if we get a response.
- tracert - Show the routers which our request travels through before it reaches its destination.
- nslookup - looks up a host/domain and returns its ip address. nslookup example.com 1.1.1.1 (Name server is optional)
- netstat - Will display current network connections and listening ports, depending on arguments.
  - -a dislplays all established connections and listening ports
  - -b shows the program associated with each port/connection
  - -o shows the process ID (PID) of each connection
  - -n uses a numerical form for addresses/port numbers
- cd - Current directory. Also used to change directories e.g. cd target_directory. cd .. will go up one level.
- dir - view child directories. /a shows hidden files. /s shows files in curretn directory and subdirectories.
- tree - shows a visual representation of the child and subdirectories.
- mkdir - create a directory.
- rmdir - Remove a directory.
- type - shows the contents of a file in terminal window. use more type for long documents.
- copy - Copy a file to another location.
- move - Move files to another location.
- del / erase - Delete a file.
- * - The wildcard * can be used to refer to multiple files.
- tasklist - Shows a list of processes similar to Task Manager. Use /? for help page.
- taskkill - End a process. e.g. taskkill /PID 1111 to end process with PID 1111.
