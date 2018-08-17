param (
    [Alias("User","U")][string]$UserName,
    [switch]$NoArchive
)

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

Write-Host "Enable Remote Mailbox for User. - On Prem"

If (!$UserName) {$UserName = Read-Host "Enter username"}

$RemoteRoutingAddress = $UserName.trimEnd("@$company.com")+"@$company.mail.onmicrosoft.com"

Enable-RemoteMailbox $UserName -RemoteRoutingAddress $RemoteRoutingAddress

if(-Not $NoArchive) { Enable-RemoteMailbox $UserName -Archive }

