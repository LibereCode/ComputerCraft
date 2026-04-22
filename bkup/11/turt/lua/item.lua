---@class itemModule -- Module about selecting and/or finding items in itemslots
-- -@field isTorch function
-- -@field isItemSelect function
-- -@field ifElseIterate function

local M = {}
local t = turtle

---Iterate over _table_ `tourchArr` and if any item in it is a substring of
---`itemName`, return `true` else return `false`
---@param itemArr table<string> -- _substrings_ used in search
---@param itemName string -- the _string_ being searched
---@return boolean
M.isItem = function(itemArr, itemName)
    for _, v in ipairs(itemArr) do
        if itemName:find(v) then
            return true
        end
    end
    return false
end

---@return boolean
M.isItemSelect = function()
    local curItem = t.getItemDetail()
    if curItem ~= nil then
        return M.isItem({ "torch" }, curItem["name"])
    end
    return false
end

---@param baseCond boolean
---@param baseReturn function
---@param iterCond boolean
---@param iterReturn function
---@return function -- return either function of baseReturn or iterReturn
M.ifElseIterate = function(baseCond, baseReturn, iterCond, iterReturn)
    if baseCond then
        return baseReturn
    else
        for i = 1, 16 do
            t.select(i)
            if iterCond then
                break
            end
        end
        return iterReturn
    end
end

return M
