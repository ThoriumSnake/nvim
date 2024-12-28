return {
    "folke/zen-mode.nvim",
    -- lazy = "VeryLazy",
    -- keys = {
    --     "<leader>lol", "<CMD>ZenMode<CR>", desc = "Zen mode toggle"
    -- },
    opts = {
        on_open = function(win)
            require("incline").toggle()
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
            require("incline").toggle()
        end,
    }
}
