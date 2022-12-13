$folder = "diag"
if(-not (ls "$folder\")){
	mkdir $folder
}
$pol = "$folder\politique.txt"
$OUs = "$folder\OU.txt"
$use = "$folder\users.txt"
$shf = "$folder\sharedfolders.txt"
Get-ADDefaultDomainPasswordPolicy | Out-File $pol
Get-ADOrganizationalUnit -filter "name -like '*'" | Out-File $OUs
Get-ADUser -filter "name -like '*'" | Out-File $use
Get-SmbShare -filter | Out-File $shf