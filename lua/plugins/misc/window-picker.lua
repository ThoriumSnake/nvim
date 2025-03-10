return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    -- event = "VeryLazy",
    version = "2.*",
    keys = {
        {
            "<Space><Space>",
            function()
                local picked_window_id = require("window-picker").pick_window()
                if picked_window_id then
                    vim.api.nvim_set_current_win(picked_window_id)
                end
            end,
            desc = "Open window picker",
        },
    },
    config = function()
        require("window-picker").setup({
            hint = "floating-big-letter",
            -- selection_chars = "FJDKSLA;CMRUEIWOQP",
            -- selection_chars = "1234HJKL567890",
            -- selection_chars = "JKLÑ´ç1234567890",
            -- selection_chars = "JKLÑABCD",
            selection_chars = "JKLASDFGH1234567890",

            filter_rules = {
                bo = {
                    filetype = { "fidget", "incline", "neo-tree", "neo-tree-popup", "notify" },
                },
            },
        })
    end,
}
