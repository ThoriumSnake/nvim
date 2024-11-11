local M = {}

---Get normalised colour
--@param name string or number like 'pink' or '#fa8072'
---@return string[]
local convert_color_to_rgb_table = function(name)
    local color = name
    if type(name) ~= "number" then
        color = vim.api.nvim_get_color_by_name(name)
        if color == -1 then
            color = vim.opt.background:get() == 'dark' and 000 or 255255255
        end
    end

	---Convert colour to hex
	---@param value integer
	---@param offset integer
	---@return integer
	local byte = function(value, offset)
		return bit.band(bit.rshift(value, offset), 0xFF)
	end

	return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

-- M.blend = function(fg, bg, alpha)
-- 	---@param i integer
-- 	---@return integer
-- 	local channel = function(i)
-- 		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
-- 		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
-- 	end
--
-- 	return string.format('#%02X%02X%02X', channel(1), channel(2), channel(3))
-- end
--

M.blend = function(fg, bg, alpha)
	local bg_color = convert_color_to_rgb_table(bg)
	local fg_color = convert_color_to_rgb_table(fg)

	---@param i integer
	---@return integer
	local channel = function(i)
		local ret = (alpha * fg_color[i] + ((1 - alpha) * bg_color[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02X%02X%02X', channel(1), channel(2), channel(3))
end

return M
