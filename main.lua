-------------------------------------------------------
-- LOAD WINDUI
-------------------------------------------------------
local WindUI
do
    local ok, result = pcall(function()
        return require("./src/Init")
    end)
    if ok then
        WindUI = result
    else
        WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    end
end

-------------------------------------------------------
-- SERVICES / PLAYER
-------------------------------------------------------
local Players           = game:GetService("Players")
local TeleportService   = game:GetService("TeleportService")
local HttpService       = game:GetService("HttpService")
local VirtualUser       = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui           = game:GetService("CoreGui")
local RunService        = game:GetService("RunService")
local LocalPlayer       = Players.LocalPlayer

-------------------------------------------------------
-- COLORS
-------------------------------------------------------
local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green  = Color3.fromHex("#10C550")
local Grey   = Color3.fromHex("#83889E")
local Blue   = Color3.fromHex("#257AF7")
local Red    = Color3.fromHex("#EF4F1D")
local Pink   = Color3.fromHex("#FF69B4")
local Orange = Color3.fromHex("#FF8C00")
local Gold   = Color3.fromHex("#FFD700")

-------------------------------------------------------
-- SCRIPT COUNTER
-------------------------------------------------------
local scriptsLoadedCount = 0
local startTime = tick()

-------------------------------------------------------
-- CREATE WINDOW
-------------------------------------------------------
local Window = WindUI:CreateWindow({
    Title       = "GlocZ Script Hub",
    Folder      = "ScriptLibrary",
    Icon        = "folder",
    NewElements = true,

    OpenButton = {
        Title           = "Open Script Library",
        CornerRadius    = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled         = true,
        Draggable       = true,
        OnlyMobile      = false,
        Color           = ColorSequence.new(
            Color3.fromHex("#30FF6A"),
            Color3.fromHex("#e7ff2f")
        )
    },

    Topbar = {
        Height      = 44,
        ButtonsType = "Mac",
    },
})

-------------------------------------------------------
-- SECTIONS
-------------------------------------------------------
local ScriptsSection = Window:Section({ Title = "📁 Scripts" })
local UtilSection    = Window:Section({ Title = "🛠️ Utility" })
local InfoSection    = Window:Section({ Title = "📢 Info" })

-------------------------------------------------------
-- HELPER: CREATE SCRIPT BUTTON
-------------------------------------------------------
local function CreateScriptButton(tab, title, desc, icon, scriptUrl, notifyTitle)
    tab:Button({
        Title = title,
        Desc  = desc or "Click to load script",
        Icon  = icon or "play",
        Callback = function()
            scriptsLoadedCount = scriptsLoadedCount + 1
            local success = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)
            if success then
                WindUI:Notify({ Title = notifyTitle or "Script Loaded", Content = title .. " loaded successfully!", Duration = 3 })
            else
                WindUI:Notify({ Title = "Error", Content = "Failed to load " .. title, Duration = 5 })
            end
        end
    })
    tab:Space()
end

-------------------------------------------------------
-- UNIVERSAL TAB
-------------------------------------------------------
do
    local UniversalTab = ScriptsSection:Tab({
        Title     = "🌐 Universal",
        Icon      = "globe",
        IconColor = Grey,
        IconShape = "Square",
    })

    UniversalTab:Section({ Title = "Universal Scripts", TextSize = 18 })

    CreateScriptButton(UniversalTab, "Infinite Yield",        "Admin commands script",                  "terminal",       "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",                          "Universal")
    CreateScriptButton(UniversalTab, "Dex Explorer",          "Game explorer",                          "search",         "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua",                                 "Universal")
    CreateScriptButton(UniversalTab, "Universal Aimbot",      "Good aimbot for fps games",              "crosshair",      "https://raw.githubusercontent.com/Sabscripterhahaha/Universal/refs/heads/main/Universal",       "Universal")
    CreateScriptButton(UniversalTab, "Hitbox Expander",       "Expands hitboxes, useful for fps games", "maximize",       "https://pastefy.app/vnXSigC1/raw",                                                              "Universal")
    CreateScriptButton(UniversalTab, "Universal ESP",         "See through walls, get others' location","eye",            "https://pastefy.app/KMJTFNsg/raw",                                                              "Universal")
    CreateScriptButton(UniversalTab, "Cryonix Hub",           "Lots of scripts",                        "layers",         "https://raw.githubusercontent.com/idcgj36/CryonixHub/refs/heads/main/Main.lua",                 "Universal")
    CreateScriptButton(UniversalTab, "Chat Bypasser",         "Bypasses the chat filters",              "message-square", "https://raw.githubusercontent.com/2EzMyBoi/Roblox-Scripts/refs/heads/main/UselessBypasser",     "Universal")
    CreateScriptButton(UniversalTab, "Ronix Hub",             "Multi-game hub with various features",   "box",            "https://api.luarmor.net/files/v3/loaders/b44706178039e9b88c4d768d4d8b012f.lua",                  "Universal")
    CreateScriptButton(UniversalTab, "Lunor",                 "Premium universal hub",                  "star",           "https://lunor.dev/loader",                                                                       "Universal")
    CreateScriptButton(UniversalTab, "Thunder Z Hub",         "Thunder Z universal script hub",         "zap",            "https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua",          "Universal")
    CreateScriptButton(UniversalTab, "Quantum Hub (Keyless)", "Keyless quantum hub",                    "cpu",            "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua",          "Universal")
    CreateScriptButton(UniversalTab, "Speed Hub",             "Fast-loading universal hub",             "wind",           "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",               "Universal")
    CreateScriptButton(UniversalTab, "ZysumeHub",             "Zysume multi-purpose hub",               "package",        "https://raw.githubusercontent.com/ZusumeHub/ZusumeHub/refs/heads/main/UpdateZysume",            "Universal")
    CreateScriptButton(UniversalTab, "Limit Hub",             "Limit hub with multiple game support",   "sliders",        "https://raw.githubusercontent.com/FakeModz/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua",     "Universal")
    CreateScriptButton(UniversalTab, "Than Hub",              "Than hub utilities",                     "tool",           "https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1",                       "Universal")
    CreateScriptButton(UniversalTab, "DarkScript Spawner",    "Visual spawner for various games",       "monitor",        "https://raw.githubusercontent.com/veryimportantrr/x/refs/heads/main/gag_visual.lua",            "Universal")
    CreateScriptButton(UniversalTab, "All-in-one Script",     "Collection of useful scripts",           "archive",        "https://raw.githubusercontent.com/RevengeHubonTop/CollectionofUsefulScript/refs/heads/main/main",         "Universal")
