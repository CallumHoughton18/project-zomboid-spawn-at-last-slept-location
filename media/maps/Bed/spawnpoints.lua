-- name is a path with the name of the file and the extension. Like that: name = "MyFile.txt"
-- File in C:\Users\User\Zomboid\Lua
local function encodeTable(t)
  local toReturn = "";
  for k, v in pairs(t) do
      toReturn = toReturn .. k .. "=" .. tostring(v) .. ",\n";
  end
  return toReturn
end

local function decodeTable(txt)
  local toReturn = {}
  for k, v in string.gmatch(txt, "(%w+)=(%d+)") do -- If number
      toReturn[k] = tonumber(v);
  end
  for k, v in string.gmatch(txt, "(%w+)=(%d+.%d+)") do -- If decimal number
      toReturn[k] = tonumber(v);
  end
  for k, v in string.gmatch(txt, "(%w+)=([%a%s]+)") do -- If string
      if v == "true" then toReturn[k] = true -- If string is a boolean
      elseif v == "false" then toReturn[k] = false -- If string is a boolean
      else toReturn[k] = v;
      end
  end
  return toReturn
end

function SaveFile(t, name)
  local fileWriterObj = getFileWriter(name .. ".txt", true, false);
  local text = encodeTable(t);
  fileWriterObj:write(text);
  fileWriterObj:close();
end

function LoadFile(name)
  local fileReaderObj = getFileReader(name .. ".txt", true);
  if not fileReaderObj then return end
  local text = "";
  local line = fileReaderObj:readLine();
  while line ~= nil do
      text = text .. line;
      line = fileReaderObj:readLine()
  end
  fileReaderObj:close();

  if text and text ~= "" then
      return decodeTable(text);
  end
end

function FileExists(name)
    local fileReaderObj = getFileReader(name .. ".txt", true);
    return fileReaderObj == nil
end

function SpawnPoints()
    local saveExists = ModData.exists("sleepspawn-spawnpoint")
    local locationTable = {}
    locationTable["worldX"] = xCell
    locationTable["worldY"] = yCell
    locationTable["posX"] = xRelative
    locationTable["posY"] = yRelative
    locationTable["posZ"] = zRelative

    if saveExists then 
        local spawn = ModData.get("sleepspawn-spawnpoint")
        return {
            chef = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              constructionworker = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              doctor = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              fireofficer = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              parkranger = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              policeofficer = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              repairman = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"],posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              securityguard = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              },
              unemployed = {
                { worldX = spawn["worldX"], worldY = spawn["worldY"], posX = spawn["posX"], posY = spawn["posY"], posZ = spawn["posZ"] }
              }
        }
    else 
        return {
            chef = {
                { worldX = 44, worldY = 5, posX = 17, posY = 67, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 210, posY = 65, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 10, posY = 162, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 260, posY = 48, posZ = 0 },
                { worldX = 42, worldY = 5, posX = 214, posY = 111, posZ = 0 }
              },
              constructionworker = {
                { worldX = 44, worldY = 5, posX = 17, posY = 58, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 221, posY = 67, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 10, posY = 180, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 230, posY = 52, posZ = 0 },
                { worldX = 42, worldY = 7, posX = 209, posY = 29, posZ = 0 }
              },
              doctor = {
                { worldX = 44, worldY = 5, posX = 19, posY = 51, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 232, posY = 67, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 12, posY = 197, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 232, posY = 90, posZ = 0 },
                { worldX = 43, worldY = 7, posX = 210, posY = 112, posZ = 0 }
              },
              fireofficer = {
                { worldX = 44, worldY = 5, posX = 17, posY = 47, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 243, posY = 65, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 33, posY = 208, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 260, posY = 95, posZ = 0 },
                { worldX = 45, worldY = 5, posX = 115, posY = 283, posZ = 0 }
              },
              parkranger = {
                { worldX = 44, worldY = 5, posX = 19, posY = 39, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 254, posY = 67, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 50, posY = 208, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 191, posY = 31, posZ = 0 },
                { worldX = 43, worldY = 8, posX = 81, posY = 155, posZ = 0 }
              },
              policeofficer = {
                { worldX = 44, worldY = 5, posX = 17, posY = 35, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 265, posY = 67, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 70, posY = 206, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 186, posY = 60, posZ = 0 },
                { worldX = 41, worldY = 6, posX = 140, posY = 12, posZ = 0 }
              },
              repairman = {
                { worldX = 44, worldY = 5, posX = 14, posY = 26, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 220, posY = 87, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 88, posY = 206, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 193, posY = 39, posZ = 0 },
                { worldX = 47, worldY = 7, posX = 284, posY = 73, posZ = 0 }
              },
              securityguard = {
                { worldX = 44, worldY = 5, posX = 20, posY = 18, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 232, posY = 82, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 105, posY = 206, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 189, posY = 119, posZ = 0 },
                { worldX = 44, worldY = 10, posX = 152, posY = 125, posZ = 0 }
              },
              unemployed = {
                { worldX = 44, worldY = 5, posX = 17, posY = 10, posZ = 0 },
                { worldX = 44, worldY = 5, posX = 242, posY = 86, posZ = 0 },
                { worldX = 47, worldY = 9, posX = 37, posY = 159, posZ = 0 },
                { worldX = 46, worldY = 7, posX = 200, posY = 147, posZ = 0 },
                { worldX = 45, worldY = 10, posX = 34, posY = 123, posZ = 0 }
              }
        }
    end
end
