--// Initialization

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local Tagged_Alarms = CollectionService:GetTagged("Panic_Alarms")
local Tagged_Terminals = CollectionService:GetTagged("Panic Terminals")

local Overture = require(ReplicatedStorage:WaitForChild("Overture"))

local Alert_System = workspace:WaitForChild("Alert_System")
local Alert_Sound = Alert_System:WaitForChild("Alarm")

--// Function

function ActivatePanic()
	if Alert_System.Activation.Value == false then
		Alert_Sound:Play()
		
		for _, Tagged_Terminals in pairs(Tagged_Terminals) do
			Tagged_Terminals.screen.TerminalUI.Background.PANICBUTTON.PANIC.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		for _, Tagged_Alarms in pairs(Tagged_Alarms) do
			Tagged_Alarms.Light.Material = Enum.Material.Neon
			Tagged_Alarms.Light.BrickColor = BrickColor.new("Really red")
			Tagged_Alarms.Light.BottomLight.Enabled = true
			Tagged_Alarms.Light.TopLight.Enabled = true
			Tagged_Alarms.Light.Spin.Disabled = false
		end
		
		Alert_System.Activation.Value = true
		
	else
		
		Alert_Sound:Stop()
		
		for _, Tagged_Terminals in pairs(Tagged_Terminals) do
			Tagged_Terminals.screen.TerminalUI.Background.PANICBUTTON.PANIC.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		end

		for _, Tagged_Alarms in pairs(Tagged_Alarms) do
			Tagged_Alarms.Light.Material = Enum.Material.Glass
			Tagged_Alarms.Light.BottomLight.Enabled = false
			Tagged_Alarms.Light.TopLight.Enabled = false
			Tagged_Alarms.Light.Spin.Disabled = true
		end
		
		Alert_System.Activation.Value = false
	end
end

for _, Tagged_Terminals in pairs(Tagged_Terminals) do
	Tagged_Terminals.screen.TerminalUI.Background.PANICBUTTON.ClickPart.ClickDetector.MouseClick:Connect(ActivatePanic)
end
