local function onSelectAsSpawnPoint(player)
    -- sendClientCommand(player, "RVInterior","clientStartExitInterior", {})
end

local function AllowToSetSpawnIfSleepable(playerIndex, context, worldObjects, test)
    local isBed = true
    local player = getSpecificPlayer(playerId)
    if isBed then
        context:addOption("Set as Spawn Option", player, onSelectAsSpawnPoint)
    end
end

local function SetSpawnIfSleeping(player)
    if player:isAsleep() then
        -- { worldX = 44, worldY = 5, posX = 14, posY = 26, posZ = 0 }
        local x = math.floor(player:getX())
        local y = math.floor(player:getY())
        local z = math.floor(player:getZ())

        local xCell = math.floor(x / 300)
        local yCell = math.floor(y / 300)
    
        local xRelative = x - (xCell * 300)
        local yRelative = y - (yCell * 300)
        local zRelative = z

        local locationTable = {}
        locationTable["worldX"] = xCell
        locationTable["worldY"] = yCell
        locationTable["posX"] = xRelative
        locationTable["posY"] = yRelative
        locationTable["posZ"] = zRelative

        local saveExists = ModData.getOrCreate("sleepspawn-spawnpoint")

        print(locationTable)
        ModData.add("sleepspawn", locationTable)
    end
end

Events.OnPlayerUpdate.Add(SetSpawnIfSleeping)

-- Probably use OnPlayerUpdate instead, to autosave location whereever you sleep