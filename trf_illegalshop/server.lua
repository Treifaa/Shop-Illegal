ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('treifa:illegal')
AddEventHandler('treifa:illegal', function(Shop,price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addWeapon(Shop, 1)
        TriggerClientEvent('esx:showNotification', source, "Votre achat a était effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent")
    end
end)