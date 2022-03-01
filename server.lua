--made by Sander#2211
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sa_revive:Revive')
AddEventHandler('sa_revive:Revive', function(id, target, health)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local MoneyX  = xPlayer.getMoney()
	local xTarget = ESX.GetPlayerFromId(target)

    if tonumber(id) == tonumber(target) then
        if health < 1 then
            if MoneyX >= Config.Price then
                xPlayer.removeAccountMoney('money', Config.Price)
                TriggerClientEvent('esx:showAdvancedNotification', _source, 'Revive-station', 'Revive', 'you revived: ~g~' ..xTarget.getName().. '~w~', 'CHAR_CALL911', 1)
                TriggerClientEvent('esx:showAdvancedNotification', target, 'Revive-station', 'Revive', 'you were revived by: ~g~' ..xPlayer.getName().. '~w~', 'CHAR_CALL911', 1)
                xTarget.triggerEvent('esx_ambulancejob:revive')
            else
                TriggerClientEvent('esx:showAdvancedNotification', _source, 'Revive-station', 'Money', 'You dont have enough money with you', 'CHAR_CALL911', 1)
            end
        else
            TriggerClientEvent('esx:showAdvancedNotification', _source, 'Revive-station', 'Player', 'The player is not dead', 'CHAR_CALL911', 1)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Revive-station', 'Player', 'The ID doesnt exists', 'CHAR_CALL911', 1)
    end
end)