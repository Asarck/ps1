# Ajoute un utilisateur avec les paramètres suivants :
#|----OPTION--------------------|----type-----------|----Description------------------------------
#	-Name : 					str					Equivalent de l'UserName
#	-GivenName : 				str					Prénom
#	-Surname : 					str					Nom de famille
#	-SamAccountName : 			str					Nom de compte
#	-AccountPassword : 			str					Mdp
#	-ChangePasswordAtLogon : 	bool				Si le mdp doit être changé au premier login
#	-Company : 					str					Nom d'entreprise
#	-Title :					str					ex : métier de la personne
#	-State :					str					Région
#	-City :						str					Ville
#	-Description :				str					Description du compte
#	-EmployeeNumber :			int					Numéro d'employée
#	-Department :				str					Département de l'entreprise
#	-DisplayName :				str					Nom visible de la personne
#	-Country :					str					Pays (fr,us,...)
#	-PostalCode :				int					code postal
#	-Enabled :					bool				si le compte est activé
#	-Path :						
$path = ".\db\users.csv"
$users = Import-Csv -Path $path
$users | % {
    New-ADUser `
        -Name $($_.FirstName + " " + $_.LastName) `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -Department $_.Department `
        -DisplayName $($_.FirstName + " " + $_.LastName) `
        -UserPrincipalName $($_.FirstName[0]+ $_.LastName+"@cesi.local") `
        -SamAccountName $($_.FirstName[0] + $_.LastName) `
        -ChangePasswordAtLogon $True `
        -AccountPassword $(ConvertTo-SecureString "Ach@nger35" -AsPlainText -Force) `
		-Path $("CN=users,DC=cesi,DC=local") `
        -Enabled $True
    Add-adgroupmember -identity $_.Path -Members $($_.FirstName[0]+ $_.LastName+"@cesi.local")
}