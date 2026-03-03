# What is this?
Because I hate paywalled addons, I forked NoawhUI and removed the token validator. Meaning it is fully unlocked.
I don't know how long I'll update this and keep it in sync with the original.

[Note]: Naowh seems to have removed or privated his Github repository. So I'm no longer able to automate the edit. I uploaded a new version but you will have to follow the steps below for future updates

# Caveats
NaowhUI uses a lot of other addons. You will have to lookup the original addon to find out what they are as they can and will change as Naowh changes his UI.

# Can I just unlock NaowhUI myself?
Yes! You just have to modify 1 file every time you update the original Addon!
Follow this short guide

1. Go to the addon folder, usually under `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\NaowhUI`
2. Inside open the folder "Game" -> "Shared" -> "General"
3. Open the file "Functions.lua"
4. Replace everything inside the the functions "ValidateToken" and "NUI:IsTokenValid" with true (you need to search for them as the line numbers can change)
```lua
local function ValidateToken()
    NUI.db.global.token = "1"
    return true
end

function NUI:IsTokenValid(silent)
    return true
end
```

`C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\NaowhUI\Game\Shared\General` <-- Full default path to the Functions.lua file

Ingame run `/nui install` to trigger the installer
