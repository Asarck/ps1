$path = ".\db\ou.csv"
$OUS = Import-Csv -Path $path
$OUS | % {
   $name = $_.name
   New-ADOrganizationalUnit `
      -DisplayName $name`
      -Name $name
   New-adgroup -name $name `
      -GroupScope DomainLocal`
      -Path "OU=$name,DC=cesi,DC=local"
}
