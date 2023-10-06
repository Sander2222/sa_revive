--Made by Sander#2211

Config = {}
Config.Price = 1000
Config.UseWasabi = true

Config.Blip = {
    ID = 61,
    Scale = 1.0,
    Color = 1,
    Display = 4,
    Name = 'Revive-Station',
}

Config.Coords = {
    vector3(1143.05, -1514.23, 34.84), vector3(1140.07, -1504.67, 34.69),

}

Config.Locals = {
    PressE = 'Press ~INPUT_CONTEXT~ to use the Revive-Station',
    NoPerson = 'There is no person near you',
    Revived = 'You revived: %s',
    GotRevived = 'You got revived from: %s',
    NotEnoughMoney = 'You dont have enough money with you',
    NotDead = 'The player is not dead',
    IdNotExist = 'The ID doesnt exists',
}

Config.ClientNotify = function(msg)
    ESX.ShowNotification(msg)
end

Config.ServerNotify = function (msg, player)
    local xPlayer = ESX.GetPlayerFromId(player)
    xPlayer.showNotification(msg)
end