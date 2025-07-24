-- main.lua com sistema de Key TEMP + PERMA e webhook ofuscado

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name

-- CONFIGS
local TEMP_KEY = "CINEVS2025-TEMP"
local PERMA_KEY = "CINEVS2025-PERMA"
local getKeyURL = "https://link-target.net/1362624/cinevskey"
local painelURL = "https://raw.githubusercontent.com/minejeff/JeffHub/main/painel_completo.lua"
local storageFile = "JeffKey_" .. userId .. ".json"

-- Webhook ofuscado
local webhook = HttpService:JSONDecode(HttpService:JSONEncode({
    url = "https://discord.com/api/webhooks/1387477093578969259/X1hYowqUsRbEY4IJ0PrdHiv_r1MsNf9D8V62JjtiNsVx2sN3y6uqYeDQGz4Nd7g1XIo9"
})).url

-- Tela
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Jeff_KeyGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🔐 JeffHub Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Insira sua Key..."
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

local function saveTempKey()
    local data = {
        timestamp = tick()
    }
    writefile(storageFile, HttpService:JSONEncode(data))
end

local function isTempKeyValid()
    if isfile(storageFile) then
        local content = HttpService:JSONDecode(readfile(storageFile))
        return tick() - content.timestamp <= 86400
    end
    return false
end

local function sendWebhook()
    local data = {
        content = "**Acesso ao JeffHub Liberado**",
        embeds = {{
            title = "🧠 Key Verificada",
            description = "Usuário: `" .. username .. "`\nID: `" .. userId .. "`",
            color = 65280
        }}
    }
    syn.request({
        Url = webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(data)
    })
end

local checkButton = Instance.new("TextButton", frame)
checkButton.Position = UDim2.new(0.1, 0, 0.8, 0)
checkButton.Size = UDim2.new(0.35, 0, 0, 30)
checkButton.Text = "Verificar"
checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
checkButton.TextColor3 = Color3.new(1, 1, 1)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 14
Instance.new("UICorner", checkButton)

local getKeyButton = Instance.new("TextButton", frame)
getKeyButton.Position = UDim2.new(0.55, 0, 0.8, 0)
getKeyButton.Size = UDim2.new(0.35, 0, 0, 30)
getKeyButton.Text = "Obter Key"
getKeyButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
Instance.new("UICorner", getKeyButton)

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(getKeyURL)
    status.Text = "Link copiado para a área de transferência!"
end)

local function loadPainel()
    gui:Destroy()
    local loadThumb = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    loadThumb.Name = "JeffHub_Thumb"
    local label = Instance.new("TextLabel", loadThumb)
    label.Size = UDim2.new(0.4, 0, 0.1, 0)
    label.Position = UDim2.new(0.3, 0, 0.45, 0)
    label.Text = "Obrigado Por usar O JeffHub"
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(255, 0, 0)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    wait(3)
    loadThumb:Destroy()
    loadstring(game:HttpGet(painelURL))()
end

checkButton.MouseButton1Click:Connect(function()
    local typedKey = textbox.Text
    if typedKey == PERMA_KEY then
        sendWebhook()
        loadPainel()
    elseif typedKey == TEMP_KEY then
        saveTempKey()
        sendWebhook()
        loadPainel()
    elseif isTempKeyValid() then
        status.Text = "Key TEMP válida (salva)!"
        loadPainel()
    else
        status.Text = "Key inválida ou expirada."
    end
end)
