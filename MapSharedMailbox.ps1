param (
    [Alias("User","Username","U")][string]$UserMailbox,
    [Alias("Mailbox","SM")][string]$SharedMailbox,
    [switch]$AutoMap
)

if ($AutoMap) { Write-Host "Add permission for user to use a shared mailbox (automapping enabled). - Office 365" }
else { Write-Host "Add permission for user to use a shared mailbox (no automapping). - Office 365" } 

If (!$UserMailbox) {$UserMailbox = Read-Host "Enter username"}
If (!$SharedMailbox) {$SharedMailbox = Read-Host "Enter shared mailbox"}

if ($AutoMap) { Add-MailboxPermission -Identity $SharedMailbox -AccessRights FullAccess -InheritanceType All -User $UserMailbox }
else { Add-MailboxPermission -Identity $SharedMailbox -AccessRights FullAccess -InheritanceType All -AutoMapping:$false -User $UserMailbox }

Add-RecipientPermission -Identity $SharedMailbox -AccessRights SendAs -Confirm:$false -Trustee $UserMailbox
