local M = {}

---@param patterns string|string[]
M.argv_contains = function(patterns)
    patterns = type(patterns) == "string" and { patterns } or patterns --[[@ as string[] ]]
    local argv = vim.fn.argv() --[[@ as string[] ]]
    for _, arg in pairs(argv) do
        for _, pattern in pairs(patterns) do
            if string.find(arg, pattern, 1, true) then
                return true
            end
        end
    end
    return false
end

local function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

M.dump = dump

M.print_table = function(input)
    print(dump(input))
end

M.unoil = function(path)
    if string.sub(path, 1, 6) == "oil://" then
        return string.sub(path, 7, -1)
    end
    return nil
end

M.cantab = function()
    local lineString = vim.api.nvim_get_current_line()
    --Matches any amount of whitespace (Including 0 it seems) but not chars
    if lineString:match("^%s*$") then
        return true
    end

    local currentLine = vim.fn.getline(".")
    local cursorPos = vim.fn.col(".")
    --Matches first char that's not whitespace and returns position
    if cursorPos == vim.fn.match(currentLine, "\\S") + 1 then
        return true
    end
end

M.copy_table = function(obj, seen)
    if type(obj) ~= "table" then
        return obj
    end
    if seen and seen[obj] then
        return seen[obj]
    end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do
        res[M.copy_table(k, s)] = M.copy_table(v, s)
    end
    return res
end

return M
