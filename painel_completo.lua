if game.PlaceId ~= 4520749081 then return end -- Somente King Legacy

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "JeffHub_Test"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 480)
main.Position = UDim2.new(0.5, -160, 0.5, -240)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "✅ JeffHub - Painel Funcionando!"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local btn = Instance.new("TextButton", main)
btn.Position = UDim2.new(0.1, 0, 0.3, 0)
btn.Size = UDim2.new(0.8, 0, 0, 40)
btn.Text = "Clique aqui"
btn.Font = Enum.Font.Gotham
btn.TextSize = 16
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.MouseButton1Click:Connect(function()
    print("✅ Botão do painel funcionando!")
end)

Instance.new("UICorner", main)
Instance.new("UICorner", btn)
