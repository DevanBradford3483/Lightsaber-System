-- Required Modules and Initialization
local Util = require(script.Parent.Util)
local Event = script.Parent.Parent.Events
local Tool = script.Parent.Parent.Parent
local User = Tool.Parent.Parent

-- Initial Character Reference
local Character = User.Character or User.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChild("Humanoid")
local LightsaberValues = script.Parent.Parent.Values
local Blade = script.Parent.Parent.Models.Blade.Blade
local IgnitedCheck = Tool.Assets.Values.Ignited

local LightsaberHiltFolder = script.Parent.Parent.Models.Hilt

-- Helper Function to Clone and Weld Parts
local function cloneAndWeld(partName, newPartName, parentPart, weldPart0, weldPart1)
	local part = LightsaberHiltFolder:WaitForChild(partName, 5)
	if part then
		local clone = part:Clone()
		clone.Name = newPartName
		clone.Parent = Character
		clone:SetPrimaryPartCFrame(parentPart.CFrame)

		local weld = Instance.new("WeldConstraint", clone:WaitForChild(weldPart0))
		weld.Part0 = clone:WaitForChild(weldPart0)
		weld.Part1 = Character:WaitForChild(weldPart1)
	else
		
	end
end

-- Cleanup Function to Remove Existing Lightsaber Parts
local function cleanupLightsaberParts()
	local partsToRemove = {"PlayersSwitch", "PlayersEmitter", "PlayersSleeve"}
	for _, partName in ipairs(partsToRemove) do
		local part = Character:FindFirstChild(partName)
		if part then
			part:Destroy()
		end
	end
end

-- Main Logic
local function setupLightsaber()
	cleanupLightsaberParts()

	local emitterExists = LightsaberHiltFolder:FindFirstChild("Emitter")
	if emitterExists then

		if not Character:FindFirstChild("PlayerEmitter") then
			cloneAndWeld("Switch", "PlayersSwitch", Character:WaitForChild("HiltLocator").Connector, "SwitchLowerConnector", "LowerTorso")
			cloneAndWeld("Body", "PlayersSleeve", Character:WaitForChild("PlayersSwitch").SwitchLowerConnector, "UpperBodyConnector", "LowerTorso")
			cloneAndWeld("Emitter", "PlayersEmitter", Character:WaitForChild("PlayersSwitch").SwitchUpperConnector, "EmitterLowerConnector", "LowerTorso")
			
		else
			
		end
	else
		
	end
end

-- Connect to the CharacterAdded event to ensure the script runs whenever the character is loaded
User.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	setupLightsaber()
end)

-- Initial setup
setupLightsaber()
