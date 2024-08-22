vim.opt.fillchars = { eob = " " }
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.cmd("colorscheme cyberdream")

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#A05C7B', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#A05C7B', bold=true })

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
