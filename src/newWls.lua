-- [[BLACKLIST]]

local LocalPlayer = game.Players.LocalPlayer
local username = LocalPlayer and LocalPlayer.Name or ""

-- blacklisted niggas 
local blacklist = {
    ["TIO_TERROR4"] = true,
    ["Koema16"] = true,
    ["xIIRenIIx"] = true,
    ["XIIRIKKOIIX"] = true,
}

if blacklist[username] then
    LocalPlayer:Kick("Blacklisted, KYS NOW!")
    return
end

-- [[BLACKLIST END]]




function loadCock()
    spawn(function()
        -- [[ Boot up ]]
        local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Roblox/master/Orion.lua", true))()

        local Window = OrionLib:MakeWindow({Name = "Toba Hub", TestMode = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnabled = false, Icon = "https://cdn.discordapp.com/attachments/959882510827917362/1259544040597356624/t_3.png?ex=668c114c&is=668abfcc&hm=68423d5470e2367c8a2fddcb8686c4d6f7b95c01586d8b86976d300115b7407d&"})

        -- [[ Values ]]
        getgenv().autoCoin = false
        getgenv().attacker = false
        getgenv().autoBoss = false
        getgenv().autoBoss2 = false
        getgenv().damage = false
        getgenv().hitboxEnable = false
        getgenv().fireDamage = false
        getgenv().killAura = false
        getgenv().fireAura = false
        getgenv().view = false
        local nameToDamage = ""
        local definedDummy

        -- [[ Open UI button]]
        local SG = Instance.new("ScreenGui")
        SG.Name = "AstralicPrototype"
        SG.DisplayOrder = math.huge
        SG.ResetOnSpawn = false
        SG.IgnoreGuiInset = true
        SG.Parent = game:GetService("CoreGui")

        -- Criação do botão ToggleUI
        local ToggleUI = Instance.new("TextButton")
        ToggleUI.Name = "ToggleUI"
        ToggleUI.Font = Enum.Font.SourceSans
        ToggleUI.Size = UDim2.new(0, 32, 0, 32)
        ToggleUI.TextScaled = true
        ToggleUI.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleUI.Position = UDim2.new(1, -224, 0, 4)
        ToggleUI.Text = "P"
        ToggleUI.BackgroundTransparency = 0.4
        ToggleUI.BackgroundColor3 = Color3.fromRGB(18, 19, 24)
        ToggleUI.Parent = SG
        Instance.new("UICorner", ToggleUI).CornerRadius = UDim.new(0, 8)

        -- Função para enviar o evento de tecla RightShift
        local function sendRightShift()
            local vim = game:GetService("VirtualInputManager")
            vim:SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
        end

        -- Conectar a função ao evento MouseButton1Click do ToggleUI
        ToggleUI.MouseButton1Click:Connect(sendRightShift)

        -- Criação do ImageLabel com o mesmo tamanho e posição do ToggleUI
        local ImageUI = Instance.new("ImageLabel")
        ImageUI.Name = "ImageUI"
        ImageUI.Size = ToggleUI.Size -- Define o mesmo tamanho que o ToggleUI
        ImageUI.Position = ToggleUI.Position -- Define a mesma posição que o ToggleUI
        ImageUI.BackgroundTransparency = 0.4
        ImageUI.BackgroundColor3 = Color3.fromRGB(18, 19, 24)
        ImageUI.Image = "rbxassetid://18372013477" -- Defina o rbxassetid correto
        ImageUI.Parent = SG
        Instance.new("UICorner", ImageUI).CornerRadius = UDim.new(0, 8)

        -- Chamar a função sendRightShift() diretamente ao carregar o GUI
        sendRightShift()




        -- [[ Tabs ]]
        local Tab = Window:MakeTab({
            Name = "Main",
            Icon = "rbxassetid://14936596948",
            PremiumOnly = false
        })

        local Tab1 = Window:MakeTab({
            Name = "Auto Farm",
            Icon = "rbxassetid://14936594146",
            PremiumOnly = false
        })

        local Tab2 = Window:MakeTab({
            Name = "PvP",
            Icon = "rbxassetid://14936682825",
            PremiumOnly = false
        })

        local Tab3 = Window:MakeTab({
            Name = "Bosses",
            Icon = "rbxassetid://14961873517",
            PremiumOnly = false
        })

        local Tab4 = Window:MakeTab({
            Name = "Misc",
            Icon = "rbxassetid://14954209463",
            PremiumOnly = false
        })

        -- [[ Tab options (main) ]]
        local Section4 = Tab:AddSection({
            Name = "Informações"
        })

        Tab:AddParagraph("Créditos", "Loader: raphael, Script: __zgab")

        local Section5 = Tab:AddSection({
            Name = "Instruções"
        })

        Tab:AddParagraph("Como esconder o Script", "Basta clicar no X no topo da UI, para reabri-lo clique no ícone no topo da tela ou aperte RightShift.")

        -- [[ Tab1 options (auto farm) ]]
        local Section = Tab1:AddSection({
            Name = "Dummy"
        })

        Tab1:AddToggle({
            Name = "Auto Dummy",
            Default = false,
            Callback = function(Value)
                getgenv().attacker = Value
                NewLoop = Value

                if Value then
                    dummyLoop()
                end
            end    
        })

        local Section1 = Tab1:AddSection({
            Name = "Coins"
        })

        Tab1:AddToggle({
            Name = "Auto Coins",
            Default = false,
            Callback = function(Value)
                getgenv().autoCoin = Value
                if Value then
                    getCoins()
                end
            end    
        })

        -- [[ Funções Tab2 (PvP) ]]
        local Section3 = Tab2:AddSection({
            Name = "HitBox"
        })

        local tamanho_do_penis, transparencia

        Tab2:AddTextbox({
            Name = "Hitbox Size",
            Default = "",
            TextDisappear = false,
            Callback = function(HitboxSize)
                tamanho_do_penis=HitboxSize
            end      
        })

        Tab2:AddTextbox({
            Name = "Hitbox Transparency",
            Default = "",
            TextDisappear = false,
            Callback = function(HitboxTransparency)
                transparencia=HitboxTransparency
            end
        })

        Tab2:AddToggle({
            Name = "HitBox",
            Default = false,
            Callback = function(Value3)
                getgenv().hitboxEnable = Value3
                if Value3 then
                    hitbox()
                else
                    for i, v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                v.Character.HumanoidRootPart.Transparency = 1
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                                v.Character.HumanoidRootPart.Material = "Neon"
                                v.Character.HumanoidRootPart.CanCollide = false
                            end)
                        end
                    end
                end
            end
        })

        local Section6 = Tab2:AddSection({
            Name = "Damage Players"
        })

        function GetOnlinePlayers()
            local onlinePlayers = {}
            local localPlayerName = game.Players.LocalPlayer.Name
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Name ~= localPlayerName then
                    table.insert(onlinePlayers, player.Name)
                end
            end
            return onlinePlayers
        end

        local onlinePlayersDropdown = Tab2:AddDropdown({
            Name = "Selecionar Player",
            Default = "1",
            Options = GetOnlinePlayers(),
            Callback = function(Value69)
                print("Jogador selecionado: " .. Value69)
                nameToDamage = Value69
            end
        })

        function UpdateOnlinePlayersDropdown()
            local onlinePlayers = GetOnlinePlayers()
            onlinePlayersDropdown:Refresh(onlinePlayers, true)
        end

        game.Players.PlayerAdded:Connect(UpdateOnlinePlayersDropdown)
        game.Players.PlayerRemoving:Connect(UpdateOnlinePlayersDropdown)

        UpdateOnlinePlayersDropdown()

        Tab2:AddToggle({
            Name = "Dano continuo ao Player selecionado (M1)",
            Default = false,
            Callback = function(Value)
                getgenv().damage = Value
                if Value then
                    dealDamage()
                end
            end    
        })

        Tab2:AddToggle({
            Name = "Dano continuo ao Player selecionado (Fireball)",
            Default = false,
            Callback = function(Value68)
                getgenv().fireDamage = Value68
                if Value68 then
                    dealFireDamage()
                end
            end    
        })

        Tab2:AddButton({
            Name = "Teleportar para o Player",
            Callback = function()
                local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local targetPlayer = game.Players:FindFirstChild(nameToDamage)

                if targetPlayer and targetPlayer.Character then
                    local p2 = targetPlayer.Character.HumanoidRootPart
                    p1.CFrame = p2.CFrame
                end
            end
        })



        Tab2:AddToggle({
            Name = "TP abaixo do Player (Loop)",
            Default = false,
            Callback = function(Value45)
                getgenv().view = Value45
                if Value45 then
                    teleportBelow()
                end
            end    
        })



        Tab2:AddToggle({
                Name = "View Player",
                Default = false,
                Callback = function(Value90)
                        getgenv().view = Value90
                        if Value90 then
                                viewPerson()
                        else
                                local camera = game.Workspace.CurrentCamera
                                camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid 
                                camera.CameraType = Enum.CameraType.Custom
                        end
                end    
        })





        local Section9 = Tab2:AddSection({
            Name = "Auras"
        })

        Tab2:AddToggle({
            Name = "Kill Aura",
            Default = false,
            Callback = function(Value67)
                getgenv().killAura = Value67
                if Value67 then
                    killAura()
                end
            end    
        })



        Tab2:AddToggle({
            Name = "Kill Aura + Fireball",
            Default = false,
            Callback = function(Value823)
                getgenv().fireAura = Value823
                if Value823 then
                    fireAura()
                end
            end    
        })



        -- [[ Funções Tab3 (Bosses) ]]
        local Section3 = Tab3:AddSection({
            Name = "Bosses"
        })

        Tab3:AddDropdown({
            Name = "Selecionar Boss",
            Default = "",
            Options = {"DragonGiraffe", "LavaGorilla", "Griffin", "CENTAUR", "CRABBOSS"},
            Callback = function(Value4)
                bossSelect = Value4
            end 
        })

        Tab3:AddToggle({
            Name = "Matar Boss",
            Default = false,
            Callback = function(Value5)
                getgenv().autoBoss = Value5
                if Value5 then
                    dealBossDamage()
                end
            end
        })

        Tab3:AddToggle({
            Name = "Matar Boss 'Instantaneo'",
            Default = false,
            Callback = function(Value77)
                getgenv().autoBoss2 = Value77
                if Value77 then
                    killBoss()
                end
            end
        })

        Tab3:AddButton({
            Name = "Matar todos os Bosses",
            Callback = function()
                lava()
                griffin()
                giraffe()
                centaur()
                crab()
            end    
        })

        Tab3:AddButton({
                Name = "Matar todos os Bosses 'Instantaneo'",
                Callback = function()
                    instaLava()
                    instaGriffin()
                    instaGiraffe()
                    instaCentaur()
                    instaCrab()
                end    
            })


        -- [[ Funções Tab4 (Misc) ]]
        local Section2 = Tab4:AddSection({
                Name = "Funções Extras (AS)"
            })


        Tab4:AddButton({
                Name = "Pegar Lightningball",
                Callback = function()
                        local currentCFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
                        local esperma = CFrame.new(-40.60783767700195, 602.1058349609375, 786.2437744140625)

                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = esperma
                        wait(0.2)
                        fireproximityprompt(Workspace.PickFolder.rock.ProximityPrompt)
                        wait(0.2)
                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = currentCFrame
                    end    
            })


        local Section3 = Tab4:AddSection({
                Name = "Funções Extras (Roblox)"
            })


        Tab4:AddButton({
                Name = "Reset",
                Callback = function()
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
                    end    
            })

        Tab4:AddButton({
                Name = "Reentrar",
                Callback = function()
                        function GetJobID()
                            return game.JobId
                        end

                        function ReconnectToServer(currentJobID)
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, currentJobID)
                        end

                        local currentJobID = GetJobID()
                        ReconnectToServer(currentJobID)
                    end
            })


        Tab4:AddButton({
                Name = "Deletar GUI",
                Callback = function()
                        OrionLib:Destroy()
                        local SG = game:GetService("CoreGui"):WaitForChild("AstralicPrototype")
                        if SG then
                            SG:Destroy()
                            print("GUI deletada com sucesso.")
                        else
                            print("GUI não encontrada.")
                        end
                    end
            })


        -- [[ Callback functions ]]
        function getCoins()
            spawn(function()
                while getgenv().autoCoin do
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CoinEvent"):FireServer()
                    wait(0.1)
                end
            end)
        end


        function dummyLoop()
            spawn(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/e9yTbUUv"))()
                -- Determina qual dummy atacar com base no nível do jogador antes de iniciar o loop
                local definedDummy
                if game.Players.LocalPlayer.leaderstats.Level.Value < 5000 then
                    definedDummy = game.Workspace.MAP["dummies"].Dummy
                else
                    definedDummy = game.Workspace.MAP["5k_dummies"].Dummy2
                end
                -- Verifica se o dummy está definido antes de iniciar o loop
                if definedDummy then
                    -- Teleporta o jogador para perto do dummy selecionado
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = definedDummy.HumanoidRootPart.CFrame
                end

                -- Inicia o loop de ataque ao dummy enquanto 'attacker' for verdadeiro
                while getgenv().attacker do
                    if definedDummy then
                        local args = {
                            [1] = "damage",
                            [2] = {
                                ["EnemyHumanoid"] = definedDummy.Humanoid
                            }
                        }
                        game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent:FireServer(unpack(args))

                        local args1 = {
                            [1] = definedDummy.Humanoid,
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args1))
                    end

                    wait(0.1)  -- Aguarda um curto período antes da próxima iteração
                end
            end)
        end



        function viewPerson()
                spawn(function()
                        local target = game.Players:FindFirstChild(nameToDamage)

                        if target then
                                game.Workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChild("Humanoid")
                        end 
                end)
        end
       



        function teleportBelow()
                spawn(function()
                        playerCharacter = game.Players[nameToDamage].Character
                        while getgenv().view == true do
                                if playerCharacter then
                                        targetPosition = playerCharacter.HumanoidRootPart.Position - Vector3.new(0, 9, 0)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                                        wait(0.1)
                                end
                        end
                end)
        end






        function hitbox()
            spawn(function()
                while getgenv().hitboxEnable do
                    for i, v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(tamanho_do_penis, tamanho_do_penis, tamanho_do_penis)
                                v.Character.HumanoidRootPart.Transparency = transparencia
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                                v.Character.HumanoidRootPart.Material = Enum.Material.Neon
                                v.Character.HumanoidRootPart.CanCollide = false
                            end)
                        end
                        wait(0.2)
                    end
                end
            end)
        end




        function killAura()
                spawn(function()
                        while getgenv().killAura == true do

                            local success, error = pcall(function()
                                local friendlies = {}
                                local Team
                                local Teams = game.Workspace.Teams

                                for i,v in pairs(Teams:GetDescendants()) do
                                    if v:IsA("StringValue") then
                                        if v.Value == game.Players.LocalPlayer.Name then
                                            Team = tostring(v.Parent.Name)
                                        end
                                    end
                                end

                                if Team ~= nil then
                                    for i,v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                                        if v:IsA("StringValue") then
                                            table.insert(friendlies, v.Value)
                                        end
                                    end
                                end

                                local PlayerList = {}
                                local Min = math.huge

                                for i, SearchPlayer in pairs(game.Players:GetChildren()) do
                                    if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                                        continue
                                    end

                                    if table.find(friendlies, SearchPlayer.Name) then
                                        continue
                                    end

                                    if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid") and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                                        local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})

                                        if Min > Mag then
                                            Min = Mag
                                        end
                                    end
                                end

                                table.sort(PlayerList, function(a, b)
                                    return a.Magnitude < b.Magnitude
                                end)

                                if PlayerList[1] and PlayerList[1].Magnitude < 20 and PlayerList[1].Player and PlayerList[1].Player.Character.Humanoid.Health > 0 then
                                    game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(PlayerList[1].Player.Character.Humanoid, "1")
                                    print(PlayerList[1].Player.Character.Humanoid.Health .. "/" .. PlayerList[1].Player.Character.Humanoid.MaxHealth)
                                end
                            end)

                            if not success then
                                print(a , b)
                            end

                            wait(0.1)
                        end
                    end)
            end




        function fireAura()
                spawn(function()
                        while getgenv().fireAura == true do

                                local success, error = pcall(function()
                                        local friendlies = {}
                                        local Team
                                        local Teams = game.Workspace.Teams

                                        for i, v in pairs(Teams:GetDescendants()) do
                                                if v:IsA("StringValue") then
                                                        if v.Value == game.Players.LocalPlayer.Name then
                                                                Team = tostring(v.Parent.Name)
                                                        end
                                                end
                                        end

                                        if Team ~= nil then
                                                for i, v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                                                        if v:IsA("StringValue") then
                                                                table.insert(friendlies, v.Value)
                                                        end
                                                end
                                        end

                                        local PlayerList = {}
                                        local Min = math.huge

                                        for i, SearchPlayer in pairs(game.Players:GetChildren()) do
                                                if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                                                        continue
                                                end

                                                if table.find(friendlies, SearchPlayer.Name) then
                                                        continue
                                                end

                                                if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid") and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                                                        local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                                                        table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})

                                                        if Min > Mag then
                                                                Min = Mag
                                                        end
                                                end
                                        end

                                        table.sort(PlayerList, function(a, b)
                                                return a.Magnitude < b.Magnitude
                                        end)

                                        if PlayerList[1] and PlayerList[1].Magnitude < 20 and PlayerList[1].Player and PlayerList[1].Player.Character.Humanoid.Health > 0 then
                                                local targetHumanoid = PlayerList[1].Player.Character.Humanoid
                                                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(targetHumanoid, "1")
                                                
                                                -- Add the new execution here
                                                local args = {
                                                        [1] = "damage",
                                                        [2] = {
                                                                ["EnemyHumanoid"] = targetHumanoid
                                                        }
                                                }

                                                game:GetService("ReplicatedStorage"):WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                                                print(targetHumanoid.Health .. "/" .. targetHumanoid.MaxHealth)
                                        end
                                end)

                                if not success then
                                        print(a, b)
                                end

                                wait(0.1)
                        end
                end)
        end
                              







        function dealBossDamage()
                spawn(function()
                  while getgenv().autoBoss == true do
                        local args = {
                          [1] = workspace:WaitForChild("NPC"):WaitForChild(bossSelect):WaitForChild("Humanoid"),
                          [2] = 1
                    }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))
                        wait()
                    end
                end)
            end



        function instaCrab()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args9 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("CRABBOSS"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args9))

                        workspace.NPC.CRABBOSS.Humanoid.Health = 0
                    end
                end)
            end



        function instaGiraffe()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args4 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("DragonGiraffe"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args4))

                        workspace.NPC.DragonGiraffe.Humanoid.Health = 0
                    end
                end)
            end



        function instaLava()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args5 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("LavaGorilla"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args5))

                        workspace.NPC.LavaGorilla.Humanoid.Health = 0
                    end
                end)
            end





        function instaGriffin()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args6 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("Griffin"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args6))

                        workspace.NPC.Griffin.Humanoid.Health = 0
                    end
                end)
            end



        function instaCentaur()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args7 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("CENTAUR"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args7))

                        workspace.NPC.CENTAUR.Humanoid.Health = 0
                    end
                end)
            end


        function lava()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args2 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("LavaGorilla"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args2))
                    end
                end)
            end



        function giraffe()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args3 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("DragonGiraffe"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args3))
                    end
                end)
            end



        function crab()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args8 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("CRABBOSS"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args8))
                    end
                end)
            end



        function centaur()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("CENTAUR"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))
                    end
                end)
            end




        function griffin()
                spawn(function()
                    while true do
                        wait(0.1)
                        local args1 = {
                            [1] = workspace:WaitForChild("NPC"):WaitForChild("Griffin"):WaitForChild("Humanoid"),
                            [2] = 2
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args1))
                    end
                end)
            end






        function killBoss()
                spawn(function()
                  while getgenv().autoBoss2 == true do
                        local args = {
                          [1] = workspace:WaitForChild("NPC"):WaitForChild(bossSelect):WaitForChild("Humanoid"),
                          [2] = 1
                    }
                        game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))

                        workspace.NPC[bossSelect].Humanoid.Health = 0
                        wait()
                    end
                end)
            end




        function dealDamage()
                spawn(function()
                    while getgenv().damage == true do
                        if nameToDamage ~= "" then
                            local targetPlayer = game.Players:FindFirstChild(nameToDamage)
                            if targetPlayer then
                                local args = {
                                    [1] = targetPlayer.Character.Humanoid,
                                    [2] = 2
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))
                            end
                        end
                        wait(0.1)
                    end
                end)
            end




        function dealFireDamage()
                spawn(function()
                    while getgenv().fireDamage == true do
                        if nameToDamage ~= "" then
                            local targetPlayer = game.Players:FindFirstChild(nameToDamage)
                            if targetPlayer then
                                local args = {
                                    [1] = "damage",
                                    [2] = {
                                        ["EnemyHumanoid"] = targetPlayer.Character.Humanoid
                                    }
                                }

                                game:GetService("ReplicatedStorage"):WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                            end
                        end
                        wait(0.1)
                    end
                end)
            end





        OrionLib:Init()
    end)
