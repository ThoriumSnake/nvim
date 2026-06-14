vim.opt.fillchars = {
    eob = " ",
}

vim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.g.editorconfig = false

vim.opt.number = true
-- vim.opt.relativenumber = true

vim.opt.undofile = true

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.scrolloff = 19
vim.opt.smoothscroll = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.go.laststatus = 3

-- vim.o.winbar = "%=%f"

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- vim.opt.formatoptions:append("c", "r")
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.opt.listchars = { trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cmdheight = 0
vim.opt.signcolumn = "number"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

--vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = '#FF8811'})
--vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='white', bold=true })
--vim.api.nvim_set_hl(0, 'LineNr', { fg='#FF8811', bold=true })
--vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='white', bold=true })

--vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#A05C7B', bold=true })
--vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
--vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#A05C7B', bold=true })
