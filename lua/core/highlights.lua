local color = require("utils.colors")

local background = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
local error = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg
local warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg
local info = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" }).fg
local hint = vim.api.nvim_get_hl(0, { name = "DiagnosticHint" }).fg

local blend_error = color.blend(error, background, 0.15)
local blend_warn = color.blend(warn, background, 0.15)
local blend_info = color.blend(info, background, 0.15)
local blend_hint = color.blend(hint, background, 0.15)

--NOTE: Don't use the blend parameter, it blends the window with the desktop lmao
vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg = blend_error })
vim.api.nvim_set_hl(0, "DiagnosticWarnLn", { bg = blend_warn })
vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = blend_info })
vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = blend_hint })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#7ec49d", bg = "NvimDarkGreen", ctermfg = 0, ctermbg = 10 })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ff7da3", cterm = { bold = true }, ctermfg = 9, bold = true })

-- local indent = vim.api.nvim_get_hl(0, {name = "MiniIndentscopeSymbol"}).fg
-- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = indent == "#ffffff" and "#00a5c5a" or indent })
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#00a5c5" })
