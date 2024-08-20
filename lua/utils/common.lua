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

return M
