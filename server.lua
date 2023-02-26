CreateThread(function()
    while true do
        local xPlayers = ESX.GetPlayers()

        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job then
                local configJob = Config.Jobs[xPlayer.job.name]
                if configJob then
                    local allowed = true
                    if configJob.distMin then
                        local coords = xPlayer.getCoords()
                        if #(vector3(coords.x, coords.y, coords.z) - configJob.pos) > configJob.dist then
                            allowed = false
                        end
                    end
                    if allowed then
                        xPlayer.addAccountMoney("bank", xPlayer.job.grade_salary)
                        xPlayer.showNotification(Config.Language.Received)
                    else
                        xPlayer.showNotification(Config.Language.NotReceived)
                    end
                end
            end
        end
        Wait(Config.Interval * 60 * 1000)
    end
end)
