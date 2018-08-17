$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $conURI -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session