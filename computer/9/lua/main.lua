local t = turtle ---@type table -- turtle

---Print the contents of an inspect block
---@param direction "up"|"down"|"front" -- _"up"_, _"down"_, _"front"_
---@param state boolean|nil -- _true_ to print state, else _false_|`nil`
---@param tags boolean|nil -- _true_ to print tags, else _false_|`nil`
---@return boolean
local function blockStats(direction, state, tags)
    local a, b = false, {}
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
---@return boolean
local function autoFuel()
    local lvl = t.getFuelLevel() ---@type number -- initial fuelLevel

    ---Iterate over _table_ `fuelArr` and if any item in it is a substring of
    ---`itemName`, return `true` else return `false`
    ---@param fuelArr table
    ---@param itemName string
    ---@return boolean
    local function isFuel(fuelArr, itemName)
        for _, v in ipairs(fuelArr) do
            if itemName:find(v) then
                return true
            end
        end
        return false
    end

    ---Refuels, print before and after, and return success
    ---@return boolean
    local function refuelNow()
        local ok, err = t.refuel() ---@type boolean, number

        if ok then
            local newLvl = t.getFuelLevel()
            print(("Refuelled %d, current fuel-level is %d"):format(newLvl - lvl, newLvl))
        else
            printError(err)
        end
        return ok
    end

    ---@return boolean
    local function isFuelSelect()
        local curItem = t.getItemDetail()
        if curItem ~= nil then
            return isFuel({ "coal", "lava" }, curItem["name"])
        end
        return false
    end

    if lvl < 100 then
        print("fuellevel, low-btw", lvl)
        if isFuelSelect() then
            return refuelNow()
        else
            for i = 1, 16 do
                t.select(i)
                -- local isFuelNow = isFuel(isFuelArr, "place-holder")
                if isFuelSelect() then
                    break
                end
            end
            return refuelNow()
        end
    else
        print("fuellevel", lvl)
        return true
    end
end

---@param direction function -- t.{up|down|forward|back}
---@param n integer? -- **OPTIONAL** number of steps
---@return nil
local function move(direction, n)
    n = n or 1
    for i = 1, n do
        direction()
    end
end

function Main()
    local chops = 0 ---@type integer
    while true do
        -- if not autoFuel() then
        --     break
        -- end
        if t.detectDown() then
            local atk, _ = t.attack()
            if atk then
                chops = chops + 1
                print("\tCHOP", chops)
            else
                -- print("wait")
                io.write("wait...")
                _G.sleep(0.5)
            end
        else
            move(t.down, 2)
        end
    end
end

Main()
