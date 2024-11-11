return {

    {
        "echasnovski/mini.cursorword",
        --NOTE make sure this plugin loads after the colorschemes and after Themery, otherwise setting the colorscheme will replace the MiniCursorword highlight
        lazy = false,
        version = false,
        config = function()
            require("mini.cursorword").setup()
            vim.api.nvim_set_hl(0, "MiniCursorword", { underline = true })
            vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "MiniCursorword" })
        end,
    },

    { "echasnovski/mini.base16", version = false },

    {
        "echasnovski/mini.move",
        version = false,
        config = function()
            require("mini.move").setup({
                {
                    -- Module mappings. Use `''` (empty string) to disable one.
                    mappings = {
                        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                        left = "<A-h>",
                        right = "<A-l>",
                        down = "<A-j>",
                        up = "<A-k>",

                        -- Move current line in Normal mode
                        line_left = "<A-h>",
                        line_right = "<A-l>",
                        line_down = "<A-j>",
                        line_up = "<A-k>",
                    },
                },
            })
        end,
    },

    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup()
        end,
    },
}
