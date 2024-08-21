vim.opt.fillchars = { eob = " " }
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("colorscheme cyberdream")

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#A05C7B', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#A05C7B', bold=true })
