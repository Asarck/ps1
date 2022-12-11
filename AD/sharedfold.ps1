$folders = Import-Csv .\db\ou.csv
$folders | %{
	if (-not(ls $("c:\"+$_.ou))){
		mkdir $("c:\"+$_.ou)
		New-SmbShare -Path $("c:\"+$_.ou) -FullAccess "CESI\alede"
		New-PSDrive -Name $_.psdrive -Root $("\\SERVADDS.cesi.local\"+$_.ou) -PSProvider FileSystem -Persist -Credential "Administrateur@it-connect.local"
		Add-NTFSAccess -Path $("c:\"+$_.ou) -Account $_.ou -AccessRights FullControl
	}
}
# $folder = "\\SERVADDS"