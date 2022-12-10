$folder = "diag"
if(-not (ls "$folder\")){
	mkdir $folder
}
$pol = "$folder\politique.txt"
$OUs = "$folder\OU.txt"
$use = "$folder\users.txt"
$shf = "$folder\sharedfolders.txt"
Get-ADFineGrainedPasswordPolicy | Out-File $pol
Get-ADOrganizationalUnit | Out-File $OUs
Get-ADUser | Out-File $use
Get-SmbShare | Out-File $shf