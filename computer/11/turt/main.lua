local t = turtle ---@type table -- turtle

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
    local chops = 0 ---@type integer
    -- while true do
    for _ = 1, 33 do
        if not autoFuel() then
            break
        end
        -- print("what the frick?")
        -- -@class _G
        -- -@field sleep function(seconds:number)
        -- _G.sleep(0.5) ---Like shell `sleep`
        -- print("hello world?")
        require("lua.mine").mineStair()
    end
end

Main()
