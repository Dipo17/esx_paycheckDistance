CreateThread(function()
	while true do
		local xPlayers = ESX.GetPlayers()

		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if not xPlayer or not xPlayer.job or not xPlayer.job.name then goto next end
			local configJob = Config.Jobs[xPlayer.job.name]
			if not configJob then goto next end

			local allowed = true
			if configJob.distMin then
				local coords = xPlayer.getCoords()
				if #(vector3(coords.x, coords.y, coords.z) - configJob.pos) > configJob.dist then
					xPlayer.showNotification(Config.Language.NotReceived)
					goto next
				end
			end
			xPlayer.addAccountMoney("bank", xPlayer.job.grade_salary)
			xPlayer.showNotification(Config.Language.Received)
			
			::next::
		end
		Wait(60 * 1000 * Config.Interval)
	end
end)
