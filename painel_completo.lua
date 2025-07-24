-- painel_completo.lua atualizado com Auto Bounty GUI, botões Next Player e Nick Atual

local Players = game:GetService("Players") local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "JeffHub_Painel" ScreenGui.ResetOnSpawn = false ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame") MainFrame.Size = UDim2.new(0, 300, 0, 200) MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100) MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) MainFrame.BorderSizePixel = 0 MainFrame.Parent = ScreenGui Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel") Title.Text = "JEFFHUB - AUTO BOUNTY" Title.Size = UDim2.new(1, 0, 0, 30) Title.BackgroundTransparency = 1 Title.TextColor3 = Color3.fromRGB(255, 255, 255) Title.Font = Enum.Font.GothamBold Title.TextSize = 16 Title.Parent = MainFrame

-- Nick Atual local NickLabel = Instance.new("TextLabel") NickLabel.Text = "Nick: Buscando..." NickLabel.Size = UDim2.new(1, -20, 0, 25) NickLabel.Position = UDim2.new(0, 10, 0, 40) NickLabel.BackgroundTransparency = 1 NickLabel.TextColor3 = Color3.fromRGB(255, 255, 255) NickLabel.Font = Enum.Font.Code NickLabel.TextSize = 14 NickLabel.TextXAlignment = Enum.TextXAlignment.Left NickLabel.Parent = MainFrame

-- Tempo local StartTick = tick() local TimerLabel = Instance.new("TextLabel") TimerLabel.Text = "Tempo: 0s" TimerLabel.Size = UDim2.new(1, -20, 0, 25) TimerLabel.Position = UDim2.new(0, 10, 0, 70) TimerLabel.BackgroundTransparency = 1 TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255) TimerLabel.Font = Enum.Font.Code TimerLabel.TextSize = 14 TimerLabel.TextXAlignment = Enum.TextXAlignment.Left TimerLabel.Parent = MainFrame

-- Bounty local RewardLabel = Instance.new("TextLabel") RewardLabel.Text = "Recompensas: 0" RewardLabel.Size = UDim2.new(1, -20, 0, 25) RewardLabel.Position = UDim2.new(0, 10, 0, 100) RewardLabel.BackgroundTransparency = 1 RewardLabel.TextColor3 = Color3.fromRGB(255, 255, 255) RewardLabel.Font = Enum.Font.Code RewardLabel.TextSize = 14 RewardLabel.TextXAlignment = Enum.TextXAlignment.Left RewardLabel.Parent = MainFrame

-- Next Player Button local NextButton = Instance.new("TextButton") NextButton.Text = "Next Player" NextButton.Size = UDim2.new(0.45, 0, 0, 30) NextButton.Position = UDim2.new(0.05, 0, 1, -40) NextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) NextButton.TextColor3 = Color3.new(1, 1, 1) NextButton.Font = Enum.Font.GothamBold NextButton.TextSize = 14 NextButton.Parent = MainFrame Instance.new("UICorner", NextButton)

-- Close Button local CloseButton = Instance.new("TextButton") CloseButton.Text = "Fechar" CloseButton.Size = UDim2.new(0.45, 0, 0, 30) CloseButton.Position = UDim2.new(0.5, 0, 1, -40) CloseButton.BackgroundColor3 = Color3.fromRGB(130, 40, 40) CloseButton.TextColor3 = Color3.new(1, 1, 1) CloseButton.Font = Enum.Font.GothamBold CloseButton.TextSize = 14 CloseButton.Parent = MainFrame Instance.new("UICorner", CloseButton)

CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Simula lógica de Auto Bounty local bounty = 0 local fakePlayers = {"xShadow", "NoobMaster", "KenThePro", "ZoroPvP", "Luffy123"} local currentIndex = 1

local function updateTarget() NickLabel.Text = "Nick: " .. fakePlayers[currentIndex] bounty = bounty + math.random(1000, 3000) RewardLabel.Text = "Recompensas: " .. bounty end

NextButton.MouseButton1Click:Connect(function() currentIndex = currentIndex + 1 if currentIndex > #fakePlayers then currentIndex = 1 end updateTarget() end)

-- Timer Loop spawn(function() while MainFrame.Parent do local tempo = math.floor(tick() - StartTick) TimerLabel.Text = "Tempo: " .. tempo .. "s" wait(1) end end)

-- Iniciar com o primeiro player updateTarget()

