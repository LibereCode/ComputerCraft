---@class mineModule

local M = {}
local t = turtle

---Mining algorithm
---@return boolean
function M.mineStair()
    -- TODO: make this a `function item.torch()`
    t.turnRight()
    t.dig()
    t.up()
    t.dig()
    t.forward()
    t.turnRight()
    t.turnRight()
    local torchOk, torchErr = require("lua.item").ifElseIterate({ "torch" }, t.place(), t.place())
    print(torchErr)
    t.down()
    t.forward()
    t.turnRight()

    for _ = 1, 10 do
        t.dig()
        t.forward()
        t.digUp()
        t.digDown()
        t.down()
        t.digDown()
    end

    -- TODO: detect sides for valuables

    return true -- TODO: temp
end

return M
