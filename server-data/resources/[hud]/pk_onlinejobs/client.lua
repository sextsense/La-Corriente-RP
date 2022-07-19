ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(10000)
	ESX.TriggerServerCallback('esx_onlinejob:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end)

RegisterNetEvent('esx_onlinejob:updateConnectedPlayers')
AddEventHandler('esx_onlinejob:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList = {}
	local ems, police, sheriff, taxi, mechanic, lawyer = 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do

		if v.job == 'ambulance' then
			ems = ems + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'sheriff' then
			sheriff = sheriff + 1
		elseif v.job == 'taxi' then
			taxi = taxi + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1
		elseif v.job == 'lawyer' then
			lawyer = lawyer + 1
		end
	end

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {ems = ems, police = police, sheriff = sheriff, taxi = taxi, mechanic = mechanic, lawyer = lawyer}
	})
end
