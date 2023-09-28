ESX = exports["es_extended"]:getSharedObject()
local display = false

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("register", function(data, cb)
    SetDisplay(false)
    local PlayerID = data.PID
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local health = GetEntityHealth(GetPlayerPed(closestPlayer))
    
    if closestPlayer == -1 or closestDistance > 3.0 then
        Config.ClientNotify(Config.Locals.NoPerson)
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
        for _, coords in ipairs(Config.Coords) do
            local dist = #(GetEntityCoords(PlayerPedId()) - coords)

            if dist <= 2.0 then
                ESX.ShowHelpNotification(Config.Locals.PressE)

                if IsControlJustReleased(0, 38) then
                    SetDisplay(true)
                end
            elseif dist <= 5.0 then
                DrawMarker(20, vector3(coords.x, coords.y, coords.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)

            else
                Wait(1000)
            end
        end
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Coords) do
        local blip = AddBlipForCoord(v)

        SetBlipSprite(blip, Config.Blip.ID)
        SetBlipScale(blip, Config.Blip.Scale)
        SetBlipColour(blip, Config.Blip.Color)
        SetBlipDisplay(blip, Config.Blip.Display)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.Name)
        EndTextCommandSetBlipName(blip)
    end
end)
