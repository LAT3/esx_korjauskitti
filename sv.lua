ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('moottorikitti', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('moottorikitti', 1)
    TriggerClientEvent('esx_korjauskitti:moottori', _source)
end)

