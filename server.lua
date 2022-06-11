RegisterServerEvent("BadgerVehicles:CheckPermission")
AddEventHandler("BadgerVehicles:CheckPermission", function()
    local src = source;
	local userRoles = {}
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if tostring(identifierDiscord) == "394446211341615104" then 
        -- It is the one and only Badger, we must pay our respects
        TriggerClientEvent('chatMessage', -1, '^1[^5DiscordVehicleRestrictions^1] ^3Script creator ^1Badger ^3has joined the server!...');
    end

    if identifierDiscord then
		local roleIDs = exports.Badger_Discord_API:GetDiscordRoles(src)
		if not (roleIDs == false) then
			for i = 1, #roleIDs do
				for role, vehicles in pairs(Config.VehicleRestrictions) do
					if exports.Badger_Discord_API:CheckEqual(role, roleIDs[i]) then
                        userRoles[role] = true;
                        print("[DiscordVehicleRestrictions] " .. GetPlayerName(src) .. " has received permission for role: " .. tostring(role) );
                        if Config.InheritanceEnabled then 
                            local inheritedRoles = Config.Inheritances[role];
                            if inheritedRoles ~= nil then 
                                -- There is inheritted roles 
                                for j = 1, #inheritedRoles do 
                                    userRoles[ inheritedRoles[j] ] = true;
                                    print("[DiscordVehicleRestrictions] " .. GetPlayerName(src) .. " has inherited role: " .. tostring(inheritedRoles[j]) );
                                end
                            end
                        end
					end
				end
			end
		else
			print("[DiscordVehicleRestrictions] " .. GetPlayerName(src) .. " did not receive permissions because roles == false")
		end
    elseif identifierDiscord == nil then
		print("[DiscordVehicleRestrictions] " .. "identifierDiscord == nil")
    end
	-- Trigger client event
	TriggerClientEvent("BadgerVehicles:CheckPermission:Return", src, userRoles);
end)
