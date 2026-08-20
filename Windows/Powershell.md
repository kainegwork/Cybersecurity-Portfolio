#Powershell
Commands in powershell are called cmdlets. They use a Verb-Noun naming convention to make them easy to understand.
- Get-Command shows all cmdlets, functions, etc. avaliable in powershell.
- Get-Help shows details of what a cmdlet does. The -examples appendix will give some general examples for the cmdlet.
- Find-Module can be used to find modules online to download.
- Install-Module is then used to install them.
- ##Navigating File System
- Get-ChildItem works in the same was as dir for the CLI. Get-ChildItem -Path <directory name> to specify a path.  - Set-Location will move you to another directory. Set-Location -path <directory name>.
- New-Item is used to create directories OR files. New-Item -Path "path" -ItemType "itemtype".
- Remove-Item, Copy-Item, Move-Item are all self explanatory based on above.
- Get-Content works the same as type in CLI.

##Piping
Piping (denoted by |) is used to pass the output of one cmdlet to another. This is especially powerful in powershell as it passes the objects instead of just text.
- Where-Object can filter outputs that meet certain criteria.
- ne: "not equal". This operator can be used to exclude objects from the results based on specified criteria.
- gt: "greater than". This operator will filter only objects which exceed a specified value. It is important to note that this is a strict comparison, meaning that objects that are equal to the specified value will be excluded from the results.
- ge: "greater than or equal to". This is the non-strict version of the previous operator. A combination of -gt and -eq.
- lt: "less than". Like its counterpart, "greater than", this is a strict operator. It will include only objects which are strictly below a certain value.
-le: "less than or equal to". Just like its counterpart -ge, this is the non-strict version of the previous operator. A combination of -lt and -eq.

- Select-Object can be used to refine the output of a search.
- -Select-String is used for looking for specific text patterns in files similar to grep.
