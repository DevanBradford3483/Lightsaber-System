local Player = script.Parent.Parent.Parent.Parent.Parent


local LightsaberParts = game:GetService("ServerStorage"):WaitForChild("Lightsabers"):WaitForChild("Parts")
local LightsaberHiltFolder = script.Parent.Parent.Models.Hilt
local LightsaberHandle = script.Parent.Parent.Parent.Handle

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Switch").Value == "Kenobi" and Player:WaitForChild("LightsaberHilt"):WaitForChild("Emitter").Value == "Kenobi" and Player:WaitForChild("LightsaberHilt"):WaitForChild("Sleeve").Value == "Kenobi" then
	warn("All Kenobi")
	LightsaberHiltFolder:WaitForChild("Base").SwitchLowerConnector.CFrame = LightsaberHiltFolder:WaitForChild("Base").SwitchLowerConnector.CFrame * CFrame.new(0.2,0,0)
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Switch").Value == "Standard" then
	local Switch = LightsaberParts:WaitForChild("Switch"):WaitForChild("Single-Switch-Standard"):Clone()
	Switch.Parent = LightsaberHiltFolder

	local HandleToSwitchWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToSwitchWeld.Part0 = LightsaberHandle
	HandleToSwitchWeld.Part1 = Switch.SwitchLowerConnector

	Switch:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Base").SwitchLowerConnector.CFrame)
	Switch.Name = "Switch"
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Switch").Value == "Kenobi" then
	local Switch = LightsaberParts:WaitForChild("Switch"):WaitForChild("Single-Switch-Kenobi"):Clone()
	Switch.Parent = LightsaberHiltFolder

	local HandleToSwitchWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToSwitchWeld.Part0 = LightsaberHandle
	HandleToSwitchWeld.Part1 = Switch.SwitchLowerConnector

	Switch:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Base").SwitchLowerConnector.CFrame)
	Switch.Name = "Switch"
end


if Player:WaitForChild("LightsaberHilt"):WaitForChild("Switch").Value == "Taimer" then
	local Switch = LightsaberParts:WaitForChild("Switch"):WaitForChild("Single-Switch-Taimer"):Clone()
	Switch.Parent = LightsaberHiltFolder

	local HandleToSwitchWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToSwitchWeld.Part0 = LightsaberHandle
	HandleToSwitchWeld.Part1 = Switch.SwitchLowerConnector

	Switch:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Base").SwitchLowerConnector.CFrame)
	Switch.Name = "Switch"
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Emitter").Value == "Standard" then
	local Emitter = LightsaberParts:WaitForChild("Emitters"):WaitForChild("Single-Emitter-Standard"):Clone()
	Emitter.Parent = LightsaberHiltFolder

	local HandleToEmitterWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToEmitterWeld.Part0 = LightsaberHandle
	HandleToEmitterWeld.Part1 = Emitter.EmitterLowerConnector

	Emitter:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchUpperConnector").CFrame)
	Emitter.Name = "Emitter"

	--// Set Emitter Color Material

	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Alloy Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.639216, 0.635294, 0.647059)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Rose Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.647059, 0.227451, 0.270588)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Black Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.101961, 0.101961, 0.101961)
			end
		end
	end
	--// Set Blade Connector

	local BladeConnectorWeld = Instance.new("WeldConstraint", LightsaberHandle)
	BladeConnectorWeld.Part0 = Emitter.BladeConnector
	BladeConnectorWeld.Part1 = LightsaberHiltFolder.Parent.Blade.BladeConnection

	LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame = Emitter.BladeConnector.CFrame


	local BladeToConnector = Instance.new("WeldConstraint", LightsaberHiltFolder.Parent.Blade.BladeConnection)
	BladeToConnector.Part0 = LightsaberHiltFolder.Parent.Blade.BladeConnection
	BladeToConnector.Part1 = LightsaberHiltFolder.Parent.Blade:WaitForChild("Blade")

	LightsaberHiltFolder.Parent.Blade.Blade.CFrame = LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame
end


