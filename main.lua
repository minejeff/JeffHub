-- JEFFHUB UNIVERSAL SCRIPT (Final) -- Suporte: King Legacy, Blox Fruits, BlueLock Rivals -- Inclui: Key System + Tela de Load + Painel Vertical + FPS Boost + AutoFarm + Auto Bounty + AutoSpin + Webhook + Stretch UI + Save + Muito mais

-- Variáveis Globais getgenv().JeffHub_Key = "JEFFFLIXBRASIL2025" getgenv().Webhook = "https://discord.com/api/webhooks/..." -- Substitua pelo seu webhook getgenv().GamePlaceId = game.PlaceId

-- Tela de Key System local Players = game:GetService("Players") local player = Players.LocalPlayer local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui")) gui.IgnoreGuiInset = true gui.ResetOnSpawn = false gui.Name = "JeffHubKeyUI"

local frame = Instance.new("Frame", gui) frame.Size = UDim2.new(0.4, 0, 0.3, 0) frame.Position = UDim2.new(0.3, 0, 0.35, 0) frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) frame.BorderSizePixel = 0 frame.BackgroundTransparency = 0.1 frame.Name = "KeyFrame"

local title = Instance.new("TextLabel", frame) title.Size = UDim2.new(1, 0, 0.25, 0) title.Position = UDim2.new(0, 0, 0, 0) title.Text = "JEFFHUB - KING LEGACY [UPD 8]" title.Font = Enum.Font.GothamBold title.TextColor3 = Color3.fromRGB(255, 255, 255) title.TextScaled = true

local input = Instance.new("TextBox", frame) input.Size = UDim2.new(0.9, 0, 0.25, 0) input.Position = UDim2.new(0.05, 0, 0.3, 0) input.PlaceholderText = "Digite a Key..." input.Text = "" input.Font = Enum.Font.Gotham tinput.TextScaled = true input.BackgroundColor3 = Color3.fromRGB(45, 45, 45) input.TextColor3 = Color3.new(1, 1, 1)

local checkBtn = Instance.new("TextButton", frame) checkBtn.Size = UDim2.new(0.4, 0, 0.2, 0) checkBtn.Position = UDim2.new(0.05, 0, 0.6, 0) checkBtn.Text = "Check Key" checkBtn.Font = Enum.Font.GothamBold checkBtn.TextScaled = true checkBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255) checkBtn.TextColor3 = Color3.new(1, 1, 1)

local getKeyBtn = Instance.new("TextButton", frame) getKeyBtn.Size = UDim2.new(0.4, 0, 0.2, 0) getKeyBtn.Position = UDim2.new(0.55, 0, 0.6, 0) getKeyBtn.Text = "Get Key" getKeyBtn.Font = Enum.Font.GothamBold getKeyBtn.TextScaled = true getKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100) getKeyBtn.TextColor3 = Color3.new(1, 1, 1)

getKeyBtn.MouseButton1Click:Connect(function() setclipboard("https://link-hub.net/1362624/tp5BWUUBkYEj") end)

checkBtn.MouseButton1Click:Connect(function() if input.Text == getgenv().JeffHub_Key then frame.Visible = false

-- Tela de transição com logo
    local logoGui = Instance.new("ScreenGui", player.PlayerGui)
    logoGui.Name = "JeffHubLoading"

    local logo = Instance.new("ImageLabel", logoGui)
    logo.Size = UDim2.new(1, 0, 1, 0)
    logo.Position = UDim2.new(0, 0, 0, 0)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://17413806167"
    logo.ImageTransparency = 0.1

    local texto = Instance.new("TextLabel", logo)
    texto.Size = UDim2.new(1, 0, 0.1, 0)
    texto.Position = UDim2.new(0, 0, 0.8, 0)
    texto.Text = "Obrigado Por usar O JeffHub"
    texto.Font = Enum.Font.GothamBold
    texto.TextColor3 = Color3.fromRGB(255, 0, 0)
    texto.BackgroundTransparency = 1
    texto.TextScaled = true

    local barra = Instance.new("Frame", logo)
    barra.Size = UDim2.new(0, 0, 0.01, 0)
    barra.Position = UDim2.new(0.2, 0, 0.92, 0)
    barra.BackgroundColor3 = Color3.fromRGB(80, 0, 140)

    barra:TweenSize(UDim2.new(0.6, 0, 0.01, 0), "Out", "Quad", 3, true)
    wait(4.5)

    logoGui:Destroy()

    -- Carrega o JeffHub principal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/minejeff/JeffHub/main/main.lua"))()
else
    input.Text = "Key inválida!"
end

end)

-- Você pode adaptar o restante do hub (farm, esp, etc) no arquivo principal "main.lua" -- Recomendo organizar as funções por jogo e salvar config via DataStore2 localmente

-- Fim do script

