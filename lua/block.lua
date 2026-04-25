---@class blockStats

local M = {}

local t = turtle

---Print the contents of an inspect block
---@param direction "up"|"down"|"front" -- _"up"_, _"down"_, _"front"_
---@param state boolean|nil -- _true_ to print state, else _false_|`nil`
---@param tags boolean|nil -- _true_ to print tags, else _false_|`nil`
---@return boolean
function M.blockStats(direction, state, tags)
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
                print("STATE TABLE START:")
                for sk, sv in pairs(b["state"]) do
                    print(sk, sv)
                end
                print("STATE TABLE END:")
            end
            if tags and k == "tags" then
                print("TAGS TABLE START:")
                for tk, tv in pairs(b["tags"]) do
                    print(tk, tv)
                end
                print("TAGS TABLE END:")
            end
        end
    end
    return a ---@type boolean
end

return M
