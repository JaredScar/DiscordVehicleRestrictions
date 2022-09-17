restrictions = Config.VehicleRestrictions;
myRoles = nil;

RegisterNetEvent("BadgerVehicles:CheckPermission:Return")
AddEventHandler("BadgerVehicles:CheckPermission:Return", function(roles)
    myRoles = roles;
end)

lastChecked = nil;
hasPerm = nil;
Citizen.CreateThread(function()
    TriggerServerEvent("BadgerVehicles:CheckPermission");
    while true do
        Citizen.Wait(1000)

		local ped = PlayerPedId()
		local veh = nil

		if IsPedInAnyVehicle(ped, false) then
			veh = GetVehiclePedIsUsing(ped)
		else
			veh = GetVehiclePedIsTryingToEnter(ped)
        end
        local model = GetEntityModel(veh)
        if (model ~= nil) then 
            local driver = GetPedInVehicleSeat(veh, -1)
            if (lastChecked ~= nil) and (lastChecked == model) and (hasPerm ~= nil) and (not hasPerm) then 
                if driver == ped then
                    ShowInfo(Config.RestrictedMessage)
                    DeleteEntity(veh)
                    ClearPedTasksImmediately(ped)
                end
                print("[DiscordVehicleRestrictions] Vehicle was last checked, but is not a driver...")
            end
        end
		
        if veh ~= nil and DoesEntityExist(veh) and lastChecked ~= model then
            local driver = GetPedInVehicleSeat(veh, -1)
			-- Check if it has one of the restricted vehicles
            local requiredPerm = nil;
            hasPerm = false;
            for role, val in pairs(myRoles) do 
                if (val == true) then 
                    local vehicles = Config.VehicleRestrictions[role];
                    if (vehicles ~= nil) then
                        for i = 1, #vehicles do 
                            if GetHashKey(vehicles[i]) == model then 
                                requiredPerm = true;
                                hasPerm = true;
                            end
                        end
                    end
                end
            end
            if not hasPerm then 
                local vehicles = Config.VehicleRestrictions;
                for role, vehicleList in pairs(vehicles) do 
                    for i = 1, #vehicleList do 
                        if GetHashKey(vehicleList[i]) == model then 
                            requiredPerm = true;
                        end
                    end
                end
            end

            lastChecked = model;

			-- If doesn't have permission, it's a restricted vehicle to them
			if not hasPerm and (requiredPerm ~= nil) then
				if driver == ped then
					ShowInfo(Config.RestrictedMessage)
					DeleteEntity(veh)
					ClearPedTasksImmediately(ped)
				end
            else 
                hasPerm = true;
            end
        end
    end
end)

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end