---@meta

---The redstone relay is a peripheral that allows reading and outputting redstone signals. While this is not very useful on its own (as computers have the same functionality [built-in](https://tweaked.cc/module/redstone.html)), this can be used with [wired modems](https://tweaked.cc/peripheral/modem.html) to interact with multiple redstone signals from the same computer.
--- 
---The peripheral provides largely identical methods to a computer's built-in [redstone](https://tweaked.cc/module/redstone.html) API, allowing setting signals on all six sides of the block ("top", "bottom", "left", "right", "front" and "back").
--- 
-----
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html)
---@class ccTweaked.peripheral.RedstoneRelay
RedstoneRelay = {}

---Turn the redstone signal of a specific side on or off.
---@param side ccTweaked.peripheral.computerSide The side to set
---@param on boolean Whether the redstone signal should be on or off. When on, a signal strength of 15 is emitted.
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setOutput)
function RedstoneRelay.setOutput(side, on) end

---Get the current redstone output of a specific side.
---@param side ccTweaked.peripheral.computerSide
---@return boolean state Whether the redstone output is on or off.
---@see RedstoneRelay.setOutput
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getOutput)
function RedstoneRelay.getOutput(side) end

---Get the current redstone input of a specific side.
---@param side ccTweaked.peripheral.computerSide The side to get.
---@return boolean state Whether the redstone input is on or off.
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getInput)
function RedstoneRelay.getInput(side) end

---Set the redstone signal strength for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to set.
---@param value number The signal strength between 0 and 15.
---@throws If `value` is not between 0 and 15.
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setAnalogOutput)
function RedstoneRelay.setAnalogOutput(side, value) end

---Set the redstone signal strength for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to set.
---@param value number The signal strength between 0 and 15.
---@throws If `value` is not between 0 and 15.
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setAnalogueOutput)
function RedstoneRelay.setAnalogueOutput(side, value) end

---Get the redstone output signal strength for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to get.
---@return number value The output signal strength, between 0 and 15.
---@see RedstoneRelay.setAnalogOutput
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogOutput)
function RedstoneRelay.getAnalogOutput(side) end

---Get the redstone output signal strength for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to get.
---@return number value The output signal strength, between 0 and 15.
---@see RedstoneRelay.setAnalogueOutput
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogueOutput)
function RedstoneRelay.getAnalogueOutput(side) end

---Set the bundled cable output for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to set.
---@param output number The colour bitmask to set.
---@see colors.subtract For removing a colour from the bitmask
---@see colors.combine For adding a color to the bitmask
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setBundledOutput)
function RedstoneRelay.setBundledOutput(side, output) end

---Get the bundled cable output for a specific side.
---@param side ccTweaked.peripheral.computerSide The side to get.
---@return number mask The bundle cable's output
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getBundledOutput)
function RedstoneRelay.getBundledOutput(side) end

---Get the bundled cable input for a specific side.
---@param side ccTweaked.peripheral.computerSide
---@return number mask The bundle cable's input.
---@see RedstoneRelay.testBundledInput To determine if a specific colour is set.
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getBundledInput)
function RedstoneRelay.getBundledInput(side) end

---Determine if a specific combination of colours are on for the given side.
---@param side ccTweaked.peripheral.computerSide The side to test.
---@param mask number The mask to test.
---@return boolean value If the colours are on.
---@see RedstoneRelay.getBundledInput
------
---[The Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:testBundledInput)
function RedstoneRelay.testBundledInput(side, mask) end