if Player:WaitForChild("LightsaberHilt"):WaitForChild("Emitter").Value == "Kenobi" then
	local Emitter = LightsaberParts:WaitForChild("Emitters"):WaitForChild("Single-Emitter-Kenobi"):Clone()
	Emitter.Parent = LightsaberHiltFolder

	local HandleToEmitterWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToEmitterWeld.Part0 = LightsaberHandle
	HandleToEmitterWeld.Part1 = Emitter.EmitterLowerConnector

	Emitter:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchUpperConnector").CFrame)
	Emitter.Name = "Emitter"


	--// Set Emitter Color Material

	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Alloy Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.639216, 0.635294, 0.647059)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Rose Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.647059, 0.227451, 0.270588)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Black Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.101961, 0.101961, 0.101961)
			end
		end
	end
	--// Set Blade Connector

	local BladeConnectorWeld = Instance.new("WeldConstraint", LightsaberHandle)
	BladeConnectorWeld.Part0 = Emitter.BladeConnector
	BladeConnectorWeld.Part1 = LightsaberHiltFolder.Parent.Blade.BladeConnection

	LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame = Emitter.BladeConnector.CFrame


	local BladeToConnector = Instance.new("WeldConstraint", LightsaberHiltFolder.Parent.Blade.BladeConnection)
	BladeToConnector.Part0 = LightsaberHiltFolder.Parent.Blade.BladeConnection
	BladeToConnector.Part1 = LightsaberHiltFolder.Parent.Blade:WaitForChild("Blade")

	LightsaberHiltFolder.Parent.Blade.Blade.CFrame = LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame
end




if Player:WaitForChild("LightsaberHilt"):WaitForChild("Emitter").Value == "Taimer" then
	local Emitter = LightsaberParts:WaitForChild("Emitters"):WaitForChild("Single-Emitter-Taimer"):Clone()
	Emitter.Parent = LightsaberHiltFolder

	local HandleToEmitterWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToEmitterWeld.Part0 = LightsaberHandle
	HandleToEmitterWeld.Part1 = Emitter.EmitterLowerConnector

	Emitter:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchUpperConnector").CFrame)
	Emitter.Name = "Emitter"


	--// Set Emitter Color Material

	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Alloy Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.639216, 0.635294, 0.647059)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Rose Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.647059, 0.227451, 0.270588)
			end
		end
	end
	if Player:WaitForChild("LightsaberHilt"):WaitForChild("Material").Value == "Black Metal" then
		for _,v in pairs(Emitter:GetChildren()) do
			if v:GetAttribute("CanColor") == true then
				v.Color = Color3.new(0.101961, 0.101961, 0.101961)
			end
		end
	end
	--// Set Blade Connector

	local BladeConnectorWeld = Instance.new("WeldConstraint", LightsaberHandle)
	BladeConnectorWeld.Part0 = Emitter.BladeConnector
	BladeConnectorWeld.Part1 = LightsaberHiltFolder.Parent.Blade.BladeConnection

	LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame = Emitter.BladeConnector.CFrame


	local BladeToConnector = Instance.new("WeldConstraint", LightsaberHiltFolder.Parent.Blade.BladeConnection)
	BladeToConnector.Part0 = LightsaberHiltFolder.Parent.Blade.BladeConnection
	BladeToConnector.Part1 = LightsaberHiltFolder.Parent.Blade:WaitForChild("Blade")

	LightsaberHiltFolder.Parent.Blade.Blade.CFrame = LightsaberHiltFolder.Parent.Blade.BladeConnection.CFrame
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Sleeve").Value == "Standard" then
	local Sleeve = LightsaberParts:WaitForChild("Body"):WaitForChild("Single-Body-Standard"):Clone()
	Sleeve.Parent = LightsaberHiltFolder

	local HandleToBodyWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToBodyWeld.Part0 = LightsaberHandle
	HandleToBodyWeld.Part1 = Sleeve.UpperBodyConnector

	Sleeve:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchLowerConnector").CFrame)
	Sleeve.Name = "Body"
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Sleeve").Value == "Kenobi" then
	local Sleeve = LightsaberParts:WaitForChild("Body"):WaitForChild("Single-Body-Kenobi"):Clone()
	Sleeve.Parent = LightsaberHiltFolder

	local HandleToBodyWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToBodyWeld.Part0 = LightsaberHandle
	HandleToBodyWeld.Part1 = Sleeve.UpperBodyConnector

	Sleeve:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchLowerConnector").CFrame)
	Sleeve.Name = "Body"
end

if Player:WaitForChild("LightsaberHilt"):WaitForChild("Sleeve").Value == "Taimer" then
	local Sleeve = LightsaberParts:WaitForChild("Body"):WaitForChild("Single-Body-Taimer"):Clone()
	Sleeve.Parent = LightsaberHiltFolder

	local HandleToBodyWeld = Instance.new("WeldConstraint", LightsaberHandle)
	HandleToBodyWeld.Part0 = LightsaberHandle
	HandleToBodyWeld.Part1 = Sleeve.UpperBodyConnector

	Sleeve:SetPrimaryPartCFrame(LightsaberHiltFolder:WaitForChild("Switch"):WaitForChild("SwitchLowerConnector").CFrame)
	Sleeve.Name = "Body"
end
