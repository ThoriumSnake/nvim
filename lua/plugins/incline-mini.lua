--Alternatively swap the file in alt/ to use nvim-web-devicons, that plugin seems more reliable with incline/different color schemes
return {
    "b0o/incline.nvim",
    -- Optional: Lazy load Incline
    -- lazy = false,
    -- event = 'VeryLazy',
    dependencies = { "echasnovski/mini.icons" },

    config = function()
        local helpers = require("incline.helpers")
        -- local devicons = require('nvim-web-devicons')
        local mini_icons = require("mini.icons")

        require("incline").setup({
            window = {
                padding = 0,
                margin = { horizontal = 0, vertical = 0 },
                -- overlap = {
                --     borders = true,
                --     winbar = true,
                --     tabline = true,
                --     statusline = true,
                -- }
            },

            hide = {
                cursorline = true,
            },

            render = function(props)
                local full_path = vim.api.nvim_buf_get_name(props.buf)
                --Comparing to 1 to check if pattern is at start of string
                local oil = string.find(full_path, "oil://", 1, true) == 1
                local filename = vim.fn.fnamemodify(full_path, ":t")

                --Using full path instead of filename as it avoids errors with oil
                local ft_icon, hl_name, is_default_color = mini_icons.get("file", full_path)
                local hl_group = vim.api.nvim_get_hl(0, { name = hl_name })
                --Doing this since with some colorschemes it just links to another hl group
                hl_group = hl_group.fg == nil and vim.api.nvim_get_hl(0, { name = hl_group.link }) or hl_group

                --Default color, since some themes mess with some of the mini.icons highlights for some reason.
                local ft_color = "#e9e7fe"
                local decimal_color = hl_group.fg
                if is_default_color == false then
                    ft_color = string.format("#%06x", decimal_color)
                end

                local modified = vim.bo[props.buf].modified
                local modified_symbol = modified and " 󰛓󰛓󰛓" or ""

                if filename == "" then
                    filename = "[Untitled]"
                end
                if oil then
                    --7 is start of actual path without "oil://"
                    ft_color = "#9ece6a"
                    filename = string.sub(full_path, 7)
                end

                return {
                    ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
                    " ",
                    { filename .. modified_symbol, gui = modified and "bold,italic" or "bold" },
                    " ",
                    guibg = "#44406e",
                }
            end,
        })
    end,
}
