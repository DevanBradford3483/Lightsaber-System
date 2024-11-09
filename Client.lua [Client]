task.wait()
local UserInputService = game:GetService("UserInputService")

local Directory_ReplicatedFirst = game:GetService("ReplicatedFirst")
local Directory_Lighting = game:GetService("Lighting")
local Directory_ReplicatedStorage = game:GetService("ReplicatedStorage")
local Directory_ServerScriptService = game:GetService("ServerScriptService")
local Directory_ServerStorage = game:GetService("ServerStorage")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid") or Character:FindFirstChild("Humanoid")
local Mouse = Player:GetMouse()

local LightsabeValues = script.Parent.Parent.Values

local PlayersBackPack = Player.Backpack
local Tool = script.Parent.Parent.Parent
local ToolName = Tool.Name
local Events = Tool:WaitForChild("Assets"):WaitForChild("Events")

local CurrentForm = Tool.Assets.Values.Form

local Animations = Tool:WaitForChild("Assets").Animations


local Equipped = false
local IgnitedCheck = Tool.Assets.Values.Ignited
local DidIgnite = false

local ForceShiftLock = Player:WaitForChild("ForceShiftLock")

local IgniteDebounce = false
local BlockDebounce = false
local AttackDebounce = false
local OverallDebounce = false

local CanIgnite = false


Events.Setup:FireServer(Character) --// Allows for the Server to Set Up all instances for saber

Player.PlayerGui:WaitForChild("MainUI").Bars.ForceStamina.ForceStamina.Visible = true
Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Background.Visible = true
Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Visible = true
Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Visible = true

--// Setting Players form based on saved form

Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Changed:Connect(function(NewValue)
	if NewValue == "Shii-Cho" then
		LightsabeValues.Form.Value = 1
		warn("Shii-Cho Chosen")
	elseif NewValue == "Makashi" then
		LightsabeValues.Form.Value = 2
		warn("Makashi Chosen")
	elseif NewValue == "Soresu" then
		LightsabeValues.Form.Value = 3
		warn("Soresu Chosen")
	elseif NewValue == "Ataru" then
		LightsabeValues.Form.Value = 4
		warn("Ataru Chosen")
	elseif NewValue == "Djem-So" then
		LightsabeValues.Form.Value = 5
		warn("Djem-So Chosen")
	elseif NewValue == "Niman" then
		LightsabeValues.Form.Value = 6
		warn("Niman Chosen")
	elseif NewValue == "Vapaad" then
		LightsabeValues.Form.Value = 7
		warn("Vapaad Chosen")
	end
end)


if Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Shii-Cho" then
	LightsabeValues.Form.Value = 1
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Makashi" then
	LightsabeValues.Form.Value = 2
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Soresu" then
	LightsabeValues.Form.Value = 3
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Ataru" then
	LightsabeValues.Form.Value = 4
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Djem-So" then
	LightsabeValues.Form.Value = 5
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Niman" then
	LightsabeValues.Form.Value = 6
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Vapaad" then
	LightsabeValues.Form.Value = 7
end

task.wait()



if Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Shii-Cho" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Shii-Cho"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Makashi" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Makashi"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Soresu" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Soresu"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Ataru" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Ataru"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Djem-So" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Djem-So"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Niman" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Niman"
elseif Player:WaitForChild("PlayersForms"):WaitForChild("SinglePlayersForm").Value == "Vapaad" then
	Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Vapaad"
end




LightsabeValues.Form.Changed:Connect(function(Value)
	if Value == 1 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Shii-Cho"
	elseif Value == 2 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Makashi"
	elseif Value == 3 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Soresu"
	elseif Value == 4 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Ataru"
	elseif Value == 5 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Djem-So"
	elseif Value == 6 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Niman"
	elseif Value == 7 then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Form.Text = "Form: Vapaad"
	end
end)










------------------------------------------------------
function onEquipped()
	Equipped = true
	--Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Background.Visible = true
	--Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Visible = true
	
	spawn(function()
		task.wait(1)
		CanIgnite = true
	end)
	
	
	wait(.3)
	local ttttttt = Humanoid:LoadAnimation(Animations.Equip)
	ttttttt:Play()
	Tool.Handle.Equip:Play()
	
	
end

