$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $onPremURI -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session