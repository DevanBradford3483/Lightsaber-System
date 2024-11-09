local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = script.Parent.Parent.Parent.Parent.Parent
local Util = require(script.Parent.Util)
local Event = script.Parent.Parent.Events
local Tool = script.Parent.Parent.Parent
local User = Tool.Parent.Parent
local Character = User.Character
local PlayerHumanoid = Character:FindFirstChild("Humanoid")
local LightsabeValues = script.Parent.Parent.Values
local Blade = script.Parent.Parent.Models.Blade.Blade
local IgnitedCheck = Tool.Assets.Values.Ignited

local isEquipping = false
local isUnequipping = false

local DamageValue = 15

function EquippingSaber()
	if isEquipping then return end
	isEquipping = true
	isUnequipping = false

	if isEquipping then
		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Emitter"):GetChildren()) do
			if v.Name ~= "BladeConnector" and v.Name ~= "EmitterLowerConnector" then
				v.Transparency = 1
			end
		end
		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Switch"):GetChildren()) do
			v.Transparency = 1
		end
		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Body"):GetChildren()) do
			if v.Name ~= "LowerBodyConnector" then
				v.Transparency = 1
			end
		end
		task.wait(.6)
		for _,v in pairs(Character:WaitForChild("PlayersEmitter"):GetChildren()) do

			if v.Name ~= "BladeConnector" or v.Name ~= "EmitterLowerConnector" then
				v.Transparency = 1
			end

		end
		for _,v in pairs(Character:WaitForChild("PlayersSwitch"):GetChildren()) do
			if v.Name ~= "SwitchLowerConnector" or v.Name ~= "SwitchUpperConnector" then
				v.Transparency = 1
			end
		end
		for _,v in pairs(Character:WaitForChild("PlayersSleeve"):GetChildren()) do
			if v.Name ~= "LowerBodyConnector" then
				v.Transparency = 1
			end
		end




		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Emitter"):GetChildren()) do
			if v.Name ~= "BladeConnector" and v.Name ~= "EmitterLowerConnector" then
				v.Transparency = 0
			end
		end
		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Switch"):GetChildren()) do
			if v.Name ~= "SwitchLowerConnector" and v.Name ~= "SwitchUpperConnector" then
				v.Transparency = 0
			end
		end
		for _,v in pairs(Tool.Assets.Models.Hilt:WaitForChild("Body"):GetChildren()) do
			if v.Name ~= "LowerBodyConnector" then
				v.Transparency = 0
			end
		end



	end

	isEquipping = false
end

function UnEquippingSaber()
	if isUnequipping then return end
	isUnequipping = true

	isEquipping = false
	wait(0.4)

	if isUnequipping then
		for _,v in pairs(Character:WaitForChild("PlayersEmitter"):GetChildren()) do

			if v.Name == "BladeConnector" or v.Name == "EmitterLowerConnector" then
				--//Nothing
			else
				v.Transparency = 0
			end

		end
		for _,v in pairs(Character:WaitForChild("PlayersSwitch"):GetChildren()) do
			if v.Name == "SwitchLowerConnector" or v.Name == "SwitchUpperConnector" then
				--//Nothing
			else
				v.Transparency = 0
			end

		end
		for _,v in pairs(Character:WaitForChild("PlayersSleeve"):GetChildren()) do

			if v.Name == "LowerBodyConnector" then
				--//Nothing
			else
				v.Transparency = 0
			end


		end
	end

	isUnequipping = false


end

function ShimmerBlade()
	local ShimmerInfo = TweenInfo.new(.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true)

	for _, Beam in pairs(script.Parent.Parent.Models.Blade.Blade:GetChildren()) do
		if Beam:IsA("Beam") then
			local Properties = {Width0 = Beam.Width0 + .1, Width1 = Beam.Width1 + .2}
			TweenService:Create(Beam, ShimmerInfo, Properties):Play()
		end
	end
end

ShimmerBlade()


Tool.Equipped:Connect(EquippingSaber)
Tool.Unequipped:Connect(UnEquippingSaber)


local HitDebounce = false
local activated = false
local AttackDebounce = false

--// Check Status of Blocking Stamina

local CanAttack = Instance.new("BoolValue", LightsabeValues)
CanAttack.Name = "CanAttack"
CanAttack.Value = true

local CanBlock = Instance.new("BoolValue", LightsabeValues)
CanBlock.Name = "CanBlock"
CanBlock.Value = true


function FormChange(Player, FormValue)
	if FormValue == 1 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Shii-Cho"
	elseif FormValue == 2 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Makashi"
	elseif FormValue == 3 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Soresu"
	elseif FormValue == 4 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Ataru"
	elseif FormValue == 5 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Djem-So"
	elseif FormValue == 6 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Niman"
	elseif FormValue == 7 then
		Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value = "Vapaad"
	end
