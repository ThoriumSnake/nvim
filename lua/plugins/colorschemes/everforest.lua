return {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    -- dependencies = { "echasnovski/mini.cursorword" },
    config = function()
        vim.g.everforest_background = "hard"
        vim.g.everforest_dim_inactive_windows = 1
        -- vim.api.nvim_set_hl(0, "MiniCursorword", { underline = true })
        -- vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "MiniCursorword" })
    end,
}
