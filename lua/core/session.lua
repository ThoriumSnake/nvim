--This is specifically made for Outline.nvim and uses persisted.nvim to scrub the buffers but should work with other plugin windows
vim.api.nvim_create_autocmd("User", {
    pattern = "PersistedSavePre",
    callback = function()
        local exclude_buftypes = {
            -- "help",
            -- "nofile",
            -- "terminal",
            -- "prompt",
            -- "quickfix",
        }

        local exclude_filetypes = {
            "Outline",
            -- "neo-tree",
            -- "NvimTree",
            -- "TelescopePrompt",
            -- "lazy",
            -- "mason",
            -- "alpha",
        }

        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(bufnr) then
                local bt = vim.bo[bufnr].buftype
                local ft = vim.bo[bufnr].filetype

                if vim.tbl_contains(exclude_buftypes, bt) or vim.tbl_contains(exclude_filetypes, ft) then
                    vim.api.nvim_buf_delete(bufnr, { force = true })
                end
            end
        end
    end,
})
