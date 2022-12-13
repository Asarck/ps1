$folders = Import-Csv .\db\folders.csv
$folders | %{
	$ou = $_.ou
	$ps = $_.psdrive
	mkdir "c:\$ou"
	New-SmbShare -name $ou -Path "c:\$ou" -FullAccess "CESI\alede"
	New-PSDrive -Name $ou -Root "\\SRVADDS.cesi.local\$ou" -PSProvider FileSystem -Persist
	New-SmbGlobalMapping -LocalPath $("$ps"+":") -RemotePath "\\SRVADDS\$ou" -FullAccess "CESI\$ou" -Persistent $true
}