local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))() -- Загрузка Orion Library
local Window = OrionLib:MakeWindow({Name = "Auto Aim + ESP", HidePremium = false, SaveConfig = true, ConfigFolder = "AutoAimConfig"})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local espEnabled = false
local autoAimEnabled = false
local holdingRMB = false

local chamsCache = {} -- Кэш подсветки для предотвращения лагов

-- Функция для создания подсветки
local function createChams(part)
    local chams = Instance.new("BoxHandleAdornment")
    chams.Size = part.Size
    chams.AlwaysOnTop = true
    chams.ZIndex = 10
    chams.Adornee = part
    chams.Color3 = Color3.new(0, 0.5, 1) -- Голубой цвет для всех
    chams.Transparency = 0.7
    chams.Parent = part
    return chams
end

-- Функция для применения ESP
local function applyESP()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("Head") then
            -- Исключаем игрока
            if object ~= game.Players.LocalPlayer.Character then
                for _, part in pairs(object:GetChildren()) do
                    if part:IsA("BasePart") and not chamsCache[part] then
                        chamsCache[part] = createChams(part) -- Добавляем в кэш
                    end
                end
            end
        end
    end
end

-- Функция для удаления ESP
local function removeESP()
    for part, adornment in pairs(chamsCache) do
        if adornment then
            adornment:Destroy()
        end
    end
    chamsCache = {} -- Очищаем кэш
end

-- Обновление ESP при изменении окружения
workspace.DescendantAdded:Connect(function(newDescendant)
    if espEnabled then
        task.wait(0.1) -- Небольшая задержка для корректной обработки
        if newDescendant:IsA("Model") and newDescendant:FindFirstChild("Humanoid") and newDescendant:FindFirstChild("Head") then
            if newDescendant ~= game.Players.LocalPlayer.Character then
                for _, part in pairs(newDescendant:GetChildren()) do
                    if part:IsA("BasePart") and not chamsCache[part] then
                        chamsCache[part] = createChams(part)
                    end
                end
            end
        end
    end
end)

-- Функция для автонаводки
local function aimAtClosestEnemy()
    local camera = workspace.CurrentCamera
    local closestEnemy = nil
    local closestAngle = math.huge

    for _, enemy in pairs(workspace:GetDescendants()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("Head") then
            if enemy ~= game.Players.LocalPlayer.Character then
                local head = enemy.Head
                local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)

                if onScreen then
                    local mousePos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                    local headPos = Vector2.new(screenPoint.X, screenPoint.Y)
                    local angle = (mousePos - headPos).Magnitude

                    if angle < closestAngle then
                        closestEnemy = head
                        closestAngle = angle
                    end
                end
            end
        end
    end

    -- Мгновенное наведение
    if closestEnemy then
        local targetPosition = closestEnemy.Position
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
    end
end

-- Слушатель для правой кнопки мыши
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then -- ПКМ зажата
        holdingRMB = true
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then -- ПКМ отпущена
        holdingRMB = false
    end
end)

-- Цикл для автонаводки
task.spawn(function()
    while task.wait(0.03) do -- Частое обновление
        if autoAimEnabled and holdingRMB then
            aimAtClosestEnemy()
        end
    end
end)

-- Добавляем чекбоксы
MainTab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(value)
        espEnabled = value
        if espEnabled then
            applyESP()
        else
            removeESP()
        end
    end
})

MainTab:AddToggle({
    Name = "Auto Aim (Hold RMB)",
    Default = false,
    Callback = function(value)
        autoAimEnabled = value
    end
})

-- Инициализация Orion Library
OrionLib:Init()