function onUnEquipped()
	Equipped = false
	_G.ForceShiftLock = false
	
	Mouse.Icon = ''
	Player:WaitForChild("IgniteCheck").Value = false
	Player:WaitForChild("ForceShiftLock").Value = false
	--Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.Background.Visible = false
	--Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Visible = false
	
	CanIgnite = false
end

Tool.Equipped:Connect(onEquipped)
Tool.Unequipped:Connect(onUnEquipped)
------------------------------------------------------


																		--// Main Code \\--

-- Shii-Cho Animations Variables			
local ShiiChoIdle = Animations["Shii-Cho"].Idle
local PlayShiiChoIdle = Humanoid:LoadAnimation(ShiiChoIdle)
local ShiiChoBlock = Animations["Shii-Cho"].Block
local PlayShiiChoBlock = Humanoid:LoadAnimation(ShiiChoBlock)

local ShiiChoRightSlash = Animations["Shii-Cho"].RightSlash
local PlayShiiChoRightSlash = Humanoid:LoadAnimation(ShiiChoRightSlash)

local ShiiChoLeftSlash = Animations["Shii-Cho"].LeftSlash
local PlayShiiChoLeftSlash = Humanoid:LoadAnimation(ShiiChoLeftSlash)

local ShiiChoOverheadSlash = Animations["Shii-Cho"].Overhead
local PlayShiiChoOverheadSlash = Humanoid:LoadAnimation(ShiiChoOverheadSlash)


-- Makashi Animations Variables
local MakashiIdle = Animations.Makashi.Idle
local PlayMakashiIdle = Humanoid:LoadAnimation(MakashiIdle)
local MakashiBlock = Animations.Makashi.Block
local PlayMakashiBlock = Humanoid:LoadAnimation(MakashiBlock)
local MakashiLeftSwing = Animations.Makashi.Swing1
local PlayMakashiLeftSwing = Humanoid:LoadAnimation(MakashiLeftSwing)
local MakashiRightSwing = Animations.Makashi.Swing2
local PlayMakashiRightSwing = Humanoid:LoadAnimation(MakashiRightSwing)

local MakashiOverheadSwing = Animations["Makashi"].Overhead
local PlayMakashiOverheadSwing = Humanoid:LoadAnimation(MakashiOverheadSwing)
	
	
-- Soresu Animations Variables		
local SoresuIdle = Animations.Soresu.Idle
local PlaySoresuIdle = Humanoid:LoadAnimation(SoresuIdle)
local SoresuBlock = Animations.Soresu.Block
local PlaySoresuBlock = Humanoid:LoadAnimation(SoresuBlock)
local SoresuLeftSwing = Animations.Soresu.Swing1
local PlaySoresuLeftSwing = Humanoid:LoadAnimation(SoresuLeftSwing)
local SoresuRightSwing = Animations.Soresu.Swing2
local PlaySoresuRightSwing = Humanoid:LoadAnimation(SoresuRightSwing)	

local SoresuOverheadSwing = Animations["Soresu"].Overhead
local PlaySoresuOverheadSwing = Humanoid:LoadAnimation(SoresuOverheadSwing)



-- Ataru Animations Variables		
local AtaruIdle = Animations.Ataru.Idle
local PlayAtaruIdle = Humanoid:LoadAnimation(AtaruIdle)
local AtaruBlock = Animations.Ataru.Block
local PlayAtaruBlock = Humanoid:LoadAnimation(AtaruBlock)
local AtaruLeftSwing = Animations.Ataru.Swing1
local PlayAtaruLeftSwing = Humanoid:LoadAnimation(AtaruLeftSwing)
local AtaruRightSwing = Animations.Ataru.Swing2
local PlayAtaruRightSwing = Humanoid:LoadAnimation(AtaruRightSwing)	

local AtaruOverheadSwing = Animations["Ataru"].Overhead
local PlayAtaruOverheadSwing = Humanoid:LoadAnimation(AtaruOverheadSwing)


-- Djem-So Animations Variables		
local DjemSoIdle = Animations.DjemSo.Idle
local PlayDjemSoIdle = Humanoid:LoadAnimation(DjemSoIdle)
local DjemSoBlock = Animations.DjemSo.Block
local PlayDjemSoBlock = Humanoid:LoadAnimation(DjemSoBlock)
local DjemSoLeftSwing = Animations.DjemSo.Swing1
local PlayDjemSoLeftSwing = Humanoid:LoadAnimation(DjemSoLeftSwing)
local DjemSoRightSwing = Animations.DjemSo.Swing2
local PlayDjemSoRightSwing = Humanoid:LoadAnimation(DjemSoRightSwing)	