end

Event.Form.OnServerEvent:Connect(FormChange)






LightsabeValues.BlockStamina.Changed:Connect(function(NewStaminaValue)

	if NewStaminaValue == 0 then
		LightsabeValues.Blocking.Value = false
		Event.BreakBlock:FireClient(Player)
	end
end)

Player:WaitForChild("DarkInnerCore").Changed:Connect(function(NewStatus)
	if NewStatus == true then
		Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
		Blade.Inner.LightEmission = 0
	else
		Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
		Blade.Inner.LightEmission = 1
	end
end)


Event.Ignite.OnServerEvent:Connect(function(Player)

	LightsabeValues.Ignited.Value = true
	Blade.Inner.Enabled = true
	Blade.Outer.Enabled = true

	Blade.Outer.Color = ColorSequence.new(Util.Colors.Blue.ColorSequenceOption)
	Blade.Glow.Enabled = true
	Blade.Trail.Enabled = true
	if Player.Team == game.Teams["The Sith Order"] or Player.Team == game.Teams.Hostiles then
		if Player:WaitForChild("DarkInnerCore").Value == true then
			Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
			Blade.Inner.LightEmission = 0
		else
			Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
			Blade.Inner.LightEmission = 0
		end

		Blade.Outer.Color = ColorSequence.new(Util.Colors.Red.ColorSequenceOption)
		Blade.Glow.Color = Util.Colors.Red.Color3Option
		Blade.Glow.Brightness = Util.Colors.Red.Brightness
		Blade.Trail.Color = ColorSequence.new(Util.Colors.Red.ColorSequenceOption)
	else
		if Player.LightsaberColor.Value == "None" then
			Player:Kick("You have cheated to get this lightsaber.")
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Blue.ColorSequenceOption)
			Blade.Glow.Color = Color3.new(Util.Colors.Blue.Color3Option)
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Blue.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Light Blue" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.LightBlue.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.LightBlue.Color3Option
			Blade.Glow.Brightness = Util.Colors.LightBlue.Brightness	
			Blade.Trail.Color = ColorSequence.new(Util.Colors.LightBlue.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Blue" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Blue.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Blue.Color3Option
			Blade.Glow.Brightness = Util.Colors.Blue.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Blue.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Green" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Green.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Green.Color3Option
			Blade.Glow.Brightness = Util.Colors.Green.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Green.ColorSequenceOption)
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Green.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Red" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Red.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Red.Color3Option
			Blade.Glow.Brightness = Util.Colors.Red.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Red.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Orange" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Orange.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Orange.Color3Option
			Blade.Glow.Brightness = Util.Colors.Orange.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Orange.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Yellow" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Yellow.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Yellow.Color3Option
			Blade.Glow.Brightness = Util.Colors.Yellow.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Yellow.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Pink" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Pink.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Pink.Color3Option
			Blade.Glow.Brightness = Util.Colors.Pink.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Pink.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "Purple" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.Purple.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.Purple.Color3Option
			Blade.Glow.Brightness = Util.Colors.Purple.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.Purple.ColorSequenceOption)
		elseif Player.LightsaberColor.Value == "White" then
			if Player:WaitForChild("DarkInnerCore").Value == true then
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(18, 18, 18))
				Blade.Inner.LightEmission = 0
			else
				Blade.Inner.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
				Blade.Inner.LightEmission = 1
			end
			Blade.Outer.Color = ColorSequence.new(Util.Colors.White.ColorSequenceOption)
			Blade.Glow.Color = Util.Colors.White.Color3Option
			Blade.Glow.Brightness = Util.Colors.White.Brightness
			Blade.Trail.Color = ColorSequence.new(Util.Colors.White.ColorSequenceOption)
		end
	end
	
	
	

	local IgnitionTween = TweenService:Create(Blade.Top, TweenInfo.new(
		0.3,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.InOut,
		0), {CFrame = CFrame.new(0, 2.142, -0)})

	IgnitionTween:Play()

	if Player.LightsaberIgnitionSound.Value == "Default" then
		script.Parent.Parent.Parent.Handle.IgniteVersion1:Play()
	elseif Player.LightsaberIgnitionSound.Value == "Ahsoka" then
		script.Parent.Parent.Parent.Handle.AhsokaIgnitieVersion1:Play()
	end

	task.wait(1)
	script.Parent.Parent.Parent.Handle.HummingVersion1:Play()

end)

