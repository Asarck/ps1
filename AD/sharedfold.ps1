$folder = "\\SERVADDS"
$Parameters = @{
	Name = "PRODUCTION"
	Path = $("$folder\PRODUCTION")
	FullAccess = "PROD", "ADMN", "DIRE"
	ReadAccess = "RD"
	NoAccess = "COMM"
}
New-SmbShare @Parameters
#-----------------------------------------------------------------#
$Parameters = @{
	Name = "ADMINISTRATIF"
	Path = $("$folder\ADMINISTRATIF")
	FullAccess = "DIRE", "ADMN"
	ReadAccess = "RD"
	NoAccess = "COMM", "RD", "PROD"
}
New-SmbShare @Parameters
#-----------------------------------------------------------------#
$Parameters = @{
	Name = "DIRECTION"
	Path = $("$folder\DIRECTION")
	FullAccess = "DIRE"
	NoAccess = "COMM", "RD", "ADMN", "PROD"
}
New-SmbShare @Parameters
#-----------------------------------------------------------------#
$Parameters = @{
	Name = "R&D"
	Path = $("$folder\R&D")
	FullAccess = "RD", "ADMN", "DIRE"
	NoAccess = "COMM", "PROD"
}
New-SmbShare @Parameters
#-----------------------------------------------------------------#
$Parameters = @{
	Name = "COMMERCIAL"
	Path = $("$folder\COMMERCIAL")
	FullAccess = "COMM", "DIRE", "ADMN"
	NoAccess = "RD", "PROD"
}
New-SmbShare @Parameters