local DjemSoOverheadSwing = Animations["DjemSo"].Overhead
local PlayDjemSoOverheadSwing = Humanoid:LoadAnimation(DjemSoOverheadSwing)




-- Niman Animations Variables		
local NimanIdle = Animations.Niman.Idle
local PlayNimanIdle = Humanoid:LoadAnimation(NimanIdle)
local NimanBlock = Animations.Niman.Block
local PlayNimanBlock = Humanoid:LoadAnimation(NimanBlock)
local NimanLeftSwing = Animations.Niman.Swing1
local PlayNimanLeftSwing = Humanoid:LoadAnimation(NimanLeftSwing)
local NimanRightSwing = Animations.Niman.Swing2
local PlayNimanRightSwing = Humanoid:LoadAnimation(NimanRightSwing)	

local NimanOverheadSwing = Animations["Niman"].Overhead
local PlayNimanOverheadSwing = Humanoid:LoadAnimation(NimanOverheadSwing)


-- Vapaad Animations Variables		
local VapaadIdle = Animations.Vapaad.Idle
local PlayVapaadIdle = Humanoid:LoadAnimation(VapaadIdle)
local VapaadBlock = Animations.Vapaad.Block
local PlayVapaadBlock = Humanoid:LoadAnimation(VapaadBlock)
local VapaadLeftSwing = Animations.Vapaad.Swing1
local PlayVapaadLeftSwing = Humanoid:LoadAnimation(VapaadLeftSwing)
local VapaadRightSwing = Animations.Vapaad.Swing2
local PlayVapaadRightSwing = Humanoid:LoadAnimation(VapaadRightSwing)	

local VapaadOverheadSwing = Animations["Vapaad"].Overhead
local PlayVapaadOverheadSwing = Humanoid:LoadAnimation(VapaadOverheadSwing)


			


local function FindPlayersInRange(position, radius)
	if position then
		local nearbyPlayers = {}
		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			local character = player.Character
			if character and character:FindFirstChild("HumanoidRootPart") then
				local distance = (character.HumanoidRootPart.Position - position).Magnitude
				if distance <= radius then
					nearbyPlayers[distance] = character
				end
			end
		end
		return nearbyPlayers
	end
	return {}
end

local function ExecuteAttack()
	local startTime = tick()
	local hitPlayers = {}
	repeat
		local nearbyCharacters = FindPlayersInRange(
			(Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)).Position, 
			4.85
		)

		if script.Parent.Parent.Values.Debug.Value then
			local debugPart = Instance.new("Part")
			debugPart.Parent = Player.Character
			debugPart.Anchored = true
			debugPart.CanCollide = false
			debugPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
			debugPart.Material = Enum.Material.SmoothPlastic
			debugPart.Color = Color3.new(1, 0, 0)
			debugPart.Size = Vector3.new(4.85 * 2, 4.85 * 2, 4.85 * 2)
			debugPart.Transparency = 0.99
			debugPart.Shape = "Ball"
			game:GetService("Debris"):AddItem(debugPart, 0.5)
		end

		for _, targetCharacter in pairs(nearbyCharacters) do
			if not hitPlayers[targetCharacter] and targetCharacter ~= Player.Character then
				hitPlayers[targetCharacter] = true
				local playerHit = game:GetService("Players"):GetPlayerFromCharacter(targetCharacter)
				if playerHit then
					Events.Attack:FireServer(targetCharacter)
				end
			end
		end

		game:GetService("RunService").RenderStepped:Wait()
	until (tick() - startTime) >= 0.5
end





			
														
Player:WaitForChild("IgniteCheck").Changed:Connect(function(NewStatus)
	if NewStatus == false then
		PlayShiiChoBlock:Stop()
		PlayMakashiBlock:Stop()
		PlaySoresuBlock:Stop()
		PlayAtaruBlock:Stop()
		PlayDjemSoBlock:Stop()
		PlayNimanBlock:Stop()
		PlayVapaadBlock:Stop()
	end
end)
														
														
														
														
Events.BreakBlock.OnClientEvent:Connect(function()
	PlayShiiChoBlock:Stop()
	PlayMakashiBlock:Stop()
	PlaySoresuBlock:Stop()
	PlayAtaruBlock:Stop()
	PlayDjemSoBlock:Stop()
	PlayNimanBlock:Stop()
	PlayVapaadBlock:Stop()
end)																
															
