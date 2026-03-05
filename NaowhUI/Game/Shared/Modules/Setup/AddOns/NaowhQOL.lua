local NUI = unpack(NaowhUI)
local SE = NUI:GetModule("Setup")

function SE.NaowhQOL(addon, import, resolution)
    local D = NUI:GetModule("Data")

    local profile = "naowhqol" .. (resolution or "")
    local db

    if import then
        NaowhQOL_API.Import(D[profile], nil, "Naowh")

        SE.CompleteSetup(addon)

        NUI.db.char.loaded = true
        NUI.db.global.version = NUI.version

        return
    end

    if not SE.IsProfileExisting(NaowhQOL_Profiles) then
        SE.RemoveFromDatabase(addon)

        return
    end

    db = LibStub("AceDB-3.0"):New(NaowhQOL_Profiles)

    db:SetProfile("Naowh")
end