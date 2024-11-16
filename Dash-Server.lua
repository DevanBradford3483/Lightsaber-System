local Events = script.Parent.Parent.Events

Events.Dash.OnServerEvent:Connect(function(Player)
	local Character = Player.Character or Player.Character:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")

	local function Effect()
		local DashEffect = script.Parent.Parent.Models.Dash:Clone()
		DashEffect.Parent = Character:WaitForChild("UpperTorso")
		DashEffect.Enabled = true
		script.Parent.Parent.Parent.Handle.Dash:Play()
		wait(.5)
		DashEffect.Enabled = false
		task.wait(.5)
		DashEffect:Destroy()
	end

	spawn(Effect)

	-- Ensure stamina never goes below 0
	local currentStamina = Player:WaitForChild("ForceStamina").Value
	local newStamina = math.max(0, currentStamina - 10)
	Player:WaitForChild("ForceStamina").Value = newStamina
end)
