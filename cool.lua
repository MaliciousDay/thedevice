_G.loaded = false

local gun2Apply;
local mainreq;
local ammo2;
local bps;

if _G.loaded == false then
    _G.loaded = true
    local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
    local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
    local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiriko-Protection/Utilities/main/Neverlose.lua'))()
    local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
    
    local Window = Library:CreateWindow({
        -- Set Center to true if you want the menu to appear in the center
        -- Set AutoShow to true if you want the menu to appear when it is created
        -- Position and Size are also valid options here
        -- but you do not need to define them unless you are changing them :)
    
        Title = 'blox channel fucker v2 yaaaay by tr0y yaaay',
        Center = true, 
        AutoShow = true,
    })
    
    -- You do not have to set your tabs & groups up this way, just a prefrence.
    local Tabs = {
        -- Creates a new tab titled Main
        Main = Window:AddTab('fun gun thingz'), 
    }
    
    -- Groupbox and Tabbox inherit the same functions
    -- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
    local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Gun modifications')
    
    -- Tabboxes are a tiny bit different, but here's a basic example:
    --[[
    
    local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side
    
    local Tab1 = TabBox:AddTab('Tab 1')
    local Tab2 = TabBox:AddTab('Tab 2')
    
    -- You can now call AddToggle, etc on the tabs you added to the Tabbox
    ]]
    
    -- Groupbox:AddToggle
    -- Arguments: Index, Options
local Apply = LeftGroupBox:AddButton('Applygunmodz', function()
    mainreq = require(game.Players.LocalPlayer.Character[gun2Apply]["GunCore.new"].GunConfig)
    mainreq.FireRate = Options.Firerateslider.Value
    mainreq.MaxAmmo = ammo2
    mainreq.BulletsPerShot = Options.bps.Value
end)


    
    LeftGroupBox:AddInput('Gunname', {
        Default = 'Enter gun name',
        Numeric = false, -- true / false, only allows numbers
        Finished = true, -- true / false, only calls callback when you press enter
    
        Text = 'Gun name',
        Tooltip = 'Name of the tool to apply gun mods to', -- Information shown when you hover over the textbox
    
        Placeholder = 'Gun name', -- placeholder text when the box is empty
        -- MaxLength is also an option which is the max length of the text
    })
    
        LeftGroupBox:AddDivider()

    -- Fetching a toggle object for later use:
    -- Toggles.MyToggle.Value
    
    -- Toggles is a table added to getgenv() by the library
    -- You index Toggles with the specified index, in this case it is 'MyToggle'
    -- To get the state of the toggle you do toggle.Value
    
    -- Calls the passed function when the toggle is updated

    
    -- This should print to the console: "My toggle state changed! New value: false"
    
    
    -- Groupbox:AddButton
    -- Arguments: Text, Callback
    
    
    -- Button:AddTooltip
    -- Arguments: ToolTip
    
    
    -- NOTE: You can chain the button methods!
    --[[
        EXAMPLE: 
    
        LeftGroupBox:AddButton('Kill all', Functions.KillAll):AddTooltip('This will kill everyone in the game!')
            :AddButton('Kick all', Functions.KickAll):AddTooltip('This will kick everyone in the game!')
    ]]
    
    -- Groupbox:AddLabel
    -- Arguments: Text, DoesWrap
    LeftGroupBox:AddLabel('Gun mods: \n')
    
    
    
    -- Groupbox:AddSlider
    -- Arguments: Idx, Options
    LeftGroupBox:AddSlider('Firerateslider', {
        Text = 'Fire Rate',
        Default = 0,
        Min = 0,
        Max = 2,
        Rounding = 2,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
        LeftGroupBox:AddSlider('bps', {
        Text = 'Bullets per shot',
        Default = 0,
        Min = 1,
        Max = 8,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    -- Options is a table added to getgenv() by the library
    -- You index Options with the specified index, in this case it is 'MySlider'
    -- To get the value of the slider you do slider.Value
    
    local Number = Options.Firerateslider.Value
    Options.Firerateslider:OnChanged(function()
    end)
    
    Options.bps:OnChanged(function()
    end)
    
    
    Options.Gunname:OnChanged(function()
        gun2Apply = tostring(Options.Gunname.Value)
    end)
    
    LeftGroupBox:AddInput('AmmoMax', {
        Default = 'Enter amount of ammo',
        Numeric = false, -- true / false, only allows numbers
        Finished = true, -- true / false, only calls callback when you press enter
    
        Text = 'Ammo',
        Tooltip = 'Amount of ammo you want, type "inf" for infinite.', -- Information shown when you hover over the textbox
    
        Placeholder = 'Ammo', -- placeholder text when the box is empty
        -- MaxLength is also an option which is the max length of the text
    })
    
    Options.AmmoMax:OnChanged(function()
        if Options.AmmoMax.Value == "inf" then
            ammo2 = math.huge
        else
            ammo2 = tonumber(Options.AmmoMax.Value)
        end
    end)
    
    
    Library:SetWatermarkVisibility(true)
    
    -- Sets the watermark text
    Library:SetWatermark('blox channel fucker | v2 | '..game.Players.LocalPlayer.Name..' | a work of tr0y#0001')
    
    
    
    Library:OnUnload(function()
        Library.Unloaded = true
    end)
    
end
