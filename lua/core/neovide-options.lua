vim.o.guifont = "JetBrainsMonoNL Nerd Font:h11"

if vim.g.neovide then
    vim.g.neovide_window_blurred = true
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_normal_opacity = 0.8
end

-- Reset the font size when leaving Oil
--vim.api.nvim_create_autocmd("BufEnter", {
--  pattern = "*",
--  callback = function()
--    if vim.bo.filetype == "oil" then
--      vim.opt.guifont = "JetBrainsMonoNL Nerd Font:h16"  -- Reset to your default font size
--    else
--      vim.opt.guifont = "JetBrainsMonoNL Nerd Font:h12"  -- Reset to your default font size
--    end
--  end,
--})
