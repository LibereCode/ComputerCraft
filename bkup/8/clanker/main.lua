local t = turtle ---@type table -- turtle

local blockStats = require("lua.block").blockStats

local autoFuel = require("lua.fuel").autoFuel

---@param direction function -- t.{up|down|forward|back}
---@param n integer? -- **OPTIONAL** number of steps
---@return nil
local function move(direction, n)
    n = n or 1
    for _ = 1, n do
        direction()
    end
end

function Main()
    while true do
        if not autoFuel() then
            break
        end
        if t.detectDown() then
            move(t.up, 10)
        else
            move(t.down, 10)
        end
        print(t.attack())
        -- blockStats("down")
    end
end

Main()
