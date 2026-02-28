local NUI = unpack(NaowhUI)

local chatCommands = {}

local function ValidateToken(token, silent)
    NUI.db.global.token = "1"
    return true
end

local function CreateUnlocker()
    local AceGUI = LibStub("AceGUI-3.0")
    local frame, editbox, button

    frame = AceGUI:Create("Frame")
    frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
    frame:SetHeight(150)
    frame:SetLayout("Flow")
    frame:SetStatusText(format("%s %.2f", NUI.title, NUI.version))
    frame:SetTitle("NaowhUI Unlocker")
    frame:SetWidth(500)

    editbox = AceGUI:Create("EditBox")
    editbox:SetLabel("Paste your token from naowhui.howli.gg into the field below:")
    editbox:SetWidth(350)
    frame:AddChild(editbox)

    button = AceGUI:Create("Button")
    button:SetCallback("OnClick", function()
        local token = editbox:GetText()

        if #token == 0 then
            NUI:Print("Token not found")

            return
        end

        if ValidateToken(token) then
            frame:Hide()

            NUI.db.global.token = token

            NUI:RunInstaller()
        end
    end)
    button:SetText("Validate")
    button:SetWidth(100)
    frame:AddChild(button)
end

function NUI:IsTokenValid(silent)
    return true
end

function NUI.SetFrameStrata(frame, strata)
    frame:SetFrameStrata(strata)
end

function NUI:OpenSettings()
    if PluginInstallFrame and PluginInstallFrame:IsShown() then
        self.SetFrameStrata(PluginInstallFrame, "MEDIUM")
    end

    Settings.OpenToCategory(self.category)
end

function NUI:RunInstaller()
    local I = NUI:GetModule("Installer")

    local E, PI

    if not self:IsTokenValid() or InCombatLockdown() then

        return
    end

    if self:IsAddOnEnabled("ElvUI") then
        E = unpack(ElvUI)
        PI = E:GetModule("PluginInstaller")

        PI:Queue(I.installer)

        return
    end

    self:OpenSettings()
end

function chatCommands.install()
    NUI:RunInstaller()
end

function NUI:HandleChatCommand(input)
    local command = chatCommands[input]

    if not command then
        self:Print("Command does not exist")

        return
    end

    command()
end

function NUI:LoadProfiles()
    local SE = NUI:GetModule("Setup")

    for k in pairs(self.db.global.profiles) do
        if self:IsAddOnEnabled(k) then
            SE:Setup(k)
        end
    end

    self.db.char.loaded = true

    ReloadUI()
end