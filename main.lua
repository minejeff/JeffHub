-- main.lua - Loader com sistema de key e carregamento visual

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name

-- CONFIGURAÇÕES
local correctKey = "JEFFFLIXBRASIL2025"
local painelURL = "https://raw.githubusercontent.com/minejeff/JeffHub/main/painel_completo.lua"
local webhook = "https://canary.discord.com/api/webhooks/1385719487650725978/_bHW63ZXHuxbOBpVVXvtQDjD2lU7CE8kcHE8Mg3-vABmDxdEpkjn7EA-QYUaKpuWwTsV"
local getKeyURL = "https://link-hub.net/1362624/tp5BWUUBkYEj"

-- GUI: Key System
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "JeffHub_KeySystem"
ScreenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", ScreenGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.BackgroundTransparency = 0.3
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Name = "KeyFrame"
frame.Active = true
frame.Draggable = true
frame:TweenSize(UDim2.new(0, 300, 0, 230), "Out", "Back", 0.5)

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
    local final = HttpService:JSONEncode(data)
    pcall(function()
        syn.request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = final
        })
    end)
end

-- Botão Check Key
local checkButton = Instance.new("TextButton", frame)
checkButton.Position = UDim2.new(0.1, 0, 0.8, 0)
checkButton.Size = UDim2.new(0.35, 0, 0, 30)
checkButton.Text = "Check Key"
checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
checkButton.TextColor3 = Color3.new(1,1,1)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 14
Instance.new("UICorner", checkButton)

-- Botão Get Key
local getKeyButton = Instance.new("TextButton", frame)
getKeyButton.Position = UDim2.new(0.55, 0, 0.8, 0)
getKeyButton.Size = UDim2.new(0.35, 0, 0, 30)
getKeyButton.Text = "Get Key"
getKeyButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
Instance.new("UICorner", getKeyButton)

-- GET KEY
getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(getKeyURL)
    status.Text = "Link copiado para a área de transferência!"
end)

-- CHECK KEY
checkButton.MouseButton1Click:Connect(function()
    if textbox.Text == correctKey then
        status.Text = "Key correta! Carregando..."
        sendToWebhook()

        -- Tela de carregamento
        frame:Destroy()
        local thumb = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        thumb.Name = "JeffHub_Thumbnail"
        local img = Instance.new("ImageLabel", thumb)
        img.Size = UDim2.new(0.5, 0, 0.5, 0)
        img.Position = UDim2.new(0.25, 0, 0.25, 0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://17549204679"
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

        -- Carregar painel completo
        local success, result = pcall(function()
            loadstring(game:HttpGet(painelURL))()
        end)
        if not success then
            warn("Erro ao carregar painel:", result)
            status.Text = "Erro ao carregar painel!"
        end
    else
        status.Text = "Key incorreta! Tente novamente."
    end
end)
