--// Initialization

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local __Alarms = CollectionService:GetTagged("Panic_Alarms")
local __Terminals = CollectionService:GetTagged("Panic Terminals")

local Alert_System = workspace:WaitForChild("Alert_System")
local Alert_Sound = Alert_System:WaitForChild("Alarm")

--// Function

function ActivatePanic()
	if Alert_System.Activation.Value == false then
		Alert_Sound:Play()
		
		for _, __Terminals in pairs(__Terminals) do
			__Terminals.screen.TerminalUI.Background.PANICBUTTON.PANIC.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		for _, __Alarms in pairs(__Alarms) do
			__Alarms.Light.Material = Enum.Material.Neon
			__Alarms.Light.BrickColor = BrickColor.new("Really red")
			__Alarms.Light.BottomLight.Enabled = true
			__Alarms.Light.TopLight.Enabled = true
			__Alarms.Light.Spin.Disabled = false
		end
		
		Alert_System.Activation.Value = true
		
	else
		
		Alert_Sound:Stop()
		
		for _, __Terminals in pairs(__Terminals) do
			__Terminals.screen.TerminalUI.Background.PANICBUTTON.PANIC.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		end

		for _, __Alarms in pairs(__Alarms) do
			__Alarms.Light.Material = Enum.Material.Glass
			__Alarms.Light.BottomLight.Enabled = false
			__Alarms.Light.TopLight.Enabled = false
			__Alarms.Light.Spin.Disabled = true
		end
		
		Alert_System.Activation.Value = false
	end
end

for _, __Terminals in pairs(__Terminals) do
	__Terminals.screen.TerminalUI.Background.PANICBUTTON.ClickPart.ClickDetector.MouseClick:Connect(ActivatePanic)
end