end

-------------------------------------------------------
-- ADM (ADOPT ME) TAB
-------------------------------------------------------
do
    local ADMTab = ScriptsSection:Tab({
        Title     = "🐾 Adopt Me",
        Icon      = "gamepad-2",
        IconColor = Pink,
        IconShape = "Square",
    })

    ADMTab:Section({ Title = "Adopt Me Scripts", TextSize = 18 })

    CreateScriptButton(ADMTab, "House Cloner",                          "House script",                           "home",      "https://github.com/RevengeHubonTop/houseC/blob/main/lua",          "ADM")
    CreateScriptButton(ADMTab, "Minigames Autofarm",                "Auto complete minigames",                "gamepad-2", "https://raw.githubusercontent.com/RevengeHubonTop/Autofarm/refs/heads/main/Main",      "ADM")
    CreateScriptButton(ADMTab, "House ClonerV2",                    "Clone house builds V2",                  "home",      "https://raw.githubusercontent.com/RevengeHubonTop/HouseClonerV2/refs/heads/main/lua",  "ADM")
    CreateScriptButton(ADMTab, "Instant Hatch | Instant Mega Neon", "Instant egg hatch and mega neon making", "zap",       "https://raw.githubusercontent.com/RevengeHubonTop/InstantHatch/refs/heads/main/lua",     "ADM")
    CreateScriptButton(ADMTab, "ProdigyX",                          "ProdigyX AdoptMe features",              "star",      "https://raw.githubusercontent.com/RevengeHubonTop/ProdigyScript/refs/heads/main/lua",         "ADM")
    CreateScriptButton(ADMTab, "AdoptMe GlocZHub",                 "Complete AdoptMe hub",                   "package",   "https://raw.githubusercontent.com/Xanzxd/admhub/refs/heads/main/lua",      "ADM")

    ADMTab:Button({
        Title = "Pet Spawner (Tradeable)",
        Desc  = "Spawn tradeable pets • ⚠️ Use Caution",
        Icon  = "sparkles",
        Callback = function()
            scriptsLoadedCount = scriptsLoadedCount + 1
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xanzxd/PetSpawner/refs/heads/main/lua"))()
        end
    })
    ADMTab:Space()

    ADMTab:Section({ Title = "More Scripts", TextSize = 18 })

    CreateScriptButton(ADMTab, "(NEW) House Cloner",   "Clone houses! (NO KEY / KEYLESS)",     "copy",   "", "ADM")
    CreateScriptButton(ADMTab, "(NEW) Pet Duplicator", "Duplicate your high tier pets!",        "layers", "", "ADM")
    CreateScriptButton(ADMTab, "Rampage Hub (Key)",    "Autofarm, autominigames and much more", "zap",    "", "ADM")
    CreateScriptButton(ADMTab, "Ragesploit Hub (Key)", "Autofarm, autominigames and much more", "shield", "", "ADM")
end

