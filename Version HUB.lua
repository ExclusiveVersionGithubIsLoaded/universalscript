local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local menu = Instance.new("ScreenGui")
menu.Name = "cheatsMenu"
menu.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function showLoadingScreen(callback)
    local loadingScreen = Instance.new("Frame")
    loadingScreen.Size = UDim2.new(0, 300, 0, 150)
    loadingScreen.Position = UDim2.new(0.5, -150, 0.5, -75)
    loadingScreen.BackgroundTransparency = 1
    loadingScreen.BorderSizePixel = 0
    loadingScreen.Parent = menu

    local function createLetter(char, delay)
        local letter = Instance.new("TextLabel")
        letter.Text = char
        letter.Size = UDim2.new(0, 50, 0, 80)
        letter.Position = UDim2.new(0, -150 + (#loadingScreen:GetChildren() * 50), 0, 35)
        letter.TextColor3 = Color3.fromRGB(255, 255, 255)
        letter.BackgroundTransparency = 1
        letter.TextSize = 48
        letter.Font = Enum.Font.SourceSansBold
        letter.Parent = loadingScreen
        letter.TextTransparency = 1

        local appearTween = TweenService:Create(letter, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, delay), {TextTransparency = 0})
        appearTween:Play()

        -- Fire effect
        local fireEffect = Instance.new("ParticleEmitter")
        fireEffect.Texture = "rbxassetid://687997172"
        fireEffect.Size = NumberSequence.new(0.5)
        fireEffect.Lifetime = NumberRange.new(0.5)
        fireEffect.Rate = 50
        fireEffect.VelocitySpread = 180
        fireEffect.Parent = letter

        wait(0.1) -- Delay between letters appearing

        return letter
    end

    local text = "VERSION HUB"
    for i = 1, #text do
        createLetter(text:sub(i, i), i * 0.1)
    end

    wait(3) -- Loading screen display time

    loadingScreen:Destroy()
    callback()
end

showLoadingScreen(function()
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 600, 0, 600)
    frame.Position = UDim2.new(0.5, -300, 0.5, -300)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = menu

    local bgImage = Instance.new("ImageLabel")
    bgImage.Size = UDim2.new(1, 0, 1, 0)
    bgImage.Position = UDim2.new(0, 0, 0, 0)
    bgImage.Image = "rbxassetid://INSERT_BACKGROUND_IMAGE_ID_HERE"
    bgImage.Parent = frame
    bgImage.ZIndex = -1

    local function createShadow(parent)
        local shadow = Instance.new("ImageLabel")
        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        shadow.Position = UDim2.new(0.5, 0, 0.5, 5)
        shadow.Size = UDim2.new(1, 10, 1, 10)
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://1316045217"
        shadow.ImageTransparency = 0.6
        shadow.ZIndex = parent.ZIndex - 1
        shadow.Parent = parent
    end

    createShadow(frame)

    local function createButtonWithShadow(text, position, size, clickFunction)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = size
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Parent = frame
        button.AutoButtonColor = false

        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 5)
        uiCorner.Parent = button

        createShadow(button)

        button.MouseButton1Click:Connect(clickFunction)
    end

    local function activateCheat()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end

    local function executeScript1()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    end

    local function executeScript2()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end

    local function executeScript3()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/4xdhondiscord/SerenadeHub/main/Serenade", true))()
    end

    local function executeScript4()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundTransparency = 1
    mainFrame.Parent = frame

    local hubsFrame = Instance.new("Frame")
    hubsFrame.Size = UDim2.new(1, 0, 1, 0)
    hubsFrame.BackgroundTransparency = 1
    hubsFrame.Visible = false
    hubsFrame.Parent = frame

    -- Main Frame Content
    local function createCheatButton(text, position, clickFunction)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0, 150, 0, 30)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Parent = mainFrame
        button.AutoButtonColor = false

        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 5)
        uiCorner.Parent = button

        createShadow(button)

        button.MouseButton1Click:Connect(clickFunction)
    end

    createCheatButton("BreakIn", UDim2.new(0, 40, 0, 50), activateCheat)
    createCheatButton("Sky Hub", UDim2.new(0, 240, 0, 50), executeScript1)
    createCheatButton("TbaoHub", UDim2.new(0, 440, 0, 50), executeScript2)
    createCheatButton("Luarmor", UDim2.new(0, 40, 0, 100), executeScript3)
    createCheatButton("ADustyTrip", UDim2.new(0, 240, 0, 100), executeScript4)

    -- Hubs Frame Content
    local function createHubButton(text, position, clickFunction)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0, 150, 0, 30)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Parent = hubsFrame
        button.AutoButtonColor = false

        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 5)
        uiCorner.Parent = button

        createShadow(button)

        button.MouseButton1Click:Connect(clickFunction)
    end

    createHubButton("Orca", UDim2.new(0, 40, 0, 50), function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end)

    createHubButton("Sky Hub", UDim2.new(0, 240, 0, 50), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    end)

    createHubButton("Ghost Hub", UDim2.new(0, 440, 0, 50), function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end)

    createHubButton("Serenade Hub", UDim2.new(0, 40, 0, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/4xdhondiscord/SerenadeHub/main/Serenade", true))()
    end)

    createHubButton("Holf Hub", UDim2.new(0, 240, 0, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
    end)

    -- Side Buttons
    local function createSideButton(text, position, clickFunction)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0, 150, 0, 50)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Parent = frame
        button.AutoButtonColor = false

        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 5)
        uiCorner.Parent = button

        createShadow(button)

        button.MouseButton1Click:Connect(clickFunction)
    end

    createSideButton("Main", UDim2.new(0, -150, 0.1, 0), function()
        mainFrame.Visible = true
        hubsFrame.Visible = false
    end)

    createSideButton("Hubs", UDim2.new(0, -150, 0.3, 0), function()
        mainFrame.Visible = false
        hubsFrame.Visible = true
    end)
end)
