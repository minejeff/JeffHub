if game.PlaceId ~= 4520749081 then return end -- Garante que só funcione no King Legacy

-- Tela principal do painel
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
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

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "📺 JEFFHUB - KING LEGACY [UPD 8]"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.BackgroundTransparency = 1
title.TextSize = 20

-- Função simples de botão
local function createButton(name, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 18
	btn.AutoButtonColor = true
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Área de botões
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 8)

-- Funções dos botões
local function notReady() warn("Função ainda em desenvolvimento.") end

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

	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Accessory") or v:IsA("Clothing") then
			v:Destroy()
		end
	end
end

local function kaitun()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/minejeff/JeffHub/main/modules/kaitun.lua"))()
end

local function hideNotifs()
	for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
		if v:IsA("TextLabel") and v.Text:find("Você matou") then
			v:Destroy()
		end
	end
end

local function openYouTube()
	setclipboard("https://youtube.com/canal/@JeffFlixBrasil")
end

-- Botões do painel
local buttons = {
	{"Farm Level Automático", autoFarm},
	{"Auto Bounty PvP", autoBounty},
	{"Boost FPS + Remover Skins", boostFPS},
	{"Kaitun Mode", kaitun},
	{"Ocultar Notificações de NPC", hideNotifs},
	{"Canal do JeffFlixBrasil", openYouTube},
}

-- Adiciona os botões na tela
for _, b in ipairs(buttons) do
	local btn = createButton(b[1], b[2])
	btn.Parent = scroll
end

-- Salvar configurações simples (autosave)
pcall(function()
	local folder = Instance.new("Folder", game:GetService("Players").LocalPlayer)
	folder.Name = "JeffHub_Save"
end)

-- Mover o hub com o mouse
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
