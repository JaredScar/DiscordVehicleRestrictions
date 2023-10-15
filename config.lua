Config = {
	RestrictedMessage = "~r~Restricted Vehicle Model.",
	InheritanceEnabled = false,
	VehicleDelete = true, -- Should the vehicle be deleted? If set to false, the user will just be kicked out...
}

Config.VehicleRestrictions = {
	['RoleName or ID'] = {
		"baller",
		"baller2",
		"baller3",
		"baller4"
	},
	['RoleName2 or ID2'] = {},
	['RoleName3 or ID3'] = {},
	['RoleName4 or ID4'] = {}
}

-- Requires Config.InheritanceEnabled to be = true
Config.Inheritances = {
	['RoleName or ID'] = {'RoleName2', 'RoleName3', 'RoleName4'},
}