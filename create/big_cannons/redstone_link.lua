local bridge = peripheral.find("redstone_link_bridge")
assert(bridge, "No redstone_link_bridge found")

-- -- Read an existing frequency pair
-- local current = bridge.getLinkSignal("minecraft:piston", "minecraft:lever")
-- print("Current signal:", current)

local tick = 0.05

local shoot_signal = { "minecraft:piston", "quark:gold_button" }
local assemble_signal = { "minecraft:piston", "minecraft:lever" }
local reload_signal = { "create:redstone_link", "minecraft:piston" }

while true do
	bridge.sendLinkSignal(assemble_signal[1], assemble_signal[2], 15)
	os.sleep(tick * 2)

	bridge.sendLinkSignal(shoot_signal[1], shoot_signal[2], 15)
	os.sleep(tick)
	bridge.sendLinkSignal(shoot_signal[1], shoot_signal[2], 0)

	bridge.sendLinkSignal(assemble_signal[1], assemble_signal[2], 0)
	os.sleep(tick)

	bridge.sendLinkSignal(reload_signal[1], reload_signal[2], 15)
	os.sleep(tick)
	bridge.sendLinkSignal(reload_signal[1], reload_signal[2], 0)
	os.sleep(tick * 25)
end
