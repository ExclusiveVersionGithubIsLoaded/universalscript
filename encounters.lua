local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "encounters | version HUB",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "VersHUB_BOOST"
})

local MainTab = Window:MakeTab({
    Name = "main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

_G.AutoBlock = false
_G.InfEnergy = false
_G.NoCooldown = false
_G.InfCharge = false
_G.InfDamageTracker = false
_G.SetKills = false
_G.SetLives = false

local function AutoBlockFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.AutoBlock then
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateGuardOn:FireServer()
        game:GetService("Workspace")[name].Guarding.Value = false
        game:GetService("ReplicatedStorage").RemoteEvents.ReplicateGuardOff:FireServer()
    end
end

local function InfEnergyFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.InfEnergy then
        game:GetService("Workspace")[name].Energy.Value = 100
    end
end

local function InfChargeFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.InfCharge then
        game:GetService("Workspace")[name].Charge.Value = 100
    end
end

local function InfDamageTrackerFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.InfDamageTracker then
        game:GetService("Workspace")[name].DamageTracker.Value = 9999
    end
end

local function NoCooldownFunction()
    spawn(function()
        a = hookfunction(wait, function(b)
            if b ~= 0 and tostring(getcallingscript(a)) ~= "nil" and tonumber(b) < 2.5 and _G.NoCooldown then
                return a()
            end
            return a(b)
        end)
    end)
end

local function SetKillsFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.SetKills and game.Players[name]:FindFirstChild("leaderstats") and game.Players[name].leaderstats:FindFirstChild("Kills") then
        game.Players[name].leaderstats.Kills.Value = 1488
    end
end

local function SetLivesFunction()
    local name = tostring(game.Players.LocalPlayer.Name)
    if _G.SetLives and game.Players[name]:FindFirstChild("leaderstats") and game.Players[name].leaderstats:FindFirstChild("Lives") then
        game.Players[name].leaderstats.Lives.Value = 100
    end
end

MainTab:AddToggle({
    Name = "auto defense (may not work)",
    Default = false,
    Callback = function(value)
        _G.AutoBlock = value
        if value then
            AutoBlockFunction()
        end
    end
})

MainTab:AddToggle({
    Name = "inf energy",
    Default = false,
    Callback = function(value)
        _G.InfEnergy = value
        if value then
            InfEnergyFunction()
        end
    end
})

MainTab:AddToggle({
    Name = "no cooldown",
    Default = false,
    Callback = function(value)
        _G.NoCooldown = value
        if value then
            NoCooldownFunction()
        end
    end
})

MainTab:AddToggle({
    Name = "inf ultimate (don't work on some characters)",
    Default = false,
    Callback = function(value)
        _G.InfCharge = value
        if value then
            InfChargeFunction()
        end
    end
})

MainTab:AddToggle({
    Name = "inf combat (client only!)",
    Default = false,
    Callback = function(value)
        _G.InfDamageTracker = value
        if value then
            InfDamageTrackerFunction()
        end
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if _G.AutoBlock then
        AutoBlockFunction()
    end
    if _G.InfEnergy then
        InfEnergyFunction()
    end
    if _G.InfCharge then
        InfChargeFunction()
    end
    if _G.InfDamageTracker then
        InfDamageTrackerFunction()
    end
    if _G.SetKills then
        SetKillsFunction()
    end
    if _G.SetLives then
        SetLivesFunction()
    end
end)


MainTab:AddButton({
    Name = "activate normal hitbox",
    Callback = function()
        _G.HeadSize = 1
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Disabled then
                for i, v in pairs(game:GetService('Players'):GetPlayers()) do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})

MainTab:AddButton({
    Name = "activate big hitbox",
    Callback = function()
        _G.HeadSize = 15
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Disabled then
                for i, v in pairs(game:GetService('Players'):GetPlayers()) do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})

MainTab:AddButton({
    Name = "activate Very big hitbox",
    Callback = function()
        _G.HeadSize = 30
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Disabled then
                for i, v in pairs(game:GetService('Players'):GetPlayers()) do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})

OrionLib:Init()
