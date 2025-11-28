-- Command: :TSActiveParsers
-- Description: Prints all active Treesitter parsers (root + injected) for the current buffer

local M = {}

function M.show_active_parsers()
    local bufnr = vim.api.nvim_get_current_buf()
    local ok, parser = pcall(vim.treesitter.get_parser, bufnr)

    if not ok or not parser then
        vim.notify("❌ No Treesitter parser is active for this buffer", vim.log.levels.WARN)
        return
    end

    -- Collect info
    local parsers = { parser:lang() }
    for _, child in ipairs(parser:children()) do
        table.insert(parsers, child:lang())
    end

    -- Display
    vim.notify("🌳 Active Treesitter parsers:\n  - " .. table.concat(parsers, "\n  - "))
end

-- Create Neovim command
vim.api.nvim_create_user_command("TSActiveParsers", function()
    M.show_active_parsers()
end, { desc = "Show active Treesitter parsers for current buffer" })

return M
