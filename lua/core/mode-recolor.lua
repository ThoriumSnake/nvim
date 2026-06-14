local color = require("utils.colors")

local initial = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg
local background = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
local lualine_ins = vim.api.nvim_get_hl(0, { name = "lualine_a_insert" })
local lualine_vis = vim.api.nvim_get_hl(0, { name = "lualine_a_visual" })

local insert = lualine_ins.bg == vim.api.nvim_get_hl(0, { name = "Normal" }).bg and lualine_ins.fg or lualine_ins.bg
local visual = lualine_vis.bg == vim.api.nvim_get_hl(0, { name = "Normal" }).bg and lualine_vis.fg or lualine_vis.bg

local blend_insert = color.blend(insert, background, 0.35)
local blend_vis = color.blend(visual, background, 0.4)

vim.api.nvim_set_hl(0, "CursorLineInsert", { bg = blend_insert })
vim.api.nvim_set_hl(0, "Visual", { bg = blend_vis })
vim.api.nvim_set_hl(0, "CursorLineNormal", { bg = initial })

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:i",
    callback = function()
        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = initial })
        vim.wo.winhighlight = "CursorLine:CursorLineInsert"
    end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:n",
    callback = function()
        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = initial })
        vim.wo.winhighlight = "CursorLine:CursorLineNormal"
    end,
})

-- vim.api.nvim_create_autocmd("ModeChanged", {
--     pattern = "*:[vV\x16]",
--     --Wrong patterns
--     -- pattern = "*:[vV\\xV]",
--     -- pattern = "*:v*",
--     callback = function(ev)
--         vim.wo.winhighlight = "Visual:CursorLineVisual"
--     end,
-- })
