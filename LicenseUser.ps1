param (
    [Alias("User","U")][string]$UserName,
    [Alias("L")][string]$License,
    [switch]$Unlicense
)

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

Write-Host "License User for O365. - Office 365"

If (!$UserName) {$UserName = Read-Host "Enter username"}

Get-MsolUser -UserPrincipalName $UserName
Get-MsolAccountSku | Select AccountSkuId,ActiveUnits,WarningUnits,ConsumedUnits | Format-Table

If (!$License) {$License = Read-Host "Enter licensetype (exclude '$company' from entry)"}

Set-MSolUser -UserPrincipalName $UserName -UsageLocation US

If (!$Unlicense) { Set-MsolUserLicense -UserPrincipalName $UserName -AddLicenses ($company + ":" + $License) }

If ($Unlicense) { Set-MsolUserLicense -UserPrincipalName $UserName -RemoveLicenses ($company + ":" + $License) }

Get-MsolUser -UserPrincipalName $UserName
