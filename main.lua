-- main.lua - Loader com Key System e painel
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name

-- CONFIGURAÇÃO
local correctKey = "JEFFFLIXBRASIL2025"
local webhook = "https://canary.discord.com/api/webhooks/1385719487650725978/_bHW63ZXHuxbOBpVVXvtQDjD2lU7CE8kcHE8Mg3-vABmDxdEpkjn7EA-QYUaKpuWwTsV"
local getKeyURL = "https://link-hub.net/1362624/tp5BWUUBkYEj"
local painelURL = "https://raw.githubusercontent.com/minejeff/JeffHub/main/painel_completo.lua"

-- GUI
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "JeffHub_KeySystem"
ScreenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", ScreenGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0, 300, 0, 230)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Name = "KeyFrame"
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "JEFFHUB - KING LEGACY [UPD 8]"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextSize = 18

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Digite sua KEY aqui..."
textbox.Position = UDim2.new(0.1, 0, 0.4, 0)
textbox.Size = UDim2.new(0.8, 0, 0, 30)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.Text = ""
textbox.Font = Enum.Font.Code
textbox.TextSize = 16
Instance.new("UICorner", textbox)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0.65, 0)
status.Text = ""
status.TextColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Code
status.TextSize = 14

-- Webhook
local function sendToWebhook()
    local data = {
        ["content"] = "**Novo acesso ao JeffHub**",
        ["embeds"] = {{
            ["title"] = "Dados do Usuário",
            ["description"] = "User: `" .. username .. "`\nID: `" .. userId .. "`",
            ["color"] = 65280
        }}
    }
    syn.request({
        Url = webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(data)
    })
end

-- Botões
local checkButton = Instance.new("TextButton", frame)
checkButton.Position = UDim2.new(0.1, 0, 0.8, 0)
checkButton.Size = UDim2.new(0.35, 0, 0, 30)
checkButton.Text = "Check Key"
checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
checkButton.TextColor3 = Color3.new(1,1,1)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 14
Instance.new("UICorner", checkButton)

local getKeyButton = Instance.new("TextButton", frame)
getKeyButton.Position = UDim2.new(0.55, 0, 0.8, 0)
getKeyButton.Size = UDim2.new(0.35, 0, 0, 30)
getKeyButton.Text = "Get Key"
getKeyButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
Instance.new("UICorner", getKeyButton)

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(getKeyURL)
    status.Text = "Link copiado para a área de transferência!"
end)

checkButton.MouseButton1Click:Connect(function()
    if textbox.Text == correctKey then
        status.Text = "Key correta! Carregando..."
        sendToWebhook()
        frame:Destroy()

        -- Tela de Loading
        local thumb = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        thumb.Name = "JeffHub_Thumbnail"

        local img = Instance.new("ImageLabel", thumb)
        img.Size = UDim2.new(0, 400, 0, 300)
        img.Position = UDim2.new(0.5, -200, 0.5, -150)
        img.BackgroundTransparency = 0
        img.Image = "rbxassetid://7141958455" -- imagem oficial do King Legacy
        img.ScaleType = Enum.ScaleType.Crop

        local txt = Instance.new("TextLabel", img)
        txt.Size = UDim2.new(1, 0, 0.2, 0)
        txt.Position = UDim2.new(0, 0, 1.05, 0)
        txt.Text = "Obrigado Por usar O JeffHub"
        txt.TextColor3 = Color3.new(1, 0, 0)
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 16

        wait(3)
        thumb:Destroy()

        local success, result = pcall(function()
            return loadstring(game:HttpGet(painelURL))()
        end)

        if not success then
            warn("Erro ao carregar o painel:", result)
            status.Text = "Erro ao carregar o painel."
        end
    else
        status.Text = "Key incorreta! Tente novamente."
    end
end)