LightsabeValues.BlockStamina.Changed:Connect(function(NewValue)
	while wait() do 
		local staminaValue = LightsabeValues.BlockStamina.Value / 100
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Bar:TweenSize(UDim2.new(staminaValue,0,1,0),"InOut","Quad",.25)
	end
end)

LightsabeValues.Parrying.Changed:Connect(function(State)
	
	if State == true then
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Bar.BackgroundColor3 = Color3.new(0.984314, 1, 0.00392157)
	else
		Player.PlayerGui:WaitForChild("MainUI").Bars.LightsaberBlock.BlockStamina.Bar.BackgroundColor3 = Color3.new(1, 0.721569, 0.243137)
	end
end)



																		
UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
	if input.KeyCode == Enum.KeyCode.Q and not gameProcessed and not IgniteDebounce and Equipped == true and CanIgnite == true then
		if IgnitedCheck.Value == false then
			Events.Ignite:FireServer()
			DidIgnite = true
			Player:WaitForChild("IgniteCheck").Value = true
			
			_G.ForceShiftLock = true
			Mouse.Icon = 'rbxassetid://18603061312'
			
			
			CurrentForm.Changed:Connect(function(NewFormValue)
				if NewFormValue == 1 and IgnitedCheck.Value == true then
					PlaySoresuIdle:Stop()
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Stop()
					PlayShiiChoIdle:Play()
				elseif NewFormValue == 2 and IgnitedCheck.Value == true then
					PlaySoresuIdle:Stop()
					PlayShiiChoIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Stop()
					PlayMakashiIdle:Play()
				elseif NewFormValue == 3 and IgnitedCheck.Value == true then
					PlayShiiChoIdle:Stop()				
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Stop()
					PlaySoresuIdle:Play()
				elseif NewFormValue == 4 and IgnitedCheck.Value == true then
					PlayShiiChoIdle:Stop()				
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Play()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Stop()
					PlaySoresuIdle:Stop()
				elseif NewFormValue == 5 and IgnitedCheck.Value == true then
					PlayShiiChoIdle:Stop()				
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Play()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Stop()
					PlaySoresuIdle:Stop()
				elseif NewFormValue == 6 and IgnitedCheck.Value == true then
					PlayShiiChoIdle:Stop()				
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Play()
					PlayVapaadIdle:Stop()
					PlaySoresuIdle:Stop()
				elseif NewFormValue == 7 and IgnitedCheck.Value == true then
					PlayShiiChoIdle:Stop()				
					PlayMakashiIdle:Stop()
					PlayAtaruIdle:Stop()
					PlayDjemSoIdle:Stop()
					PlayNimanIdle:Stop()
					PlayVapaadIdle:Play()
					PlaySoresuIdle:Stop()
				end
			end)
			
			
			if CurrentForm.Value == 1 then
				PlayShiiChoIdle:Play()
			elseif CurrentForm.Value == 2 then
				PlayMakashiIdle:Play()
			elseif CurrentForm.Value == 3 then
				PlaySoresuIdle:Play()
			elseif CurrentForm.Value == 4 then
				PlayAtaruIdle:Play()
			elseif CurrentForm.Value == 5 then
				PlayDjemSoIdle:Play()
			elseif CurrentForm.Value == 6 then
				PlayNimanIdle:Play()
			elseif CurrentForm.Value == 7 then
				PlayVapaadIdle:Play()
			end
			
		
	
			IgniteDebounce = true
			task.wait(1)
			IgniteDebounce = false
		else
			Events.DisIgnite:FireServer()
			IgniteDebounce = true
			DidIgnite = false
			Player:WaitForChild("IgniteCheck").Value = false
			Player:WaitForChild("ForceShiftLock").Value = false
			_G.ForceShiftLock = false
			Mouse.Icon = ''
			
			
			
			if CurrentForm.Value == 1 then
				PlayShiiChoIdle:Stop()
			elseif CurrentForm.Value == 2 then
				PlayMakashiIdle:Stop()
			elseif CurrentForm.Value == 3 then
				PlaySoresuIdle:Stop()
			elseif CurrentForm.Value == 4 then
				PlayAtaruIdle:Stop()
			elseif CurrentForm.Value == 5 then
				PlayDjemSoIdle:Stop()
			elseif CurrentForm.Value == 6 then
				PlayNimanIdle:Stop()
			elseif CurrentForm.Value == 7 then
				PlayVapaadIdle:Stop()
			end
			
			
			task.wait(1)
			IgniteDebounce = false
			
		end
	end
