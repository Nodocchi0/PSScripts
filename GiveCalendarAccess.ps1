param (
    [Alias("Username","U")][string]$User,
    [Alias("Cal","C")][string]$Calendar,
    [Alias("AR")][string]$AccessRights
)

Write-Host "Add permission for user to use a calendar. - Office 365"

If (!$User) {$User = Read-Host "Enter username of user you want to give access to"}
If (!$Calendar) {$Calendar = Read-Host "Enter user who's calendar you want to share"}
If (!$AccessRights) {$AccessRights = Read-Host "Enter Access Right Level (Author, Contributor, Editor, PublishingAuthor, PublishingEditor, None)"}

Add-MailboxFolderPermission -Identity $Calendar`:\Calendar -User $User -AccessRights $AccessRights 
