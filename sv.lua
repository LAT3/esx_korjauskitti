ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('moottorikitti', function(source)
	local _source = source
    TriggerClientEvent('esx_korjauskitti:moottori', _source)
end)

RegisterServerEvent('esx_korjauskitti:poistakitti')
AddEventHandler('esx_korjauskitti:poistakitti', function()
    local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('moottorikitti', 1)
end)

