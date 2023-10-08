if game.PlaceId = 155615604 then

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/508droid/AikaV3rm-UI-Lib/main/Lib.lua')))()

local player = game.Players.LocalPlayer

local SelectedPlayer

local PlayerList = {}

local w = library:CreateWindow("Prison Life | Air Hub")

local a = w:CreateFolder("Players")

local b = w:CreateFolder("Visuals")

local c = w:CreateFolder("Guns")

local d = w:CreateFolder("Misc")

local e = w:CreateFolder("Teleports")

local Teleports = {
    ["Prison"] = CFrame.new(916.8078, 99.989975, 2373.37842, 0.999988616, -3.00875733e-08, 0.00476572337, 3.02519219e-08, 1, -3.44130839e-08, -0.00476572337, 3.45568658e-08, 0.999988616),
    ["Criminal"] = CFrame.new(-938.773193, 94.1287613, 2063.85498, -0.0142914634, 1.10835181e-07, -0.999897897, 4.43916441e-08, 1, 1.10212014e-07, 0.999897897, -4.28120224e-08, -0.0142914634),
    ["Guards"] = CFrame.new(837.350647, 99.9899826, 2303.21704, 0.995832086, 2.77697563e-08, -0.0912055373, -2.63544386e-08, 1, 1.67222378e-08, 0.0912055373, -1.42488705e-08, 0.995832086)
}

b:Button("Screen Tint",function()
    game.Players.LocalPlayer.PlayerGui.Home.fadeFrame.Visible = false
end)

b:Button("Delete Doors",function()
    workspace.Doors:Destroy()
    game.Workspace.Prison_Cellblock.doors:Destroy()
end)

a:Button("Become Guard",function()
    local start = player.Character.HumanoidRootPart.CFrame
    game.Workspace.Remote.TeamEvent:FireServer("Bright blue")
    wait(0.4)
    player.Character.HumanoidRootPart.CFrame = start
end)

a:Button("Become Prisoner",function()
    local start = player.Character.HumanoidRootPart.CFrame
    game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
    wait(0.4)
    player.Character.HumanoidRootPart.CFrame = start
end)

a:Button("Become Criminal",function()
    local start = player.Character.HumanoidRootPart.CFrame
    player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Criminals Spawn"].SpawnLocation.CFrame
    wait(0.6)
    player.Character.HumanoidRootPart.CFrame = start
end)

c:Button("Get Gun(Work)",function()
    local start = player.Character.HumanoidRootPart.CFrame

    player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP.CFrame
    wait(0.2)
    game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)

    player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP.CFrame
    wait(0.2)
    game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)

    player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP.CFrame
    wait(0.2)
    game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)

    player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Prison_ITEMS"].giver["M4A1"].ITEMPICKUP.CFrame
    wait(0.2)
    game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["M4A1"].ITEMPICKUP)

    player.Character.HumanoidRootPart.CFrame = start
end)

a:Slider("WalkSpeed",{
    min = 1;
    max = 1000;
    precise = false;
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

a:Slider("JumpPower",{
    min = 1;
    max = 1000;
    precise = false;
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local isTrue

local function KillAura()
    while isTrue do
            wait()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= player.Name then
                game.ReplicatedStorage.meleeEvent:FireServer(v)
            end
            if isTrue ~= true then
                break
            end
        end
    end
end

d:Button("Kill Aura",function()
    isTrue = not isTrue
    KillAura()
end)

for i,v in pairs(game.Players:GetChildren()) do
    table.insert(PlayerList,v.Name)
end

e:Button("Prison",function()
    player.Character.HumanoidRootPart.CFrame = Teleports["Prison"]
end)

e:Button("Guards",function()
    player.Character.HumanoidRootPart.CFrame = Teleports["Guards"]
end)

e:Button("Crim Base",function()
    player.Character.HumanoidRootPart.CFrame = Teleports["Criminal"]
end)

e:Dropdown("Players",PlayerList,true,function(plr) --true/false, replaces the current title "Dropdown" with the option that t
    SelectedPlayer = plr
end)

e:Button("TP to Player",function()
    player.Character.HumanoidRootPart.CFrame = game.Players[SelectedPlayer].Character.HumanoidRootPart.CFrame
end)

d:DestroyGui()

--b:Label("Pretty Useless NGL",{
--    TextSize = 25; -- Self Explaining
--    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
--    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
--}) 
--
--b:Button("Button",function()
--    print("Elym Winning")
--end)
--
--b:Toggle("Toggle",function(bool)
--    shared.toggle = bool
--    print(shared.toggle)
--end)
--
--b:Slider("Slider",{
--    min = 1; -- min value of the slider
--    max = 1000; -- max value of the slider
--    precise = true; -- max 2 decimals
--},function(value)
--    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
--end)
--
--b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--    print(mob)
--end)
--
--b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--    print("Yes")
--end)
--
--b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--    print(color)
--end)
--
--b:Box("Box","number",function(value) -- "number" or "string"
--    print(value)
--end)
