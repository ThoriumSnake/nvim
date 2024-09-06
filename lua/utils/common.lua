local M = {}

---@param patterns string|string[]
M.argv_contains = function(patterns)
	patterns = type(patterns) == 'string' and { patterns } or patterns --[[@ as string[] ]]
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
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

M.dump = dump

M.print_table = function(input)
    print(dump(input))
end

return M
