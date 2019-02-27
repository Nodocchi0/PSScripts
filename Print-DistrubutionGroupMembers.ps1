param (
    [Alias("G")][string]$Group,
    [switch]$Recursive
)

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

Write-Host "Print all Users in a distribution list"

If (!$Group) {$Group = Read-Host "Enter group name: "}

if ($Recursive) { get-adgroupmember -identity $group -Recursive | select name | export-csv ($LocalExportCSVLocation + $Group + ".csv") -NoTypeInformation }
else { get-adgroupmember -identity $group | select name | export-csv ($LocalExportCSVLocation + $Group + ".csv") -NoTypeInformation }
