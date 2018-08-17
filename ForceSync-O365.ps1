$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

$UserCredential = Get-Credential
Invoke-Command -ComputerName $remoteAADSyncComputer -ScriptBlock { Start-ADSyncSyncCycle -PolicyType Initial } -credential $UserCredential