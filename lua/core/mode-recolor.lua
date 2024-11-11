
local color = require("utils.colors")

local initial = vim.api.nvim_get_hl(0, {name = "CursorLine"}).bg
local background = vim.api.nvim_get_hl(0, {name = "Normal"}).bg
local lualine_hl = vim.api.nvim_get_hl(0, {name = "lualine_a_insert"})
local insert = lualine_hl.bg == vim.api.nvim_get_hl(0, {name = "Normal"}).bg and lualine_hl.fg or lualine_hl.bg


local blend_insert = color.blend(insert, background, 0.15)

-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
--     pattern = "*",
--     callback = function()
--         initial = vim.api.nvim_get_hl(0, {name = "CursorLine"}).bg
--         background = vim.api.nvim_get_hl(0, {name = "Normal"}).bg
--         lualine_hl = vim.api.nvim_get_hl(0, {name = "lualine_a_insert"})
--         insert = lualine_hl.bg == vim.api.nvim_get_hl(0, {name = "Normal"}).bg and lualine_hl.fg or lualine_hl.bg
--
--         blend_insert = color.blend(insert, background, 0.3)
--     end
-- })

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", {bg=blend_insert})
    end
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLine", {bg=initial})
    end
})

vim.api.nvim_create_autocmd("ModeChanged", {
  -- pattern = "*:[vV\xV]",
  pattern = "*:n",
  callback = function()
      vim.api.nvim_set_hl(0, "CursorLine", {bg=initial})
  end,
})
