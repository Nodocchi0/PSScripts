param (
    [Alias("User","U")][string]$UserName,
    [Alias("Name","N")][string]$NewName
)

Write-Host "Change Distinguished Name for User"

If (!$UserName) {$UserName = Read-Host "Enter username"}

Get-ADUser $UserName

If (!$NewName) {$NewName = Read-Host "Enter new Distinguished Name"}

Rename-ADObject -Identity (Get-ADUser $UserName).DistinguishedName -NewName $NewName
