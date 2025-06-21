if game.PlaceId ~= 4520749081 then return end -- Só funciona no King Legacy

-- Tela principal
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "JeffHubUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 360, 0, 540)
mainFrame.Position = UDim2.new(0.5, -180, 0.5, -270)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0.1
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

-- Título
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "📺 JEFFHUB - KING LEGACY [UPD 8]"
title.Font = Enum.Font.GothamBlack
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.BackgroundTransparency = 1
title.TextSize = 20

-- Scroll de opções
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)

-- Botão padrão
local function createButton(name, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 18
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Funções dos botões
local function autoFarm()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/minejeff/JeffHub/main/modules/autofarm.lua"))()
end

local function autoBounty()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/minejeff/JeffHub/main/modules/autobounty.lua"))()
end

local function boostFPS()
	getgenv().Resolution = {[".gg/scripters"] = 0.65}
	local Camera = workspace.CurrentCamera
	if not getgenv().gg_scripters then
		game:GetService("RunService").RenderStepped:Connect(function()
			Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
		end)
	end
	getgenv().gg_scripters = "Aori0001"
end

local function hideNotifs()
	for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
		if v:IsA("TextLabel") and v.Text:find("Você matou") then
			v:Destroy()
		end
	end
end

local function kaitun()
	warn("[JEFFHUB] Kaitun ainda em construção.")
end

local function canal()
	setclipboard("https://youtube.com/canal/@JeffFlixBrasil")
end

-- Lista de botões
local buttons = {
	{"Farm Level Automático", autoFarm},
	{"Auto Bounty PvP", autoBounty},
	{"Boost FPS", boostFPS},
	{"Kaitun Mode", kaitun},
	{"HIDE NOTIFICS", hideNotifs},
	{"Canal do JeffFlixBrasil", canal},
}

-- Adicionar os botões
for _, item in pairs(buttons) do
	local btn = createButton(item[1], item[2])
	btn.Parent = scroll
end

-- Tornar a interface esticável e movível
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