-------------------------------------------------------
-- MM2 TAB
-------------------------------------------------------
do
    local MM2Tab = ScriptsSection:Tab({
        Title     = "🔪 MurderMystery2",
        Icon      = "gamepad-2",
        IconColor = Red,
        IconShape = "Square",
    })

    MM2Tab:Section({ Title = "Murder Mystery 2 Scripts", TextSize = 18 })

    CreateScriptButton(MM2Tab, "Revenge Hub",                 "MM2 hub with ESP, Auto, etc",               "radio",      "https://cdn.sourceb.in/bins/9xuywATe7Q/0",    "MM2")
    CreateScriptButton(MM2Tab, "Axon Hub",                 "MM2 hub with ESP, Auto, etc",               "radio",      "https://cdn.sourceb.in/bins/LnObiNTeLs/0",    "MM2")
    CreateScriptButton(MM2Tab, "Foxname Hub",                 "MM2 hub with ESP, Auto, etc",               "radio",      "https://cdn.sourceb.in/bins/IMVoZR9Xjz/0",    "MM2")
    
    -- =============================================
    -- MM2 WEAPON TOOLS
    -- =============================================
    MM2Tab:Space({ Columns = 2 })
    MM2Tab:Section({ Title = "🗡️ Weapon Tools", TextSize = 18 })

    local selectedWeaponName = ""
    local dupeAmount         = 1
    local fromWeapon         = ""
    local toWeapon           = ""
    local inventoryMain      = nil

    pcall(function()
        if LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Inventory") then
            inventoryMain = LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main
        else
            inventoryMain = LocalPlayer.PlayerGui.MainGUI.Lobby.Screens.Inventory.Main
        end
    end)

    local function GetRandomMysteryBox()
        local ok, boxData = pcall(function() return require(ReplicatedStorage.Database.Sync.MysteryBox) end)
        if not ok or not boxData or next(boxData) == nil then return "StandardBox" end
        local boxes = {}
        for k in pairs(boxData) do table.insert(boxes, k) end
        return boxes[math.random(1, #boxes)]
    end

    local function SpawnWeapon(weaponName)
        if not pcall(function()
            local BoxModule    = require(ReplicatedStorage.Modules.BoxModule)
            local ItemDatabase = require(ReplicatedStorage.Database.Sync.Item)
            if weaponName and ItemDatabase[weaponName] then
                BoxModule.OpenBox(GetRandomMysteryBox(), weaponName)
                pcall(function()
                    getsenv(LocalPlayer.PlayerGui.MainGUI.Inventory.NewItem)._G.NewItem(weaponName, nil, nil, "Weapons", 1)
                end)
                WindUI:Notify({ Title = "Success", Content = "Spawned: " .. weaponName, Icon = "check-circle", Duration = 3 })
            else
                WindUI:Notify({ Title = "Error", Content = "Invalid item: " .. weaponName, Icon = "x-circle", Duration = 3 })
            end
        end) then
            WindUI:Notify({ Title = "Error", Content = "Failed to spawn weapon", Icon = "x-circle", Duration = 3 })
        end
    end

    local function DuplicateWeapon()
        wait(math.random(1, 3))
        if not inventoryMain then return end
        for _, weaponCategory in pairs(inventoryMain.Weapons.Items.Container:GetChildren()) do
            for _, itemFolder in pairs(weaponCategory.Container:GetChildren()) do
                if itemFolder.Name == "Christmas" or itemFolder.Name == "Halloween" then
                    for _, item in pairs(itemFolder.Container:GetChildren()) do
                        if item:IsA("Frame") and item.ItemName.Label.Text == selectedWeaponName then
                            local cur = item.Container.Amount.Text
                            if cur == "" or cur == "None" then item.Container.Amount.Text = "x2"
                            else local n = tonumber(cur:match("x(%d+)")); if n then item.Container.Amount.Text = "x"..tostring(n+1) end end
                        end
                    end
                elseif itemFolder:IsA("Frame") and itemFolder.ItemName.Label.Text == selectedWeaponName then
                    local cur = itemFolder.Container.Amount.Text
                    if cur == "" or cur == "None" then itemFolder.Container.Amount.Text = "x2"
                    else local n = tonumber(cur:match("x(%d+)")); if n then itemFolder.Container.Amount.Text = "x"..tostring(n+1) end end
                end
            end
        end
    end

    local function DuplicateInventory()
        wait(math.random(3, 5))
        if not inventoryMain then return end
        for _, weaponCategory in pairs(inventoryMain.Weapons.Items.Container:GetChildren()) do
            for _, itemFolder in pairs(weaponCategory.Container:GetChildren()) do
                if itemFolder.Name == "Christmas" or itemFolder.Name == "Halloween" then
                    for _, item in pairs(itemFolder.Container:GetChildren()) do
                        if item:IsA("Frame") and item.ItemName.Label.Text ~= "Default Knife" and item.ItemName.Label.Text ~= "Default Gun" then
                            local cur = item.Container.Amount.Text
                            if cur == "" or cur == "None" then item.Container.Amount.Text = "x2"
                            else local n = tonumber(cur:match("x(%d+)")); if n then item.Container.Amount.Text = "x"..tostring(n*2) end end
                        end
                    end
                elseif itemFolder:IsA("Frame") and itemFolder.ItemName.Label.Text ~= "Default Knife" and itemFolder.ItemName.Label.Text ~= "Default Gun" then
                    local cur = itemFolder.Container.Amount.Text
                    if cur == "" or cur == "None" then itemFolder.Container.Amount.Text = "x2"
                    else local n = tonumber(cur:match("x(%d+)")); if n then itemFolder.Container.Amount.Text = "x"..tostring(n*2) end end
                end
            end
        end
        for _, pet in pairs(inventoryMain.Pets.Items.Container.Current.Container:GetChildren()) do
            if pet:IsA("Frame") then
                local cur = pet.Container.Amount.Text
                if cur == "" or cur == "None" then pet.Container.Amount.Text = "x2"
                else local n = tonumber(cur:match("x(%d+)")); if n then pet.Container.Amount.Text = "x"..tostring(n*2) end end
            end
        end
    end

    local function WeaponNameMatches(fullName, searchTerm)
        return fullName:gsub("_G_%d%d%d%d",""):gsub("_K_%d%d%d%d",""):lower():find(searchTerm:lower(),1,true) ~= nil
    end

    -- Weapon Spawner
    MM2Tab:Paragraph({ Title = "⚔️ Weapon Spawner", Desc = "Spawn any weapon by name" })
    local weaponNameInput = ""
    MM2Tab:Input({ Flag = "MM2WeaponName", Title = "Weapon Name", Desc = "Enter weapon to spawn", Placeholder = "e.g., CandyBlade, Raygun",
        Callback = function(v) weaponNameInput = v end })
    MM2Tab:Button({ Title = "Spawn Weapon", Desc = "Spawn the entered weapon", Icon = "star", Color = Orange,
        Callback = function()
            if weaponNameInput ~= "" then SpawnWeapon(weaponNameInput)
            else WindUI:Notify({ Title = "Error", Content = "Enter a weapon name!", Icon = "x-circle", Duration = 3 }) end
        end })
    MM2Tab:Space()

    -- Weapon Duplication
    MM2Tab:Paragraph({ Title = "📋 Weapon Duplication", Desc = "Duplicate weapons (visual only)" })
    MM2Tab:Input({ Flag = "MM2DupeWeaponName", Title = "Weapon to Dupe", Desc = "Enter weapon name", Placeholder = "e.g., Lightbringer",
        Callback = function(v) selectedWeaponName = v end })
    MM2Tab:Input({ Flag = "MM2DupeAmount", Title = "Dupe Amount", Desc = "Number of times to duplicate", Placeholder = "e.g., 5", Value = "1",
        Callback = function(v) dupeAmount = tonumber(v) or 1 end })
    MM2Tab:Button({ Title = "Duplicate Weapon", Desc = "Dupe the specified weapon", Icon = "layers", Color = Gold,
        Callback = function()
            if selectedWeaponName == "" then
                WindUI:Notify({ Title = "Error", Content = "Enter a weapon name!", Icon = "x-circle", Duration = 3 }) return
            end
            WindUI:Notify({ Title = "Duplicating", Content = "Duping " .. selectedWeaponName .. "...", Icon = "clock", Duration = 2 })
            for i = 1, dupeAmount do DuplicateWeapon() end
            WindUI:Notify({ Title = "Complete", Content = "Duped " .. selectedWeaponName .. "!", Icon = "check-circle", Duration = 3 })
        end })
    MM2Tab:Button({ Title = "Dupe Entire Inventory", Desc = "Duplicate all weapons & pets", Icon = "archive", Color = Purple,
        Callback = function()
            WindUI:Notify({ Title = "Duplicating", Content = "Duping inventory...", Icon = "clock", Duration = 2 })
            DuplicateInventory()
            WindUI:Notify({ Title = "Complete", Content = "Inventory duplicated!", Icon = "check-circle", Duration = 3 })
        end })
    MM2Tab:Space()

    -- Visual Weapons
    MM2Tab:Paragraph({ Title = "👁️ Visual Weapons", Desc = "Change weapon appearance" })
    MM2Tab:Input({ Flag = "MM2FromWeapon", Title = "Weapon to Replace", Desc = "Your current weapon", Placeholder = "e.g., Blossom",
        Callback = function(v) fromWeapon = v end })
    MM2Tab:Input({ Flag = "MM2ToWeapon", Title = "Weapon to Receive", Desc = "Desired appearance", Placeholder = "e.g., Chroma",
        Callback = function(v) toWeapon = v end })
    MM2Tab:Button({ Title = "Change Visual", Desc = "Apply weapon appearance", Icon = "wand", Color = Blue,
        Callback = function()
            if fromWeapon == "" or toWeapon == "" then
                WindUI:Notify({ Title = "Error", Content = "Enter both weapon names!", Icon = "x-circle", Duration = 3 }) return
            end
            pcall(function()
                local ItemDatabase = require(ReplicatedStorage.Database.Sync.Item)
                local fromWeapons, toWeapons = {}, {}
                for itemName in pairs(ItemDatabase) do
                    if WeaponNameMatches(itemName, fromWeapon) then table.insert(fromWeapons, itemName) end
                    if WeaponNameMatches(itemName, toWeapon)   then table.insert(toWeapons,   itemName) end
                end
                if #fromWeapons > 0 and #toWeapons > 0 then
                    for _, from in ipairs(fromWeapons) do
                        for _, to in ipairs(toWeapons) do
                            ItemDatabase[from] = {}
                            for k, v in pairs(ItemDatabase[to]) do ItemDatabase[from][k] = v end
                            ReplicatedStorage.Remotes.Inventory.Equip:FireServer(to)
                        end
                    end
                    WindUI:Notify({ Title = "Success", Content = "Weapon visual changed!", Icon = "check-circle", Duration = 3 })
                else
                    WindUI:Notify({ Title = "Error", Content = "Weapon not found!", Icon = "x-circle", Duration = 3 })
                end
            end)
        end })
    MM2Tab:Space()
end

-------------------------------------------------------
-- ANIME ADVENTURE
-------------------------------------------------------
do
    local DrillTab = ScriptsSection:Tab({
        Title     = "🏕️ ANIME ADVENTURE",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#F97316"),
        IconShape = "Square",
    })

    DrillTab:Section({ Title = "Anime Adventure", TextSize = 18 })

    CreateScriptButton(DrillTab, "Anime Adventure", "Anime Adventure script", "tool", "https://cdn.sourceb.in/bins/mW2lHiXgvj/0", "Anime Adventure")
end

-------------------------------------------------------
-- TAP SIMULATOR REBORN
-------------------------------------------------------
do
    local DrillTab = ScriptsSection:Tab({
        Title     = "🖱️ Tap Simulator Reborn",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#F97316"),
        IconShape = "Square",
    })

    DrillTab:Section({ Title = "Tap Simulator Reborn", TextSize = 18 })

    CreateScriptButton(DrillTab, "Tap Simulator Reborn", "Tap Simulator Reborn script", "tool", "https://cdn.sourceb.in/bins/lZmexrhANH/0", "Tap Simulator")
end

-------------------------------------------------------
-- DRILL FOR BRAINROTS TAB
-------------------------------------------------------
do
    local DrillTab = ScriptsSection:Tab({
        Title     = "🔩 Drill for Brainrots",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#F97316"),
        IconShape = "Square",
    })

    DrillTab:Section({ Title = "Drill for Brainrots Scripts", TextSize = 18 })

    CreateScriptButton(DrillTab, "Drill for Brainrots", "Drill for Brainrots script", "tool", "https://raw.githubusercontent.com/unrexl/Scripts/refs/heads/main/Driller", "Drill for Brainrots")
end

-------------------------------------------------------
-- SOLS RNG TAB
-------------------------------------------------------
do
    local SolsTab = ScriptsSection:Tab({
        Title     = "🎲 Sols RNG",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#A855F7"),
        IconShape = "Square",
    })

    SolsTab:Section({ Title = "Sols RNG Scripts", TextSize = 18 })

    CreateScriptButton(SolsTab, "Sols RNG Egg Farm", "Auto egg farm for Sols RNG", "star", "https://raw.githubusercontent.com/iw4st/Scripts/refs/heads/main/solsrngeggfarm", "Sols RNG")
end

-------------------------------------------------------
-- DIESEL N STEEL TAB
-------------------------------------------------------
do
    local DieselTab = ScriptsSection:Tab({
        Title     = "⚙️ Diesel N Steel",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#78716C"),
        IconShape = "Square",
    })

    DieselTab:Section({ Title = "Diesel N Steel Scripts", TextSize = 18 })

    CreateScriptButton(DieselTab, "Diesel N Steel", "Diesel N Steel script", "settings", "https://api.jnkie.com/api/v1/luascripts/public/a07a0120bcea50d37b629985fa3b4086661791d3a0eeef0ae9da3dbfd1ab145f/download", "Diesel N Steel")
end

-------------------------------------------------------
-- ONE SCOPE TAB
-------------------------------------------------------
do
    local OneScopeTab = ScriptsSection:Tab({
        Title     = "🔭 One Scope",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#06B6D4"),
        IconShape = "Square",
    })

    OneScopeTab:Section({ Title = "One Scope Scripts", TextSize = 18 })

    CreateScriptButton(OneScopeTab, "One Scope", "One Scope game script", "crosshair", "https://eclipsegames.org/api/scripts/universal_aimbot", "One Scope")
end

-------------------------------------------------------
-- SORCERER TYCOON TAB
-------------------------------------------------------
do
    local SorcTab = ScriptsSection:Tab({
        Title     = "🧙 Sorcerer Tycoon",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#8B5CF6"),
        IconShape = "Square",
    })

    SorcTab:Section({ Title = "Sorcerer Tycoon Scripts", TextSize = 18 })

    CreateScriptButton(SorcTab, "Sorcerer Tycoon Boss Farm", "Auto boss farm for Sorcerer Tycoon", "zap", "https://raw.githubusercontent.com/unrexl/Scripts/refs/heads/main/BossFarmV6", "Sorcerer Tycoon")
end

-------------------------------------------------------
-- SAILOR PIECE TAB
-------------------------------------------------------
do
    local SailorTab = ScriptsSection:Tab({
        Title     = "⚓ Sailor Piece",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#0EA5E9"),
        IconShape = "Square",
    })

    SailorTab:Section({ Title = "Sailor Piece Scripts", TextSize = 18 })

    CreateScriptButton(SailorTab, "Sailor Piece", "Sailor Piece script", "anchor", "https://codeberg.org/hubs/sailor/raw/branch/main/piece", "Sailor Piece")
end

-------------------------------------------------------
-- MY KNIFE FARM TAB
-------------------------------------------------------
do
    local KnifeFarmTab = ScriptsSection:Tab({
        Title     = "🗡️ My Knife Farm",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#EF4444"),
        IconShape = "Square",
    })

    KnifeFarmTab:Section({ Title = "My Knife Farm Scripts", TextSize = 18 })

    CreateScriptButton(KnifeFarmTab, "My Knife Farm", "Auto knife farm script", "tool", "https://pastebin.com/raw/sZ3rMmP5", "My Knife Farm")
end

-------------------------------------------------------
-- BROOKHAVEN TAB
-------------------------------------------------------
do
    local BrookTab = ScriptsSection:Tab({
        Title     = "🏠 Brookhaven",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#FF6B9D"),
        IconShape = "Square",
    })

    BrookTab:Section({ Title = "Brookhaven RP Scripts", TextSize = 18 })

    CreateScriptButton(BrookTab, "Brookhaven Script Hub", "Feature-rich Brookhaven RP hub", "map-pin", "https://raw.githubusercontent.com/Front-Evill/Script-Hub/refs/heads/main/GUI/gui.brookhavan.lua", "Brookhaven")
end

-------------------------------------------------------
-- DOORS TAB
-------------------------------------------------------
do
    local DoorsTab = ScriptsSection:Tab({
        Title     = "🚪 DOORS",
        Icon      = "gamepad-2",
        IconColor = Color3.fromHex("#8B5CF6"),
        IconShape = "Square",
    })

    DoorsTab:Section({ Title = "DOORS Scripts", TextSize = 18 })

    CreateScriptButton(DoorsTab, "DOORS Bundle (KEY)", "Full DOORS script bundle", "key", "https://api.luarmor.net/files/v3/loaders/ae83a9f6cf2eed1ea6bf09ff11659945.lua", "DOORS")
end

-------------------------------------------------------
-- ARSENAL TAB
-------------------------------------------------------
do
    local ArsenalTab = ScriptsSection:Tab({
        Title     = "🔫 Arsenal",
        Icon      = "gamepad-2",
        IconColor = Red,
        IconShape = "Square",
    })

    ArsenalTab:Section({ Title = "Arsenal Scripts", TextSize = 18 })

    CreateScriptButton(ArsenalTab, "Owl Hub", "Classic Owl Hub for Arsenal", "target", "https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt", "Arsenal")
end

-------------------------------------------------------
-- RIVALS TAB
-------------------------------------------------------
do
    local RivalsTab = ScriptsSection:Tab({
        Title     = "⚔️ Rivals",
        Icon      = "gamepad-2",
        IconColor = Red,
        IconShape = "Square",
    })

    RivalsTab:Section({ Title = "Rivals Scripts", TextSize = 18 })

    CreateScriptButton(RivalsTab, "Rivals Script (KEY)", "Rivals hub script", "key", "https://raw.githubusercontent.com/axleoislost/Accent/main/Rivals", "Rivals")
end

-------------------------------------------------------
-- FISCH TAB
-------------------------------------------------------
do
    local FischTab = ScriptsSection:Tab({
        Title     = "🎣 Fisch",
        Icon      = "gamepad-2",
        IconColor = Blue,
        IconShape = "Square",
    })

    FischTab:Section({ Title = "Fisch Scripts", TextSize = 18 })

    CreateScriptButton(FischTab, "Fisch [SANTA] (KEY)", "Fisch script hub", "key", "https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua", "Fisch")
end

-------------------------------------------------------
-- OTHER GAMES TAB
-------------------------------------------------------
do
    local OtherTab = ScriptsSection:Tab({
        Title     = "🎮 Other Games",
        Icon      = "gamepad-2",
        IconColor = Yellow,
        IconShape = "Square",
    })

    OtherTab:Section({ Title = "Other Game Scripts", TextSize = 18 })

    CreateScriptButton(OtherTab, "Death Ball",              "Death Ball game script",      "circle",         "https://raw.githubusercontent.com/Urbanstormm/Project-Stark/main/Main.lua",              "Other")
    CreateScriptButton(OtherTab, "The Forge [XMAS] (KEY)",  "The Forge Christmas edition", "key",            "https://getastra.lol/loader.lua",                                                         "Other")
    CreateScriptButton(OtherTab, "99 Nights in the Forest", "Horror hub script (KEY)",     "moon",           "https://raw.githubusercontent.com/Nicuse101/RobloxUtils/refs/heads/master/99NITF.lua",    "Other")
    CreateScriptButton(OtherTab, "Scary Shawarma Kiosk",    "Horror anomaly script (KEY)", "alert-triangle", "https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/loader",    "Other")
    CreateScriptButton(OtherTab, "Than Hub",                "Than hub utilities",          "tool",           "https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1",                 "Other")
end

-------------------------------------------------------
-- UTILITY: MISC TAB
-------------------------------------------------------
do
    local MiscTab = UtilSection:Tab({
        Title     = "⚙️ Misc",
        Icon      = "settings",
        IconColor = Yellow,
        IconShape = "Square",
    })

    MiscTab:Section({ Title = "Miscellaneous Utilities", TextSize = 18 })

    MiscTab:Dropdown({
        Title   = "Theme Switcher",
        Desc    = "Change the hub's appearance",
        Values  = {"Dark", "Light", "Rose"},
        Default = "Dark",
        Callback = function(theme) WindUI:SetTheme(theme) end
    })

    MiscTab:Space()

    MiscTab:Button({
        Title = "Anti AFK",
        Desc  = "Prevent being kicked for inactivity",
        Icon  = "clock",
        Callback = function()
            LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            WindUI:Notify({ Title = "Anti AFK", Content = "Anti AFK enabled! You won't be kicked.", Duration = 3 })
        end
    })

    MiscTab:Space()

    MiscTab:Toggle({
        Title = "Auto Snowball Pug",
        Desc  = "Auto fires snowball remotes",
        Default = false,
        Callback = function(v)
            getgenv().AutoSnowballPug = v
            if v then
                task.spawn(function()
                    while getgenv().AutoSnowballPug do
                        task.wait(0.15)
                        pcall(function()
                            local api = ReplicatedStorage:FindFirstChild("API")
                            if api then
                                for _, r in pairs(api:GetChildren()) do
                                    if r:IsA("RemoteEvent") then r:FireServer()
                                    elseif r:IsA("RemoteFunction") then r:InvokeServer(true) end
                                end
                            end
                        end)
                    end
                end)
            end
            WindUI:Notify({ Title = "Auto Snowball", Content = v and "Enabled!" or "Disabled!", Duration = 2 })
        end
    })

    MiscTab:Space()

    MiscTab:Button({
        Title = "Rejoin Server",
        Desc  = "Rejoin the current server",
        Icon  = "refresh-cw",
        Callback = function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    })

    MiscTab:Space()

    MiscTab:Button({
        Title = "Server Hop",
        Desc  = "Join a different server",
        Icon  = "shuffle",
        Callback = function()
            local servers = HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")
            )
            for _, s in pairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    break
                end
            end
        end
    })

    MiscTab:Space()

    -- Walk Speed
    local SpeedValue = 16
    MiscTab:Slider({
        Title = "Walk Speed",
        Desc  = "Adjust your walking speed",
        Step  = 1,
        Value = { Min = 16, Max = 200, Default = 16 },
        Callback = function(value)
            SpeedValue = value
            local p = Players.LocalPlayer
            if p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.WalkSpeed = value
            end
        end
    })

    LocalPlayer.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        if character:FindFirstChild("Humanoid") then character.Humanoid.WalkSpeed = SpeedValue end
    end)

    MiscTab:Space()

    -- Jump Power
    local JumpValue = 50
    MiscTab:Slider({
        Title = "Jump Power",
        Desc  = "Adjust your jump height",
        Step  = 1,
        Value = { Min = 50, Max = 300, Default = 50 },
        Callback = function(value)
            JumpValue = value
            local p = Players.LocalPlayer
            if p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.JumpPower = value
            end
        end
    })

    LocalPlayer.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        if character:FindFirstChild("Humanoid") then character.Humanoid.JumpPower = JumpValue end
    end)

    MiscTab:Space()

    CreateScriptButton(MiscTab, "FPS Booster", "Increase game performance", "gauge", "YOUR_FPS_BOOSTER_URL_HERE", "Misc")