Event.DisIgnite.OnServerEvent:Connect(function(Player)
	LightsabeValues.Ignited.Value = false
	LightsabeValues.Blocking.Value = false

	Blade.Glow.Enabled = false
	Blade.Trail.Enabled = false
	local DisIgniteTween = TweenService:Create(Blade.Top, TweenInfo.new(
		0.3,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.InOut,
		0), {CFrame = CFrame.new(0, -2.138, -0)})

	DisIgniteTween:Play()
	script.Parent.Parent.Parent.Handle.HummingVersion1:Stop()
	script.Parent.Parent.Parent.Handle.DisIgniteVersion1:Play()
	task.wait(0.2)
	Blade.Inner.Enabled = false
	Blade.Outer.Enabled = false

	local function DoubleCheckSoundsAreOff()
		task.wait(.3)
		script.Parent.Parent.Parent.Handle.HummingVersion1:Stop()
	end

	spawn(DoubleCheckSoundsAreOff)

end)

Event.Block.OnServerEvent:Connect(function()
	LightsabeValues.Blocking.Value = true
	LightsabeValues.Parrying.Value = true
	task.wait(0.2)
	LightsabeValues.Parrying.Value = false
end)
Event.UnBlock.OnServerEvent:Connect(function()
	LightsabeValues.Blocking.Value = false
	LightsabeValues.Parrying.Value = false
end)

local Damagedebounce = false


Event.Swing.OnServerEvent:Connect(function(Player, Number)
	
	if Number == 1 then
		Tool.Handle.Swing1:Play()
	elseif Number == 2 then
		Tool.Handle.Swing2:Play()
	elseif Number == 3 then
		Tool.Handle.Swing3:Play()
	end
	
	spawn(function()
		Blade.Trail.LightEmission = 1
		Blade.Trail.LightInfluence = 0

		Blade.Trail.Lifetime = 0.15
		Blade.Trail.MaxLength = 999
		Blade.Trail.MinLength = 0

		task.wait(1)

		Blade.Trail.LightEmission = 1
		Blade.Trail.LightInfluence = 0

		Blade.Trail.Lifetime = 0.01
		Blade.Trail.MaxLength = 0
		Blade.Trail.MinLength = 0
	end)
	
end)



