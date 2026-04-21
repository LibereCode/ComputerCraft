local t = turtle

---Print the contents of an inspect block
---@param direction "up"|"down"|"front" -- _"up"_, _"down"_, _"front"_
---@param state boolean|nil -- _true_ to print state, else _false_|`nil`
---@param tags boolean|nil -- _true_ to print tags, else _false_|`nil`
---@return boolean
local function blockStats(direction, state, tags)
    local a = false
    local b = {}
    if direction == "up" then
        a, b = t.inspectUp()
    elseif direction == "down" then
        a, b = t.inspectDown()
    elseif direction == "front" then
        a, b = t.inspect()
    end
    if a then
        print("INSPECT " .. b["name"] .. " STATS")
        for k, v in pairs(b) do
            print(k, v)
            if state and k == "state" then
                for sk, sv in pairs(b["state"]) do
                    print(sk, sv)
                end
            end
            if tags and k == "tags" then
                for tk, tv in pairs(b["tags"]) do
                    print(tk, tv)
                end
            end
        end
    end
    return a ---@type boolean
end

---Refuels and print details of the refuelling
---@return nil
local function autoFuel()
    local printError = printError -- dumb WARN fix

    local lvl = t.getFuelLevel() ---@type number

    -- if lvl
    local ok, err = t.refuel()
    if ok then
        local newLvl = t.getFuelLevel()
        print(("Refuelled %d, current fuel-level is %d"):format(newLvl - lvl, newLvl))
    else
        printError(err)
    end
end

function Main()
    autoFuel()
    if t.detectDown() then
        t.up()
    else
        t.down()
    end
    blockStats("down")
end

while true do
    Main()
end
