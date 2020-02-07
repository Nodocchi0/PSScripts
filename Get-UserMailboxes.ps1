 param (
    [Alias("User","U")][string]$UserName
)

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

Write-Host "All Shared Mailboxes for User. (This may take a while)."

Get-Mailbox | Get-MailboxPermission -User $UserName