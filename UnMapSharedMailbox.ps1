param (
    [Alias("User","Username","U")][string]$UserMailbox,
    [Alias("Mailbox","SM")][string]$SharedMailbox
)

Write-Host "Remove permission from user to use a shared mailbox. - Office 365"

If (!$UserMailbox) {$UserMailbox = Read-Host "Enter username"}
If (!$SharedMailbox) {$SharedMailbox = Read-Host "Enter shared mailbox"}

Remove-MailboxPermission -Identity $SharedMailbox -AccessRights FullAccess -Confirm:$false -User $UserMailbox
Remove-RecipientPermission -Identity $SharedMailbox -AccessRights SendAs -Confirm:$false -Trustee $UserMailbox
