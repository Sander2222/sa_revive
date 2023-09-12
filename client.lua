ESX = exports["es_extended"]:getSharedObject()
local display = false


--Debug
--[[RegisterCommand("keybinds", function(source, args)
    SetDisplay(not display)
end)]]--

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("register", function(data, cb)
    SetDisplay(false)
    local PlayerID = data.PID
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local health = GetEntityHealth(GetPlayerPed(closestPlayer))
    
    if closestPlayer == -1 or closestDistance > 3.0 then
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

CreateThread(function()
    while true do
        Wait(0)
        for key, value in pairs(Config.Coords) do
            DrawMarker(20, vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        for key, value in pairs(Config.Coords) do
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z))

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to use the Revive-Station")

                if IsControlJustReleased(0, 38) then
                    SetDisplay(true)
                end
            end
        end
    end
end)

CreateThread(function()
    for _, coords in pairs(Config.Coords) do
        local blip = AddBlipForCoord(vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z))

        SetBlipSprite(blip, 61)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blipname)
        EndTextCommandSetBlipName(blip)
        end
end)

--Serverside Notify
RegisterNetEvent('sa_revive:showNotify')
AddEventHandler('sa_revive:showNotify', function(title, subtitle, text, pic)
    Test()
end)

function Test(lol)
    ESX.ShowHelpNotification('ff')
end
