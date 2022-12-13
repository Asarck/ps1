# 	-Precedence :							Une priorité de 10
# 	-MinPasswordLength :					Une longueur minimale de 7 caractères pour le mot de passe
# 	-PasswordHistoryCount :					Un historique sur les 24 derniers mots de passe
# 	-ReversibleEncryptionEnabled :			Le chiffrement réversible désactivé
# 	-ComplexityEnabled :					La complexité du mot de passe requise
# 	-LockoutThreshold :						Seuil de verrouillage fixé à 3 échecs
# 	-LockoutObservationWindow :				Réinitialiser le nombre de tentatives de connexion échouées au bout de 1 minutes
# 	-LockoutDuration :						Verrouiller le compte pour une durée de 1 minutes
# 	-MinPasswordAge :						Le mot de passe doit être conservé au minimum 1 jour
# 	-MaxPasswordAge :						Le mot de passe n'expire jamais
# 	-ProtectedFromAccidentalDeletion :		L'objet PSO est protégé contre les suppressions accidentelles
Set-ADDefaultDomainPasswordPolicy  `
	-MinPasswordLength 12 `
	-PasswordHistoryCount 24  `
	-ReversibleEncryptionEnabled $false `
	-ComplexityEnabled $true  `
	-LockoutThreshold 3 `
	-LockoutObservationWindow "0.00:01:00"  `
	-LockoutDuration "0.00:01:00" `
	-MinPasswordAge "1.00:00:00"  `
	-MaxPasswordAge "120.00:00:00" `
	-Identity $(Get-ADDomain).name