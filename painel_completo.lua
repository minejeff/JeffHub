-- painel_completo.lua
if game.PlaceId ~= 4520749081 then return end  -- Only King Legacy

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "JeffHubUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 540)
frame.Position = UDim2.new(0.5, -180, 0.5, -270)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
local uic = Instance.new("UICorner", frame)
uic.CornerRadius = UDim.new(0, 16)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🎮 JEFFHUB - KING LEGACY [UPD 8]"
title.Font = Enum.Font.Fantasy
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.BackgroundTransparency = 1
title.TextSize = 20

-- Scrolling frame
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)

-- Button creator
local function createButton(text, func)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 40)
    b.Position = UDim2.new(0, 10, 0, 0)
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.Text = text
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 18
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    b.MouseButton1Click:Connect(func)
    return b
end

-- Action functions
local function autoFarm() warn("AutoFarm iniciado") end
local function autoBounty() warn("AutoBounty iniciado") end
local function boostFPS()
    getgenv().Resolution = {[".gg/scripters"] = 0.65}
    local cam = workspace.CurrentCamera
    if not getgenv().gg_scripters then
        game:GetService("RunService").RenderStepped:Connect(function()
            cam.CFrame = cam.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end)
    end
    getgenv().gg_scripters = true
end
local function hideNotifs()
    for _, v in ipairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text:find("Você matou") then
            v:Destroy()
        end
    end
end
local function openChannel()
    setclipboard("https://youtube.com/canal/@JeffFlixBrasil")
end

-- Add buttons
local buttons = {
    {"Farm Level Automático", autoFarm},
    {"Auto Bounty PvP", autoBounty},
    {"Boost FPS", boostFPS},
    {"Kaitun Mode", function() warn("Kaitun ativo") end},
    {"HIDE NOTIFICS", hideNotifs},
    {"Canal do JeffFlixBrasil", openChannel},
}
for i, btn in ipairs(buttons) do
    local b = createButton(btn[1], btn[2])
    b.Parent = scroll
end

-- Enable vertical dragging
local UserInput = game:GetService("UserInputService")
local dragging, startPos, dragStart
frame.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = frame.Position
        dragStart = i.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
UserInput.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