Event.Attack.OnServerEvent:Connect(function(Player, TargetCharacter)
	
	local function DamagePlayer()
		warn("func")
		local char = TargetCharacter
		local phit = game:GetService("Players"):GetPlayerFromCharacter(TargetCharacter)
		local hrp = char.HumanoidRootPart
		local charhrp = char.HumanoidRootPart
		local playerChar = phit.Character
		local TargetHumanoid = playerChar:FindFirstChildOfClass("Humanoid")
		if not charhrp or (charhrp.Position-hrp.Position).Magnitude >= 4.85*3 then
			return
		end
		
		
		if Player.TeamKill.Value == true then
			if char:FindFirstChildOfClass("Tool") then
				if char:FindFirstChildOfClass("Tool"):GetAttribute("Lightsaber") == true then

					local TargetLightsaber = char:FindFirstChildOfClass("Tool")
					local TargetLightsaberValues = TargetLightsaber.Assets.Values

					if TargetLightsaberValues.Blocking.Value == true and TargetLightsaberValues.Parrying.Value == false then

						Tool.Handle.HitBlock:Play()
						TargetLightsaber.Assets.Models.Blade.Blade.BlockParticle:Emit(25)
						TargetLightsaber.Assets.Models.Blade.Blade.BladeSpark:Emit(25)
						spawn(function()
							TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = true
							task.wait(0.4)
							TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = false
							task.wait(0.4)
							TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = false
						end)
						TargetLightsaberValues.BlockStamina.Value -= 10

					elseif TargetLightsaberValues.Parrying.Value == true then

						Tool.Handle.Parried:Play()
						TargetLightsaber.Assets.Values.ParriesAvailable.Value -= 1
						TargetLightsaber.Assets.Models.Blade.Blade.ParriedFlash:Emit(1)
						TargetLightsaber.Assets.Models.Blade.Blade.BlockParticle:Emit(25)
						TargetLightsaber.Assets.Models.Blade.Blade.BladeSpark:Emit(25)
						spawn(function()
							TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = true
							task.wait(0.4)
							TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = false
						end)
						spawn(function()
							spawn(function()
								local EventParriedDebounce = false

								if EventParriedDebounce == false then
									Event.Parried:FireClient(Player)
									EventParriedDebounce = true
								end
								task.wait(1)
								EventParriedDebounce = false
							end)

							local ParriedAnimation = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Animations"):WaitForChild("Parried")
							local PlayParriedAnimation = PlayerHumanoid:LoadAnimation(ParriedAnimation)
							PlayParriedAnimation:Play()
						end)
						spawn(function()
							Player:WaitForChild("CanFlip").Value = false
							PlayerHumanoid.WalkSpeed = 4
							PlayerHumanoid.JumpPower = 0
							AttackDebounce = true
							LightsabeValues:WaitForChild("CanAttack").Value = false
							LightsabeValues:WaitForChild("CanBlock").Value = false
							task.wait(1)
							PlayerHumanoid.WalkSpeed = 16
							PlayerHumanoid.JumpPower = 50
							AttackDebounce = false
							LightsabeValues:WaitForChild("CanAttack").Value = true
							LightsabeValues:WaitForChild("CanBlock").Value = true
							Player:WaitForChild("CanFlip").Value = true
						end)



					else -- If player has Lightsaber equipped but not blocking etc
						TargetHumanoid:TakeDamage(DamageValue)
						Tool.Handle.Clash:Play()
					end
				else
					TargetHumanoid:TakeDamage(DamageValue)
					Tool.Handle.Clash:Play()
				end
			else
				TargetHumanoid:TakeDamage(DamageValue)
				Tool.Handle.Clash:Play()
			end
		else
			if Player.Team ~= phit.Team then
				if char:FindFirstChildOfClass("Tool") then
					if char:FindFirstChildOfClass("Tool"):GetAttribute("Lightsaber") == true then

						local TargetLightsaber = char:FindFirstChildOfClass("Tool")
						local TargetLightsaberValues = TargetLightsaber.Assets.Values

						if TargetLightsaberValues.Blocking.Value == true and TargetLightsaberValues.Parrying.Value == false then

							Tool.Handle.HitBlock:Play()
							TargetLightsaber.Assets.Models.Blade.Blade.BlockParticle:Emit(25)
							TargetLightsaber.Assets.Models.Blade.Blade.BladeSpark:Emit(25)
							spawn(function()
								TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = true
								task.wait(0.4)
								TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = false
							end)
							TargetLightsaberValues.BlockStamina.Value -= 10

						elseif TargetLightsaberValues.Parrying.Value == true then -- Parrying

							Tool.Handle.Parried:Play()
							TargetLightsaber.Assets.Values.ParriesAvailable.Value -= 1
							TargetLightsaber.Assets.Models.Blade.Blade.ParriedFlash:Emit(1)
							TargetLightsaber.Assets.Models.Blade.Blade.BlockParticle:Emit(25)
							TargetLightsaber.Assets.Models.Blade.Blade.BladeSpark:Emit(25)
							spawn(function()
								TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = true
								task.wait(0.4)
								TargetLightsaber.Assets.Models.Blade.Blade.SparkLight.Enabled = false
							end)
							spawn(function()
								spawn(function()
									local EventParriedDebounce = false

									if EventParriedDebounce == false then
										Event.Parried:FireClient(Player)
										EventParriedDebounce = true
									end
									task.wait(1)
									EventParriedDebounce = false
								end)

								local ParriedAnimation = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Animations"):WaitForChild("Parried")
								local PlayParriedAnimation = PlayerHumanoid:LoadAnimation(ParriedAnimation)
								PlayParriedAnimation:Play()
							end)
							spawn(function()
								Player:WaitForChild("CanFlip").Value = false
								PlayerHumanoid.WalkSpeed = 4
								PlayerHumanoid.JumpPower = 0
								AttackDebounce = true
								LightsabeValues:WaitForChild("CanAttack").Value = false
								LightsabeValues:WaitForChild("CanBlock").Value = false
								task.wait(1)
								PlayerHumanoid.WalkSpeed = 16
								PlayerHumanoid.JumpPower = 50
								AttackDebounce = false
								LightsabeValues:WaitForChild("CanAttack").Value = true
								LightsabeValues:WaitForChild("CanBlock").Value = true
								Player:WaitForChild("CanFlip").Value = true
							end)



						else -- If player has Lightsaber equipped but not blocking etc
							TargetHumanoid:TakeDamage(DamageValue)
							Tool.Handle.Clash:Play()
						end
					else
						TargetHumanoid:TakeDamage(DamageValue)
						Tool.Handle.Clash:Play()
					end
				else
					TargetHumanoid:TakeDamage(DamageValue)
					Tool.Handle.Clash:Play()
				end
			end
		end
		
	end
	
	DamagePlayer()
end)

Event.Kick.OnServerEvent:Connect(function(Player)

end)



spawn(function()
	while true do
		task.wait(2)
		if LightsabeValues.BlockStamina.Value < 100 and LightsabeValues.Blocking.Value == false then
			LightsabeValues.BlockStamina.Value += 10
		end
	end
end)
