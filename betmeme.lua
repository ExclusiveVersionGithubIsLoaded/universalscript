
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local toggleButton = Instance.new("TextButton")

gui.Name = "CustomMenu"
gui.Parent = player:WaitForChild("PlayerGui")


frame.Name = "MenuFrame"
frame.Size = UDim2.new(0, 300, 0, 200) 
frame.Position = UDim2.new(0.5, -150, 0.5, -150) 
frame.BackgroundColor3 = Color3.fromRGB(127, 255, 212) 
frame.BackgroundTransparency = 0.3 
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true 
frame.Parent = gui

title.Name = "Title"
title.Size = UDim2.new(1, 0, 0.3, 0) 
title.BackgroundTransparency = 1
title.Text = "Version HUB | by version"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = frame


toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.8, 0, 0.5, 0)
toggleButton.Position = UDim2.new(0.1, 0, 0.4, 0) 
toggleButton.BackgroundColor3 = Color3.fromRGB(102, 204, 204) 
toggleButton.Text = "inf money on"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
toggleButton.Parent = frame

local isActive = false
local rewardConnection

toggleButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    if isActive then
        toggleButton.Text = "inf money off"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 153, 153) 

        rewardConnection = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                game:GetService("ReplicatedStorage").Services.DailyService.RF.GetReward:InvokeServer()
            end)
        end)
    else
        toggleButton.Text = "inf money off"
        toggleButton.BackgroundColor3 = Color3.fromRGB(102, 204, 204) 
        if rewardConnection then
            rewardConnection:Disconnect()
            rewardConnection = nil
        end
    end
end)
