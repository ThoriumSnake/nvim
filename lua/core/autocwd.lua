-- local utils = require("utils.common")
-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = function()
--         local path = vim.fn.expand("%:p")
--         vim.notify(path)
--         path = utils.unoil(path)
--         if vim.fn.isdirectory(path) == 1 then
--             vim.cmd("cd " .. path)
--         end
--     end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
    end,
})
