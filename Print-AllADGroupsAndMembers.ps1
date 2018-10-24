param (
    [switch]$SeparateFiles
)

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
. $ScriptDir\EnvConfig.ps1

If (!$SeparateFiles) { Write-Host "Print all Users and their distribution lists in one file." }
If ($SeparateFiles) { Write-Host "Print all Users in their own distribution list file." }

$Groups = get-adgroup -filter 'groupcategory -eq "distribution"'

If (!$SeparateFiles) { $list = @() }
foreach ($Group in $Groups){
    If ($SeparateFiles) { $list = @() }
    $members = get-adgroupmember -identity $group 
    foreach ($member in $members){
        if($member.objectClass -eq "User"){
            $item = new-object PSObject
            $item | Add-member -name 'Group' -value $group.name -MemberType NoteProperty
            $item | Add-member -name 'Member' -value $member.samaccountname -MemberType NoteProperty
            $item | Add-member -name 'Name' -value $member.Name -MemberType NoteProperty
            $list += $item
        }
    }
    If ($SeparateFiles) { $list | export-csv ($LocalExportCSVLocation + $group.name + ".csv") -NoTypeInformation }
}
If (!$SeparateFiles) { $list | export-csv ($LocalExportCSVLocation + "GroupsAndUsers.csv") -NoTypeInformation }