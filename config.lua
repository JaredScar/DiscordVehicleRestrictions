Config = {
	RestrictedMessage = "~r~Restricted Vehicle Model.",
	InheritanceEnabled = false
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