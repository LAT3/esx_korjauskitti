ESX                = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_korjauskitti:moottori')
AddEventHandler('esx_korjauskitti:moottori', function()
	local pelaaja = PlayerPedId()
	local paikka = GetEntityCoords(pelaaja)

	if IsAnyVehicleNearPoint(paikka.x, paikka.y, paikka.z, 5.0) then
		local vehicle = GetClosestVehicle(paikka.x, paikka.y, paikka.z, 5.0, 0, 71)
        
        if DoesEntityExist(vehicle) then
			Citizen.CreateThread(function()
				local health = GetVehicleEngineHealth(vehicle)
				
				if health < 700 then
					TaskStartScenarioInPlace(pelaaja, 'PROP_HUMAN_BUM_BIN', 0, true)
					ESX.ShowNotification('Näyttää aika pahalta. Etköhän jonkun patentin kuitenkin keksi...')
					Citizen.Wait(Config.Moottoripatentti)
					SetVehicleEngineHealth(vehicle, 700.0)
					ClearPedTasksImmediately(pelaaja)
					ESX.ShowNotification('Moottori toimii nyt jotenkuten. Kannattaa varmaan kuitenkin ajaa suoraan mekaanikolle...')
					
				else
					TaskStartScenarioInPlace(pelaaja, 'PROP_HUMAN_BUM_BIN', 0, true)
					ESX.ShowNotification('Onneksi moottorin vika on pieni.Osaat sen varmaankin korjata...')
					Citizen.Wait(Config.Moottorikuntoon)
					SetVehicleEngineHealth(vehicle, 1000.0)
					ClearPedTasksImmediately(pelaaja)
					ESX.ShowNotification('Onnistuit! Moottori on nyt täysin kunnossa.')
				end
			end)
		end
	end
end)

