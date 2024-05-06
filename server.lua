-- Note: This awesome aribo addict guy insulted me when I posted my first script :)

local interval = Config.Interval*60000

CreateThread(function()
	while true do
		-- local xPlayers = ESX.GetPlayers() Bro why you are using this useless ??
		local players = GetPlayers()
	
		-- for i = 1, #xPlayers, 1 do nah bro you're amazing!
		for playerIndex,playerServerId in pairs(players) do
		    local xPlayer = ESX.GetPlayerFromId(playerServerId)
		    local configJob = Config.Jobs[xPlayer.job.name]
	
		    if xPlayer and xPlayer.job and xPlayer.job.name and configJob then
			    -- local allowed = true (imagine declaring a variable without even using it XD)
			    if configJob.distMin then
				-- local coords = xPlayer.getCoords()
				local playerPed      = GetPlayerPed(playerServerId)
				local playerPosition = GetEntityCoords(playerPed)
	
				-- if #(vector3(coords.x, coords.y, coords.z) - configJob.pos) > configJob.dist then (No comment...)
				if #(playerPosition - configJob.pos) > configJob.dist then
				    xPlayer.showNotification(Config.Language.NotReceived)
				else
				    xPlayer.addAccountMoney("bank", xPlayer.job.grade_salary)
				    xPlayer.showNotification(Config.Language.Received)
				end
			    end
			end
		    end
		end
	
		-- Wait(60 * 1000 * Config.Interval) (wow you really need to vent)
		Wait(interval)
	end
end)