end)


local attackEnabled = true
local blockEnabled = true


UserInputService.InputEnded:Connect(function(input: InputObject, gameProcessed: boolean)
	if input.UserInputType == Enum.UserInputType.MouseButton2 and not gameProcessed and IgnitedCheck.Value == true then
		
		if CurrentForm.Value == 1 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 2 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 3 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 4 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 5 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 6 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		elseif CurrentForm.Value == 7 and IgnitedCheck.Value == true then
			PlayShiiChoBlock:Stop()
			PlayMakashiBlock:Stop()
			PlaySoresuBlock:Stop()
			PlayAtaruBlock:Stop()
			PlayDjemSoBlock:Stop()
			PlayNimanBlock:Stop()
			PlayVapaadBlock:Stop()
		end
		
		
		Events.UnBlock:FireServer()
	end
end)



-- Variables
local lastAnimation = "Overhead" -- Initialize to "Overhead" to cycle through all three animations
local resetFlag = true
local resetCoroutine = nil
local resetTime = 2 -- Adjust this to your desired reset time

-- Functions
local function resetAnimation()
	lastAnimation = "Overhead" -- Reset animation to "Overhead"
end

local function startResetTimer()
	resetFlag = false -- Disable any previous timers
	if resetCoroutine then
		coroutine.close(resetCoroutine) -- Close the existing coroutine if it exists
	end
	resetCoroutine = coroutine.create(function()
		task.wait(resetTime)
		if not resetFlag then
			resetAnimation()
		end
	end)
	coroutine.resume(resetCoroutine)