end




local LocalPlayer = game.Players.LocalPlayer
local username = LocalPlayer and LocalPlayer.Name or ""

-- blacklisted niggas 
local blacklist = {
    ["TIO_TERROR4"] = true,
    ["Koema16"] = true,
    ["xIIRenIIx"] = true,
    ["XIIRIKKOIIX"] = true,
}

if blacklist[username] then
    LocalPlayer:Kick("Blacklisted, KYS NOW!")
    return
end



local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Roblox/master/Orion.lua", true))()

local obfList = {
    ["a"] = "BuC",
    ["b"] = "YgC",
    ["c"] = "BiZ",
    ["d"] = "RgX",
    ["e"] = "VvX",
    ["f"] = "TvV",
    ["g"] = "WwD",
    ["h"] = "YuY",
    ["i"] = "TrC",
    ["j"] = "LpM",
    ["k"] = "ZxQ",
    ["l"] = "BvE",
    ["m"] = "NwR",
    ["n"] = "AqF",
    ["o"] = "JxL",
    ["p"] = "HvB",
    ["q"] = "VyU",
    ["r"] = "CdN",
    ["s"] = "PmK",
    ["t"] = "RqW",
    ["u"] = "FgT",
    ["v"] = "KlP",
    ["w"] = "MhY",
    ["x"] = "QzN",
    ["y"] = "DbJ",
    ["z"] = "SfI",
    ["A"] = "GyT",
    ["B"] = "HvC",
    ["C"] = "NmJ",
    ["D"] = "QqW",
    ["E"] = "PpO",
    ["F"] = "KkL",
    ["G"] = "DmK",
    ["H"] = "AcD",
    ["I"] = "XyJ",
    ["J"] = "RrS",
    ["K"] = "VvF",
    ["L"] = "NnR",
    ["M"] = "UuM",
    ["N"] = "ZzL",
    ["O"] = "LlE",
    ["P"] = "OoP",
    ["Q"] = "WwQ",
    ["R"] = "IiR",
    ["S"] = "FfS",
    ["T"] = "YyT",
    ["U"] = "GgU",
    ["V"] = "HhV",
    ["W"] = "CpI",
    ["X"] = "BbJ",
    ["Y"] = "GgO",
    ["Z"] = "pNM",
    ["0"] = "TTs",
    ["1"] = "cUm",
    ["2"] = "GYa",
    ["3"] = "LpN",
    ["4"] = "coN",
    ["5"] = "lOl",
    ["6"] = "xGh",
    ["7"] = "XFD",
    ["8"] = "NrY",
    ["9"] = "OPl"
}

