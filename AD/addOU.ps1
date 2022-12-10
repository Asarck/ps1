$OUS = Import-Csv -Path ou.csv
$OUS | % {
   New-ADOrganizationalUnit `
      -DisplayName $_.name`
      -Name $_.name`
      -ProtectedFromAccidentalDeletion
}
