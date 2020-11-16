# DiscordVehicleRestrictions

## What is it?
DiscordVehiclesRestrictions is a Discord based vehicle restriction script. I have previously made a script like this in the past, but it was made when I was barely considered a FiveM script developer. Due to the sloppy code practices within that script, I decided to rewrite the script and include something at most people had inquired about within the old one: Inheritance.

### Old Script: 
https://forum.cfx.re/t/discordvehiclesrestrict/599594

## Images
https://i.gyazo.com/415c775a6cd94f194e22c9843778bdb0.gif

## Requirement
https://forum.cfx.re/t/release-badger-discord-api/1698464

## Configuration
* It should be noted that for `Config.Inheritances`, the roleNames and roleIDs should match up with the ones specified in `Config.VehicleRestrictions`.

* Also, inheritance only inherits the role groups listed. Inheriting `RoleName2` which inherits `RoleName1` would not be inherited for `RoleName3`.
```lua
Config = {
	RestrictedMessage = "~r~Restricted Vehicle Model.",
	InheritanceEnabled = false
}

Config.VehicleRestrictions = {
	['RoleName1 or ID'] = {
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
	['RoleName2 or ID'] = {'RoleName1', 'RoleName3', 'RoleName4'},
    ['RoleName3'] = {'RoleName2'},
}
```

## Example Configuration
```lua
Config = {
    RestrictedMessage = "~r~Restricted Vehicle Model.",
    InheritanceEnabled = true
}

Config.VehicleRestrictions = {
    ['Head_Admin'] = {
        "baller",
        "baller2",
        "baller3",
        "baller4",
    },
    ['Admin'] = {
        "dcd",
        "chr20",
    },
    ['Moderator'] = {
        "nf6",
        "foxsnt",
        "foxshelby",
        "gt63s",
        "fhauler",
        "rescue1",
        "um1",
        "um2",
        "um3",
        "um4",
        "um5",
        "um6",
        "um6",
        "riot",
    },
}

-- Requires Config.InheritanceEnabled to be = true
Config.Inheritances = {
    ['Head_Admin'] = {'Admin', 'Moderator'},
}
```
Thanks to @clewis329 for helping to test this, a well as providing the example configuration file :)  
## Download
https://github.com/JaredScar/DiscordVehicleRestrictions
