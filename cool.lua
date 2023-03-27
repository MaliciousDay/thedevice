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

    
        Title = 'blox channel fucker v2 yaaaay by tr0y yaaay',
        Center = true, 
        AutoShow = true,
    })
    

    local Tabs = {

        Main = Window:AddTab('fun gun thingz'), 
    }
    

    local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Gun modifications')
    

local Apply = LeftGroupBox:AddButton('Applygunmodz', function()
    mainreq = require(game.Players.LocalPlayer.Character[gun2Apply]["GunCore.new"].GunConfig)
    mainreq.FireRate = Options.Firerateslider.Value
    mainreq.MaxAmmo = ammo2
    mainreq.BulletsPerShot = Options.bps.Value
    mainreq.BulletSpread = Options.spread.Value
    mainreq.HitDamage = Options.HitDamage.Value
end)


    
    LeftGroupBox:AddInput('Gunname', {
        Default = 'Enter gun name',
        Numeric = false, 
        Finished = true, 
    
        Text = 'Gun name',
        Tooltip = 'Name of the tool to apply gun mods to', 
    
        Placeholder = 'Gun name', 
      
    })
    
        LeftGroupBox:AddDivider()

    LeftGroupBox:AddLabel('Gun mods: \n')
    
    

    LeftGroupBox:AddSlider('Firerateslider', {
        Text = 'Fire Rate',
        Default = 0,
        Min = 0,
        Max = 2,
        Rounding = 2,
    
        Compact = false, 
    })
    
        LeftGroupBox:AddSlider('HitDamage', {
        Text = 'Hit damage',
        Default = 1,
        Min = 1,
        Max = 100,
        Rounding = 0,
    
        Compact = false, 
    })
    
        LeftGroupBox:AddSlider('bps', {
        Text = 'Bullets per shot',
        Default = 1,
        Min = 1,
        Max = 8,
        Rounding = 0,
    
        Compact = false, 
    })
    
            LeftGroupBox:AddSlider('spread', {
        Text = 'Bullet spread',
        Default = 0,
        Min = 0,
        Max = 8,
        Rounding = 1,
    
        Compact = false, 
    })
    

    
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
        Numeric = false, 
        Finished = true, 
    
        Text = 'Ammo',
        Tooltip = 'Amount of ammo you want, type "inf" for infinite.', 
    
        Placeholder = 'Ammo', 
    })
    
    Options.AmmoMax:OnChanged(function()
        if Options.AmmoMax.Value == "inf" then
            ammo2 = math.huge
        else
            ammo2 = tonumber(Options.AmmoMax.Value)
        end
    end)
    
    
    Library:SetWatermarkVisibility(true)
    
 
    Library:SetWatermark('blox channel fucker | v2 | '..game.Players.LocalPlayer.Name..' | a work of tr0y#0001')
    
    
    
    Library:OnUnload(function()
        Library.Unloaded = true
    end)
    
end
