--Shamelessly translated from VimL using ChatGPT

-- Create a group for the autocmds
vim.api.nvim_create_augroup('numbertoggle', { clear = true })

-- Autocmds for toggling between relative and absolute line numbers
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' },
  {
    group = 'numbertoggle',
    pattern = '*',
    callback = function()
      if vim.opt.number:get() and vim.api.nvim_get_mode().mode ~= 'i' then
        vim.opt.relativenumber = true
      end
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' },
  {
    group = 'numbertoggle',
    pattern = '*',
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = false
      end
    end,
  }
)

