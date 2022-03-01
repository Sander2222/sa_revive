-- made by Sander#2211

ESX = nil
local display = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("register", function(data, cb)
    SetDisplay(false)
    local PlayerID = data.PID
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local health = GetEntityHealth(GetPlayerPed(closestPlayer))
    
    if closestPlayer == -1 or closestDistance >= 3.0 then
        TriggerEvent('esx:showAdvancedNotification', 'Revive-Station', 'Person', 'There is no person near you.', 'CHAR_CALL911', 1)
    else 

    TriggerServerEvent('sa_revive:Revive', PlayerID, GetPlayerServerId(closestPlayer), health)
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        price = Config.Price,
    })
end

Citizen.CreateThread(function()
    while display do
        Wait(0)
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - Config.Coords)
        if dist <= Config.DrawDistance then
            DrawMarker(20, Config.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
            if dist <= 2.0 then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to use the Revive-Station")
                if IsControlJustReleased(0, 38) then
                    SetDisplay(true)
                end
            end
        else
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Coords)

    SetBlipSprite(blip, 61)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blipname)
    EndTextCommandSetBlipName(blip)
end)