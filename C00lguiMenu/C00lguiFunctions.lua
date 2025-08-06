-- C00lguiFunctions.lua

local function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 200, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    mainFrame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    title.Text = "C00lgui Menu"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 24
    title.Parent = mainFrame

    local flyButton = Instance.new("TextButton")
    flyButton.Size = UDim2.new(1, 0, 0, 50)
    flyButton.Position = UDim2.new(0, 0, 0.2, 0)
    flyButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    flyButton.Text = "Fly"
    flyButton.TextColor3 = Color3.new(1, 1, 1)
    flyButton.TextSize = 20
    flyButton.Parent = mainFrame

    local speedButton = Instance.new("TextButton")
    speedButton.Size = UDim2.new(1, 0, 0, 50)
    speedButton.Position = UDim2.new(0, 0, 0.4, 0)
    speedButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    speedButton.Text = "Speed"
    speedButton.TextColor3 = Color3.new(1, 1, 1)
    speedButton.TextSize = 20
    speedButton.Parent = mainFrame

    flyButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        local flySpeed = 50
        local flyHeight = 50

        local function fly()
            while true do
                wait()
                if humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                end
                humanoid:MoveTo(Vector3.new(character.HumanoidRootPart.Position.X, character.HumanoidRootPart.Position.Y + flyHeight, character.HumanoidRootPart.Position.Z))
                character.HumanoidRootPart.Velocity = Vector3.new(0, flySpeed, 0)
            end
        end

        coroutine.wrap(fly)()
    end)

    speedButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.WalkSpeed = 100
    end)
end

createGui()
