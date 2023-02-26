Config = {}

Config.Jobs = {
    lspd = {
        pos = vector3( -1097.36, -809.303, 19.311),
        dist = 120,
        distMin = false
    },
    starbucks = {
        pos = vector3(275.1891, -835.226, 29.242),
        dist = 50,
        distMin = true
    },
    mcd = {
        pos = vector3(89.20025, 291.2552, 110.20),
        dist = 70,
        distMin = true
    },
    -- pos (position), dist (distance) and distMin (if the job need the minimum distance)
}

Config.Language = {
    Received = "You have received your salary",
    NotReceived = "Salary not received because you are not near the place where you work"
}

Config.Interval = 5 -- Time in minutes
