-- This scumbag 2 years ago took the piss out of me saying that this script was shit and that he cleaned it... Let's see how you cleaned it failed haribo employee

CreateThread(function()
	while true do
		-- local xPlayers = ESX.GetPlayers() (No Comment...)
        local players = GetPlayers()

		-- for i = 1, #xPlayers, 1 do
        for index, serverId in pairs(players) do
			local xPlayer = ESX.GetPlayerFromId(serverId)
            local playerPed = GetPlayerPed(serverId)

			if not xPlayer or not xPlayer.job or not xPlayer.job.name then goto next end

			local configJob = Config.Jobs[xPlayer.job.name]

			if not configJob then goto next end

			-- local allowed = true (Question: Where the fuck do you call this variable??)

			if configJob.distMin then
				-- local coords = xPlayer.getCoords()
                local coords = GetEntityCoords(playerPed)
				-- if #(vector3(coords.x, coords.y, coords.z) - configJob.pos) > configJob.dist then (My eyes are burning)
                if(#(coords - configJob.pos) > configJob.dist) then
					xPlayer.showNotification(Config.Language.NotReceived)
					goto next
				end
			end
			xPlayer.addAccountMoney("bank", xPlayer.job.grade_salary)
			xPlayer.showNotification(Config.Language.Received)
			
			::next::
		end
		-- Wait(60 * 1000 * Config.Interval) (You really don't prove anything by doing one more thing than I did in the script)
        Wait(Config.Interval * 60000)
	end
end)
