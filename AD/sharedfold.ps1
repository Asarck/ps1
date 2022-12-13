$folders = Import-Csv .\db\folders.csv
$folders | %{
	$ou = $_.ou
	$A = $_.psdrive
	mkdir "c:\$ou"
	New-SmbShare -name $ou -Path "c:\$ou" -FullAccess "CESI\alede"
	New-PSDrive -Name $ou -Root "\\SRVADDS.cesi.local\$ou" -PSProvider FileSystem -Persist
	New-SmbGlobalMapping -LocalPath $("$A"+":") -RemotePath "\\LAB-DC1\$ou" -FullAccess "CESI\$ou" -Persistent $true
}