end

-------------------------------------------------------
-- UTILITY: PLAYER STATS TAB
-------------------------------------------------------
do
    local StatsTab = UtilSection:Tab({
        Title     = "📊 Stats",
        Icon      = "activity",
        IconColor = Green,
        IconShape = "Square",
    })

    local function getPlayTime()
        local elapsed = tick() - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = math.floor(elapsed % 60)
        return string.format("%02d:%02d:%02d", h, m, s)
    end

    local function getPing()
        local ok, ping = pcall(function()
            return math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        return ok and (ping .. "ms") or "N/A"
    end

    local function getFPS()
        local t = tick()
        RunService.Heartbeat:Wait()
        return math.floor(1 / (tick() - t))
    end

    local function getStats()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hp = hum and math.floor(hum.Health) or 0
        local maxhp = hum and math.floor(hum.MaxHealth) or 100
        local pos = root and string.format("%.0f, %.0f, %.0f",
            root.Position.X, root.Position.Y, root.Position.Z) or "N/A"
        return hp, maxhp, pos
    end

    StatsTab:Section({ Title = "📋 Session Info", TextSize = 18 })

    StatsTab:Button({
        Title = "🔄 Refresh Stats",
        Desc  = "Click to get your current stats",
        Icon  = "refresh-cw",
        Callback = function()
            local hp, maxhp, pos = getStats()
            local fps = getFPS()
            WindUI:Notify({
                Title   = "📊 Session Stats",
                Content = "⏱ Time: " .. getPlayTime() ..
                          " | 📦 Scripts: " .. scriptsLoadedCount ..
                          "\n🖥 FPS: " .. fps ..
                          " | 📡 Ping: " .. getPing() ..
                          "\n❤️ HP: " .. hp .. "/" .. maxhp ..
                          "\n📍 Pos: " .. pos,
                Duration = 6
            })
        end
    })

    StatsTab:Space()

    StatsTab:Paragraph({
        Title = "👤 Player Info",
        Desc  = "Username: @" .. LocalPlayer.Name ..
                "\nDisplay Name: " .. LocalPlayer.DisplayName ..
                "\nUser ID: " .. LocalPlayer.UserId,
        Color = "Blue"
    })

    StatsTab:Paragraph({
        Title = "🖥 Server Info",
        Desc  = "Place ID: " .. game.PlaceId ..
                "\nPlayers: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers ..
                "\nJob ID: " .. game.JobId:sub(1, 20) .. "...",
        Color = "Green"
    })

    StatsTab:Space()
    StatsTab:Section({ Title = "Quick Actions", TextSize = 18 })

    StatsTab:Button({
        Title = "Copy Username",
        Desc  = "Copy your Roblox username",
        Icon  = "user",
        Callback = function()
            setclipboard(LocalPlayer.Name)
            WindUI:Notify({ Title = "Copied", Content = "@" .. LocalPlayer.Name .. " copied!", Duration = 2 })
        end
    })

    StatsTab:Button({
        Title = "Copy User ID",
        Desc  = "Copy your Roblox User ID",
        Icon  = "hash",
        Callback = function()
            setclipboard(tostring(LocalPlayer.UserId))
            WindUI:Notify({ Title = "Copied", Content = "User ID copied!", Duration = 2 })
        end
    })

    StatsTab:Button({
        Title = "Copy Job ID",
        Desc  = "Copy the current server Job ID",
        Icon  = "server",
        Callback = function()
            setclipboard(game.JobId)
            WindUI:Notify({ Title = "Copied", Content = "Job ID copied!", Duration = 2 })
        end
    })
end

-------------------------------------------------------
-- INFO: DISCORD TAB
-------------------------------------------------------
do
    local DiscordTab = InfoSection:Tab({
        Title     = "💬 Discord",
        Icon      = "message-circle",
        IconColor = Color3.fromHex("#5865F2"),
        IconShape = "Square",
    })

    DiscordTab:Section({ Title = "Join Our Community!", TextSize = 20 })

    DiscordTab:Paragraph({
        Title = "Discord Server",
        Desc  = "Join our Discord for updates, support, and more scripts!",
        Buttons = {
            {
                Title = "Copy Discord Link",
                Icon  = "link",
                Callback = function()
                    setclipboard("https://discord.gg/AzbK3utXg")
                    WindUI:Notify({ Title = "Discord", Content = "Discord link copied!", Duration = 3 })
                end
            }
        }
    })

    DiscordTab:Space()

    DiscordTab:Button({
        Title    = "Join Discord",
        Desc     = "Click to copy the invite link",
        Icon     = "users",
        Color    = Color3.fromHex("#5865F2"),
        Callback = function()
            setclipboard("https://discord.gg/AzbK3utXg")
            WindUI:Notify({ Title = "Discord", Content = "Discord link copied! Paste it in your browser.", Duration = 5 })
        end
    })

    DiscordTab:Space()
    DiscordTab:Section({ Title = "Socials", TextSize = 16 })

    DiscordTab:Button({ Title = "YouTube Channel", Icon = "youtube", Callback = function()
        setclipboard("https://youtube.com/@ivnzdscripts?si=f2wSmF9jjS3Yl42i")
        WindUI:Notify({ Title = "Copied", Content = "YouTube link copied!", Duration = 3 })
    end })

    DiscordTab:Button({ Title = "TikTok Profile", Icon = "music", Callback = function()
        setclipboard("tiktok.com/@gloczx2")
        WindUI:Notify({ Title = "Copied", Content = "TikTok link copied!", Duration = 3 })
    end })

    DiscordTab:Space()
    DiscordTab:Section({ Title = "What you get", TextSize = 16 })

    DiscordTab:Paragraph({
        Title = "Community Hub",
        Desc  = "• Latest script updates\n• Bug reports & support\n• New feature requests\n• Feedback & suggestions\n• Connect with other users",
    })
end

-------------------------------------------------------
-- INFO: ABOUT TAB
-------------------------------------------------------
do
    local AboutTab = InfoSection:Tab({
        Title     = "ℹ️ About",
        Icon      = "info",
        IconColor = Grey,
        IconShape = "Square",
    })

    AboutTab:Paragraph({
        Title = "GlocZ Script Hub",
        Desc  = "Universal script hub for multiple popular Roblox games.\n" ..
                "Supports both Mobile (Android/iOS) and PC with a modern WindUI design.\n" ..
                "Version: v2.0.0  |  Status: Stable",
        Image = "info",
        Color = "Blue"
    })

    AboutTab:Paragraph({
        Title = "✨ Features",
        Desc  = "• Supports a wide variety of games\n" ..
                "• Live Stats Dashboard — ping, FPS, HP, position\n" ..
                "• Fast one-click script loading with load counter\n" ..
                "• Individual tabs per game (MM2, ADM, Arsenal, DOORS...)\n" ..
                "• Built-in MM2 Weapon Tools\n" ..
                "• Theme switcher (Dark / Light / Rose)\n" ..
                "• Walk Speed & Jump Power sliders\n" ..
                "• Auto Snowball Pug toggle",
        Image = "star"
    })

    AboutTab:Paragraph({
        Title = "📝 How to Use",
        Desc  = "1. Pick a game tab from the Scripts section\n2. Click any script button to load it\n3. Use Utility section for misc tools\n4. Enjoy!",
        Image = "edit"
    })

    AboutTab:Paragraph({
        Title = "Credits",
        Desc  = "UI Library: WindUI by Footagesus\nHub assembled by GlocZ",
        Image = "star",
        Color = "Green"
    })
end

-------------------------------------------------------
-- WELCOME NOTIFICATION
-------------------------------------------------------
WindUI:Notify({
    Title    = "GlocZ Hub Loaded",
    Content  = "v2.0.0 — Welcome! Select a category to browse scripts.",
    Icon     = "check-circle",
    Duration = 5,
})
