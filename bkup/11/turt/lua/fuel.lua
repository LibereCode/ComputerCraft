---@class fuelModule

local M = {}

local t = turtle

---Refuels and print details of the refuelling
---@return boolean
function M.autoFuel()
    local lvl = t.getFuelLevel() ---@type number -- initial fuelLevel

    -- ---Iterate over _table_ `fuelArr` and if any item in it is a substring of
    -- ---`itemName`, return `true` else return `false`
    -- ---@param fuelArr table
    -- ---@param itemName string
    -- ---@return boolean
    -- local function isFuel(fuelArr, itemName)
    --     for _, v in ipairs(fuelArr) do
    --         if itemName:find(v) then
    --             return true
    --         end
    --     end
    --     return false
    -- end
    local isFuel = require("lua.item").isItem

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

    -- ---@return boolean
    -- local function isFuelSelect()
    --     local curItem = t.getItemDetail()
    --     if curItem ~= nil then
    --         return isFuel({ "coal", "lava" }, curItem["name"])
    --     end
    --     return false
    -- end
    local isFuelSelect = require("lua.item").isItemSelect

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

return M
