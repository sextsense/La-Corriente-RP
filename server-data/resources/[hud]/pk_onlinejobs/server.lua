ESX = nil
local connectedPlayers = {}
local playerJobs = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_onlinejob:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	connectedPlayers[playerId].jobLabel = job.label
	
	TriggerClientEvent('esx_onlinejob:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayersToScoreboard()
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil
	TriggerClientEvent('esx_onlinejob:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	local identifier = GetPlayerIdentifiers(playerId)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier })
	
	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].job = xPlayer.job.name
	connectedPlayers[playerId].jobLabel = xPlayer.job.label

	if update then
		TriggerClientEvent('esx_onlinejob:updateConnectedPlayers', -1, connectedPlayers)
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, true)
	end
	TriggerClientEvent('esx_onlinejob:updateConnectedPlayers', -1, connectedPlayers)
end