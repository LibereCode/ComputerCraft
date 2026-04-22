---@class mineModule

local M = {}
local t = turtle

---Mining algorithm
---@return boolean
function M.mineStair()
    ---Iterate over _table_ `tourchArr` and if any item in it is a substring of
    ---`itemName`, return `true` else return `false`
    ---@param tourchArr table
    ---@param itemName string
    ---@return boolean
    local function isTorch(tourchArr, itemName)
        for _, v in ipairs(tourchArr) do
            if itemName:find(v) then
                return true
            end
        end
        return false
    end

    ---@return boolean
    local function isTourchSelect()
        local curItem = t.getItemDetail()
        if curItem ~= nil then
            return isTorch({ "torch" }, curItem["name"])
        end
        return false
    end

    if lvl < 100 then
        print("fuellevel, low-btw", lvl)
        if isTourchSelect() then
            return refuelNow()
        else
            for i = 1, 16 do
                t.select(i)
                -- local isFuelNow = isFuel(isFuelArr, "place-holder")
                if isTourchSelect() then
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
