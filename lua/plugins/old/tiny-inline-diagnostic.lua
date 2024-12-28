return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    enabled = false,
    --Decided to not use this, doesn't work THAT well
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "ghost",
            options = {
                multilines = true,
                format = function(diagnostic)
                    return "aaaaaaaaaaaa"
                end,
                -- show_all_diags_on_cursorline = true,
                -- break_line = {
                --     enabled = true,
                --     after = 25,
                -- },
                -- overflow = {
                --     mode = "none",
                -- },
            },
        })
    end,
}
