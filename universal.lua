local TweenService = game:GetService("TweenService")

local menu = Instance.new("ScreenGui")
menu.Name = "cheatsMenu"
menu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 470)
frame.Position = UDim2.new(0.5, -125, 0.5, -235) 
frame.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
frame.BackgroundTransparency = 0.2 
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = menu

local yOffset = 0.1 
local buttonHeight = 0.1 

local function createButton(text, yPosition, clickFunction)
    local newButton = Instance.new("TextButton")
    newButton.Text = text
    newButton.Size = UDim2.new(0, 200, 0, 50)
    newButton.Position = UDim2.new(0.5, -100, yOffset + (yPosition * (buttonHeight + 0.05)), -25)
    newButton.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
    newButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    newButton.BorderSizePixel = 0
    newButton.Parent = frame
    
    newButton.MouseButton1Click:Connect(clickFunction)
end

local function activateCheat()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/HHubmega/master/BreakIn", true))()
end

local function changeColor()
    frame.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
end

local function executeScript1()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
end

local function executeScript2()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
end

local function executeScript3()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua"))()
end

local function executeScript4()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip", true))()
end

createButton("Break In (Story)", 0, activateCheat)
createButton("Change Color", 1, changeColor)
createButton("3008", 2, executeScript1)
createButton("Evade", 3, executeScript2)
createButton("arsenal", 4, executeScript3)
createButton("A Dusty Trip", 5, executeScript4)


frame.Position = UDim2.new(0.5, -125, 0.5, -235)