end

	UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
		if gameProcessed then
			return
		end

		-- Handle blocking
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			if IgnitedCheck.Value == true and not BlockDebounce and LightsabeValues:WaitForChild("CanBlock").Value == true and OverallDebounce == false and attackEnabled then
				
				if LightsabeValues.BlockStamina.Value > 0 then
					blockEnabled = false
					attackEnabled = false

					

					CurrentForm.Changed:Connect(function(NewFormValue)
						if NewFormValue == 1 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Play()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Stop()
							
						elseif NewFormValue == 2 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Play()
							PlayMakashiIdle:Play()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Stop()
							
						elseif NewFormValue == 3 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Stop()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Play()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Stop()
						
						elseif NewFormValue == 4 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Stop()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Play()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Stop()
						elseif NewFormValue == 5 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Stop()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Play()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Stop()
						elseif NewFormValue == 6 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Stop()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Play()
							PlayVapaadIdle:Stop()
						elseif NewFormValue == 7 and IgnitedCheck.Value == true then
							PlayShiiChoIdle:Stop()
							PlayMakashiIdle:Stop()
							PlaySoresuIdle:Stop()
							PlayAtaruIdle:Stop()
							PlayDjemSoIdle:Stop()
							PlayNimanIdle:Stop()
							PlayVapaadIdle:Play()
							
						end
					end)

					if CurrentForm.Value == 1 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Play()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 2 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Play()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 3 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Play()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 4 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Play()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 5 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Play()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 6 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Play()
						PlayVapaadBlock:Stop()
					elseif CurrentForm.Value == 7 and IgnitedCheck.Value == true then
						PlaySoresuBlock:Stop()
						PlayMakashiBlock:Stop()
						PlayAtaruBlock:Stop()
						PlayShiiChoBlock:Stop()
						PlayDjemSoBlock:Stop()
						PlayNimanBlock:Stop()
						PlayVapaadBlock:Play()
					end

					print("blocking")
					Events.Block:FireServer()

					spawn(function()
						task.wait(0.2) -- Ensure the block action lasts for a minimum time before re-enabling
						blockEnabled = true
						attackEnabled = true
					end)
				end
			end
		end

		-- Handle attacking
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if IgnitedCheck.Value == true and not AttackDebounce and LightsabeValues:WaitForChild("CanAttack").Value == true and LightsabeValues:WaitForChild("Blocking").Value == false and OverallDebounce == false and blockEnabled then
				attackEnabled = false
				blockEnabled = false

				--[[
				spawn(function()
					AttackDebounce = true
					task.wait(0.01)
					AttackDebounce = false
				end)
				]]
				
				--[[
				spawn(function()
					BlockDebounce = true
					task.wait(0.5)
					BlockDebounce = false
				end)
				]]
				

				if lastAnimation == "Left" then
					if LightsabeValues.Form.Value == 1 then
						PlayShiiChoRightSlash:Play()
					elseif LightsabeValues.Form.Value == 2 then
						PlayMakashiRightSwing:Play()
					elseif LightsabeValues.Form.Value == 3 then
						PlaySoresuRightSwing:Play()
						PlaySoresuRightSwing:AdjustSpeed(1.2)
					elseif LightsabeValues.Form.Value == 4 then
						PlayAtaruRightSwing:Play()
					elseif LightsabeValues.Form.Value == 5 then
						PlayDjemSoRightSwing:Play()
					elseif LightsabeValues.Form.Value == 6 then
						PlayNimanRightSwing:Play()
					elseif LightsabeValues.Form.Value == 7 then
						PlayVapaadRightSwing:Play()
					end
					lastAnimation = "Right"
					Events.Swing:FireServer(1)
				elseif lastAnimation == "Right" then
					if LightsabeValues.Form.Value == 1 then
						PlayShiiChoOverheadSlash:Play()
						PlayShiiChoOverheadSlash:AdjustSpeed(1.2)
					elseif LightsabeValues.Form.Value == 2 then
						PlayMakashiOverheadSwing:Play()
					elseif LightsabeValues.Form.Value == 3 then
						PlaySoresuOverheadSwing:Play()
						PlaySoresuOverheadSwing:AdjustSpeed(1.2)
					elseif LightsabeValues.Form.Value == 4 then
						PlayAtaruOverheadSwing:Play()
					elseif LightsabeValues.Form.Value == 5 then
						PlayDjemSoOverheadSwing:Play()
					elseif LightsabeValues.Form.Value == 6 then
						PlayNimanOverheadSwing:Play()
					elseif LightsabeValues.Form.Value == 7 then
						PlayVapaadOverheadSwing:Play()
					end
					lastAnimation = "Overhead"
					Events.Swing:FireServer(2)
				else
					if LightsabeValues.Form.Value == 1 then
						PlayShiiChoLeftSlash:Play()
					elseif LightsabeValues.Form.Value == 2 then
						PlayMakashiLeftSwing:Play()
					elseif LightsabeValues.Form.Value == 3 then
						PlaySoresuLeftSwing:Play()
						PlaySoresuLeftSwing:AdjustSpeed(1.2)
					elseif LightsabeValues.Form.Value == 4 then
						PlayAtaruLeftSwing:Play()
					elseif LightsabeValues.Form.Value == 5 then
						PlayDjemSoLeftSwing:Play()
					elseif LightsabeValues.Form.Value == 6 then
						PlayNimanLeftSwing:Play()
					elseif LightsabeValues.Form.Value == 7 then
						PlayVapaadLeftSwing:Play()
					end
					lastAnimation = "Left"
					Events.Swing:FireServer(3)
				end

				ExecuteAttack()

				

				resetFlag = true
				startResetTimer()

				spawn(function()
					task.wait(0.0001) -- Ensure the attack action lasts for a minimum time before re-enabling
					attackEnabled = true
					blockEnabled = true
				end)
			end
		end
	end)

-- Initialize reset timer
startResetTimer()



--[[
UserInputService.InputBegan:Connect(function(Input, gameProcessed)
	
	if Input.KeyCode == Enum.KeyCode.R and not gameProcessed then
		
		if Player:WaitForChild("Kicks").Value > 0 then
			print("Kicked")
			--Events.Kick:FireServer()
		end
			
	end
end)
]]

local FormDebounce = false

