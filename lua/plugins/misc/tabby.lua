return {
    "nanozuki/tabby.nvim",
    config = function()
        local theme = {
            fill = "TabLineFill",
            current_tab = "TabLineSel",
            tab = "TabLine",
            line_sep = "Cursor",
        }

        require("tabby.tabline").set(function(line)
            vim.keymap.set("n", "<leader><leader>", "<CMD>Tabby jump_to_tab<CR>")
            vim.keymap.set("n", "<Space>f", "<CMD>Tabby pick_window<CR>")
            return {
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.tab

                    -- this plugin uses the background color of the highlight groups as the foreground of the symbol for the separators
                    local left_sep

                    if tab.is_current() then
                        left_sep = line.sep("▎", theme.line_sep, theme.current_tab)
                    else
                        left_sep = line.sep("▎", theme.fill, theme.fill)
                    end

                    return {
                        tab.in_jump_mode() and "" or left_sep,
                        tab.in_jump_mode() and tab.jump_key() or tab.number(),
                        tab.name(),
                        line.sep(tab.current_win().file_icon() .. "  ", theme.line_sep, hl),
                        hl = hl,
                        margin = " ",
                    }
                end),
                hl = theme.fill,
            }
        end)
    end,
}
