-- main.lua corrigido e funcional
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name

local correctKey = "JEFFFLIXBRASIL2025"
local painelURL = "https://raw.githubusercontent.com/minejeff/JeffHub/main/painel_completo.lua"
local webhook = "https://canary.discord.com/api/webhooks/1385719487650725978/_bHW63ZXHuxbOBpVVXvtQDjD2lU7CE8kcHE8Mg3-vABmDxdEpkjn7EA-QYUaKpuWwTsV"
local getKeyURL = "https://link-hub.net/1362624/tp5BWUUBkYEj"

-- GUI de Key
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JeffHub_KeySystem"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "JEFFHUB - KEY SYSTEM"
title.Font = Enum.Font.GothamBlack
title.TextColor3 = Color3.new(1, 0, 0)
title.BackgroundTransparency = 1
title.TextSize = 18

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Digite sua key"
textbox.Size = UDim2.new(0.8, 0, 0, 30)
textbox.Position = UDim2.new(0.1, 0, 0.35, 0)
textbox.Text = ""
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.Font = Enum.Font.Code
textbox.TextSize = 16
Instance.new("UICorner", textbox)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0.6, 0)
status.Text = ""
status.TextColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Code
status.TextSize = 14

local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(0.35, 0, 0, 30)
checkBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
checkBtn.Text = "Check Key"
checkBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
checkBtn.TextColor3 = Color3.new(1, 1, 1)
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 14
Instance.new("UICorner", checkBtn)

local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(0.35, 0, 0, 30)
getKeyBtn.Position = UDim2.new(0.55, 0, 0.8, 0)
getKeyBtn.Text = "Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 14
Instance.new("UICorner", getKeyBtn)

getKeyBtn.MouseButton1Click:Connect(function()
	setclipboard(getKeyURL)
	status.Text = "Link copiado para a área de transferência!"
end)

-- Webhook
local function enviarWebhook()
	local dados = {
		["content"] = "**Novo acesso ao JeffHub**",
		["embeds"] = {{
			["title"] = "Usuário",
			["description"] = "Nome: `" .. username .. "`\nID: `" .. userId .. "`",
			["color"] = 65280
		}}
	}
	syn.request({
		Url = webhook,
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = HttpService:JSONEncode(dados)
	})
end

-- Verificar Key
checkBtn.MouseButton1Click:Connect(function()
	if textbox.Text == correctKey then
		status.Text = "Key correta! Carregando..."
		enviarWebhook()
		gui:Destroy()

		-- Tela de loading simples
		local loading = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
		loading.Name = "JeffHub_Loading"

		local bg = Instance.new("Frame", loading)
		bg.Size = UDim2.new(0.5, 0, 0.3, 0)
		bg.Position = UDim2.new(0.5, -200, 0.5, -100)
		bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		bg.BackgroundTransparency = 0.2
		Instance.new("UICorner", bg)

		local texto = Instance.new("TextLabel", bg)
		texto.Size = UDim2.new(1, 0, 1, 0)
		texto.Position = UDim2.new(0, 0, 0, 0)
		texto.Text = "Obrigado Por usar o JeffHub"
		texto.TextColor3 = Color3.fromRGB(255, 0, 0)
		texto.Font = Enum.Font.GothamBold
		texto.TextSize = 18
		texto.BackgroundTransparency = 1

		wait(3)
		loading:Destroy()

		local success, err = pcall(function()
			loadstring(game:HttpGet("raw.githubusercontent.com/minejeff/JeffHub/main/painel_completo.lua))()
		end)
		if not success then
			warn("Falha ao carregar painel:", err)
		end
	else
		status.Text = "Key incorreta! Tente novamente."
	end
end)
