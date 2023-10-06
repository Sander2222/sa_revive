ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('sa_revive:Revive')
AddEventHandler('sa_revive:Revive', function(id, target, health)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local MoneyX  = xPlayer.getMoney()
    local xTarget = ESX.GetPlayerFromId(target)

    if tonumber(id) == tonumber(target) then
        if health < 1 then
            if MoneyX >  Config.Price then
                xPlayer.removeAccountMoney('money', Config.Price)
                Config.ServerNotify( (Config.Locals.Revived):format(xTarget.getName()), _source)
                Config.ServerNotify((Config.Locals.GotRevived):format(xPlayer.getName()),  target)

                if Config.UseWasabi then
                    exports.wasabi_ambulance:RevivePlayer(target)
                else
                    xTarget.triggerEvent('esx_ambulancejob:revive')
                end
            else
                Config.ServerNotify(Config.Locals.NotEnoughMoney,  _source)
            end
        else
            Config.ServerNotify(Config.Locals.NotDead, _source)
        end
    else
        Config.ServerNotify(Config.Locals.IdNotExist, _source)
    end
end)