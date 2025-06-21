-- painel_completo.lua - JEFFHUB UNIVERSAL -- Adaptado para layout vertical com suporte a King Legacy, Blox Fruits e BlueLock Rivals

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() local Window = library.CreateLib("JeffHub - Universal", "BloodTheme")

-- Autosave config (simples) _G.JeffHub_Config = _G.JeffHub_Config or {} local SaveConfig = function() writefile("jeffhub_config.json", game:GetService("HttpService"):JSONEncode(_G.JeffHub_Config)) end local LoadConfig = function() if isfile("jeffhub_config.json") then _G.JeffHub_Config = game:GetService("HttpService"):JSONDecode(readfile("jeffhub_config.json")) end end pcall(LoadConfig)

-- Aba: Configurações Gerais local TabConfig = Window:NewTab("Config") local SectionUI = TabConfig:NewSection("Interface")

SectionUI:NewButton("Esconder Notificações", "Remove mensagens de mortes de NPCs", function() game:GetService("StarterGui"):SetCore("ResetButtonCallback", false) for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do if v:IsA("TextLabel") and v.Text:match("você matou") then v:Destroy() end end end)

SectionUI:NewButton("Fonte: Minecraft", "Muda para fonte pixelada", function() _G.JeffHub_Config.fonte = "Minecraft" SaveConfig() end) SectionUI:NewButton("Fonte: Gótica", "Muda para fonte estilizada", function() _G.JeffHub_Config.fonte = "Gotica" SaveConfig() end) SectionUI:NewButton("Autosave Config", "Salva preferências", SaveConfig)

SectionUI:NewButton("Tela Esticada", "Aplica modo esticado", function() getgenv().Resolution = {[".gg/scripters"] = 0.65} local Camera = workspace.CurrentCamera if getgenv().gg_scripters == nil then game:GetService("RunService").RenderStepped:Connect(function() Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1) end) end getgenv().gg_scripters = "Aori0001" end)

SectionUI:NewButton("Canal do JeffFlixBrasil", "Se inscreva no canal!", function() setclipboard("https://youtube.com/canal/@JeffFlixBrasil") end)

-- Seletor por jogo local gameName = "Outro" if game.PlaceId == 4520749081 then gameName = "King Legacy" end if game.PlaceId == 2753915549 then gameName = "Blox Fruits" end if game.PlaceId == 18668065416 then gameName = "BlueLock Rivals" end

-- Funções por jogo if gameName == "King Legacy" then local TabKL = Window:NewTab("King Legacy") local secFarm = TabKL:NewSection("Farm") secFarm:NewToggle("Farm Level Automaticamente", "Ativa farm", function(v) print("[KL] AutoFarm: ", v) end)

local secExtra = TabKL:NewSection("Extras")
secExtra:NewButton("TP para NPC de Quest", "Teleporta automaticamente", function()
    print("TP ativado")
end)

elseif gameName == "Blox Fruits" then local TabBF = Window:NewTab("Blox Fruits") local secAuto = TabBF:NewSection("Auto Bounty") secAuto:NewButton("Ativar Auto Bounty", "Versão rápida com skills", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))() end)

elseif gameName == "BlueLock Rivals" then local TabBL = Window:NewTab("BlueLock") local secRoleta = TabBL:NewSection("Roleta Automática") secRoleta:NewToggle("Girar Roleta", "Se tiver spins, gira automaticamente", function(v) print("Roleta: ", v) end) local secBoost = TabBL:NewSection("Desempenho") secBoost:NewButton("Boost FPS", "Aplica resolução baixa e remove skins", function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Accessory") or v:IsA("MeshPart") then v:Destroy() end end getgenv().Resolution = {[".gg/scripters"] = 0.65} local Camera = workspace.CurrentCamera game:GetService("RunService").RenderStepped:Connect(function() Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1) end) getgenv().gg_scripters = "Aori0001" end) end

-- Kaitun universal local TabKaitun = Window:NewTab("Kaitun") local secKaitun = TabKaitun:NewSection("Kaitun") secKaitun:NewButton("Ativar Kaitun", "Executa o script kaitun", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/KaitunHub/Main/main/Kaitun.lua"))() end)

print("JeffHub carregado com sucesso - vFinal")