UserInputService.InputBegan:Connect(function(Input, gameProcessed)
	
	if Input.KeyCode == Enum.KeyCode.X and not gameProcessed and FormDebounce == false then
		FormDebounce = true
		if LightsabeValues.Form.Value == 1 then
			LightsabeValues.Form.Value = 2
			Events.Form:FireServer(2)
		elseif LightsabeValues.Form.Value == 2 then
			LightsabeValues.Form.Value = 3
			Events.Form:FireServer(3)
		elseif LightsabeValues.Form.Value == 3 then
			LightsabeValues.Form.Value = 4
			Events.Form:FireServer(4)
		elseif LightsabeValues.Form.Value == 4 then
			LightsabeValues.Form.Value = 5
			Events.Form:FireServer(5)
		elseif LightsabeValues.Form.Value == 5 then
			LightsabeValues.Form.Value = 6
			Events.Form:FireServer(6)
		elseif LightsabeValues.Form.Value == 6 then
			LightsabeValues.Form.Value = 7
			Events.Form:FireServer(7)
		elseif LightsabeValues.Form.Value == 7 then
			LightsabeValues.Form.Value = 1
			Events.Form:FireServer(1)
		end
		task.wait(1)
		FormDebounce = false
	end
end)


local function ParriedAnimations()

	PlayShiiChoBlock:Stop()
	PlayShiiChoLeftSlash:Stop()
	PlayShiiChoRightSlash:Stop()
	PlayShiiChoOverheadSlash:Stop()

	PlayMakashiBlock:Stop()
	PlayMakashiLeftSwing:Stop()
	PlayMakashiRightSwing:Stop()
	PlayMakashiOverheadSwing:Stop()

	PlaySoresuBlock:Stop()
	PlaySoresuLeftSwing:Stop()
	PlaySoresuRightSwing:Stop()
	PlaySoresuOverheadSwing:Stop()

	PlayAtaruBlock:Stop()
	PlayAtaruLeftSwing:Stop()
	PlayAtaruRightSwing:Stop()
	PlayAtaruOverheadSwing:Stop()

	PlayDjemSoBlock:Stop()
	PlayDjemSoLeftSwing:Stop()
	PlayDjemSoRightSwing:Stop()
	PlayDjemSoOverheadSwing:Stop()

	PlayNimanBlock:Stop()
	PlayNimanLeftSwing:Stop()
	PlayNimanRightSwing:Stop()
	PlayNimanOverheadSwing:Stop()

	PlayVapaadBlock:Stop()
	PlayVapaadLeftSwing:Stop()
	PlayVapaadRightSwing:Stop()
	PlayVapaadOverheadSwing:Stop()
end

Events.Parried.OnClientEvent:Connect(function()
	ParriedAnimations()
end)



local function playerUnEquipp()
	PlayShiiChoIdle:Stop()
	PlayMakashiIdle:Stop()
	PlaySoresuIdle:Stop()
	PlayAtaruIdle:Stop()
	PlayDjemSoIdle:Stop()
	PlayNimanIdle:Stop()
	PlayVapaadIdle:Stop()
	
	PlayShiiChoBlock:Stop()
	PlayShiiChoLeftSlash:Stop()
	PlayShiiChoRightSlash:Stop()
	PlayShiiChoOverheadSlash:Stop()
	
	PlayMakashiBlock:Stop()
	PlayMakashiLeftSwing:Stop()
	PlayMakashiRightSwing:Stop()
	PlayMakashiOverheadSwing:Stop()
	
	PlaySoresuBlock:Stop()
	PlaySoresuLeftSwing:Stop()
	PlaySoresuRightSwing:Stop()
	PlaySoresuOverheadSwing:Stop()
	
	PlayAtaruBlock:Stop()
	PlayAtaruLeftSwing:Stop()
	PlayAtaruRightSwing:Stop()
	PlayAtaruOverheadSwing:Stop()
	
	PlayDjemSoBlock:Stop()
	PlayDjemSoLeftSwing:Stop()
	PlayDjemSoRightSwing:Stop()
	PlayDjemSoOverheadSwing:Stop()
	
	PlayNimanBlock:Stop()
	PlayNimanLeftSwing:Stop()
	PlayNimanRightSwing:Stop()
	PlayNimanOverheadSwing:Stop()
	
	PlayVapaadBlock:Stop()
	PlayVapaadLeftSwing:Stop()
	PlayVapaadRightSwing:Stop()
	PlayVapaadOverheadSwing:Stop()
	
	
	
	
	
	if DidIgnite == true then
		Events.DisIgnite:FireServer()
		DidIgnite = false
	end
	
	
end

Tool.Unequipped:Connect(playerUnEquipp)


Humanoid.Died:Connect(function()
	Player:WaitForChild("IgniteCheck").Value = false
end)

Humanoid.Died:Connect(function()
	_G.ForceShiftLock = false
	ForceShiftLock.Value = false
	Mouse.Icon = ''
end)
