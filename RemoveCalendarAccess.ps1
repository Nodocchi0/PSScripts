param (
    [Alias("Username","U")][string]$User,
    [Alias("Cal","C")][string]$Calendar
)

Write-Host "Remove permission for user to use a calendar. - Office 365"

If (!$User) {$User = Read-Host "Enter username of user you want to remove access to"}
If (!$Calendar) {$Calendar = Read-Host "Enter user who's calendar you want to unshare"}

Remove-MailboxFolderPermission -Identity $Calendar`:\Calendar -User $User -Confirm:$false
