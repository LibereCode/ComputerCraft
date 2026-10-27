---@meta
---From the create addon [CC: Redstone Link Bridge](https://modrinth.com/mod/cc-redstone-link-bridge)

---TODO: peripheral type
--- - redstone_link_bridge
---     need to extend (alias) `ccTweaked.peripheral.peripheralType`, but how?

---Methods

---Example:
---```lua
---local bridge = peripheral.find("redstone_link_bridge")
---assert(bridge, "No redstone_link_bridge found")
---
----- Read an existing frequency pair
---local current = bridge.getLinkSignal("minecraft:diamond", "minecraft:redstone")
---print("Current signal:", current)
---
----- Send a signal to a frequency pair
---bridge.sendLinkSignal("minecraft:diamond", "minecraft:redstone", 7)
---```
---@class ccRedstoneLinkBridge.methods
---@field getLinkSignal fun(freq1: string, freq2: string): number
---@field sendLinkSignal fun(freq1: string, freq2: string, strength: number)

-- ---@type ccTweaked.peripheral
peripheral = {}

---@param freq1 string example: "minecraft:diamond"
---@param freq2 string example: "minecraft:redstone"
---@return number
function peripheral.getLinkSignal(freq1, freq2) end

---@param freq1 string example: "minecraft:diamond"
---@param freq2 string example: "minecraft:redstone"
---@param strength integer example: 15
function peripheral.sendLinkSignal(freq1, freq2, strength) end
