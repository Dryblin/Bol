YorickHeroVersion	= 0.2
YorickAutoUpdate	= true

if myHero.charName ~= "Yorick" then return end
function OnLoad()
    Update()
    LoadChampion()
    Msg("Loaded! (v"..YorickHeroVersion..")")

-- Auto Update
function Update()
    local ToUpdate = {}
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/nebelwolf/BoL/master/Scriptology.version"
    ToUpdate.ScriptPath =  "/nebelwolf/BoL/master/Scriptology.lua"
    ToUpdate.SavePath = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) Msg("Updated from v"..OldVersion.." to "..NewVersion..". Please press F9 twice to reload.") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) end
    ToUpdate.CallbackNewVersion = function(NewVersion) Msg("New version found v"..NewVersion..". Please wait until it's downloaded.") end
    ToUpdate.CallbackError = function(NewVersion) Msg("There was an error while updating.") end
    CScriptUpdate(ScriptologyVersion,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
  end
