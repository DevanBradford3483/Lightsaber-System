task.wait()
local UserInputService = game:GetService("UserInputService")

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.Character:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local Animations = script.Parent.Parent:WaitForChild("Animations")

local Debounce = false

local connection

local function disconnect()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

connection = UserInputService.InputBegan:Connect(function(Input, gameProcessed)
	if Input.KeyCode == Enum.KeyCode.E and not gameProcessed and not Debounce and Player:WaitForChild("IgniteCheck").Value == true and Player:WaitForChild("ForceStamina").Value > 0 then
		Debounce = true
		script.Parent.Parent.Events.Dash:FireServer()
		local DashAnimation = Humanoid:LoadAnimation(Animations.Dash)
		DashAnimation:Play()
		DashAnimation:AdjustSpeed(5)

		Humanoid.WalkSpeed = 70
		wait(.2)
		Humanoid.WalkSpeed = 16

		wait(1)
		Debounce = false
	end
end)

Player.AncestryChanged:Connect(function(_, parent)
	if not parent then
		disconnect()
	end
end)

script.Parent.AncestryChanged:Connect(function(_, parent)
	if not parent then
		disconnect()
	end
end)