local sourceList = {}
for k, v in pairs(obfList) do
    sourceList[v] = k
end

local function saveKeyToFile(key)
    writefile("tobahub_key.txt", key)
end

local function readSavedKey()
    if isfile("tobahub_key.txt") then
        return readfile("tobahub_key.txt")
    else
        return nil
    end
end

-- Deobfuscate the obfuscated key
local function deobf(string)
    local deobfStr = ""
    for obfV in string.gmatch(string, '([^@#%$&_%-*.,!/%s]+)') do
        local str = sourceList[obfV]
        if str then
            deobfStr = deobfStr .. str
        else
            deobfStr = deobfStr .. obfV -- Handle unknown obfuscated values
        end
    end
    return deobfStr
end

local obfKeyUrl = "https://pastebin.com/raw/MEjkDc7Z"
local obfKey = game:HttpGet(obfKeyUrl)

local keyInput = ""

local function checkkey(key)
    local originalKey = deobf(obfKey)
    if key == originalKey then 
        saveKeyToFile(key)
        return true
    else
        return false
    end
end

local function isSavedKeyValid()
    local savedKey = readSavedKey()
    if savedKey then
        return checkkey(savedKey)
    else
        return false
    end
end

local Window = OrionLib:MakeWindow({
    Name = "Toba Hub",
    TestMode = false,
    SaveConfig = false,
    ConfigFolder = "OrionTest",
    IntroEnabled = false
})

local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://",
    TestersOnly = false
})

Tab:AddTextbox({
    Name = "Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
    end
})

Tab:AddButton({
    Name = "Checar Key",
    Callback = function()
        if checkkey(keyInput) then
            OrionLib:Destroy()
            loadCock()
        else
            loadstring(game:HttpGet("https://pastebin.com/raw/MFQqUExv"))()
        end
    end
})

Tab:AddButton({
    Name = "Copiar Link",
    Callback = function()
        setclipboard("https://link-hub.net/1190779/toba-hub")
    end
})

-- Verifica se tem uma key salva
if isSavedKeyValid() then
    OrionLib:Destroy()
    loadCock()
else
    loadstring(game:HttpGet("https://pastebin.com/raw/MFQqUExv"))()
end
