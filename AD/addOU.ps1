$path = ".\db\ou.csv"
$OUS = Import-Csv -Path $path
$OUS | % {
   New-ADOrganizationalUnit `
      -DisplayName $_.name`
      -Name $_.name`
      -ProtectedFromAccidentalDeletion
}
