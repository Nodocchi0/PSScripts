# PSScripts
Powershell scripts that I have created at work to use at work. I have uploaded them here to my GitHub so that I do not lose them. They are pretty simple but they have helped me speed up tasks in Office 365 management and other Active Directory things.

### The Scripts
Here is a list of what the scripts do.

* **EnvConfig.ps1.template** - This file should be renamed to **EnvConfig.ps1** and modified to fit your environment. It controls the paths and uris for the other scripts to work properly. This file was created so the other scripts are environment agnostic.

* **ChangeDN.ps1** - Changes the Distinguished Name of an account
* **Connect-ADC.ps1** - Connects to an Azure Domain Controller
* **Connect-O365.ps1** - Connects to an Office 365
* **Connect-OnPrem.ps1** - Connects to an on premise Email Server
* **CreateRemoteMailbox.ps1** - Run on prem Exchange, creates remote mailbox for a user
* **DisableUser.ps1** - Disables a user account, makes a list of all groups they are a member of and exports it to a CSV file based on location set in the EnvConfig, and then removes them from those groups
* **ForceSync-O365.ps1** - Connects your machine with Azure ADSync installed and runs the full sync cycle
* **GiveCalendarAccess.ps1** - Gives a user calendar access to another user's calendar
* **LicenceUser.ps1** - On Office 365, lets you assign a license to a user
* **MapSharedMailbox.ps1** - Adds send as and full access mailbox permission to a user, mailbox has to be added through Control Panel -> Mail or Outlook
* **Print-AllAdGroupsAndMembers.ps1** - Script that will print all distribution groups and their memebers in either one giant CSV file or in a CSV file per group if you use a parameter
* **RemoveCalendarAccess.ps1** - Removes another user's calendar permission from a user
* **UnMapSharedMailbox.ps1** - Removes mailbox access from a user

### Todo
* Expand on the script list by including parameters and explanations for the parameters