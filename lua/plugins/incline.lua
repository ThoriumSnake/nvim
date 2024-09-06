return {
    'b0o/incline.nvim',
    -- Optional: Lazy load Incline
    -- lazy = false,
    -- event = 'VeryLazy',
    dependencies = { "echasnovski/mini.icons" },

    config = function()
        local helpers = require('incline.helpers')
        -- local devicons = require('nvim-web-devicons')
        local mini_icons = require('mini.icons')

        require('incline').setup({
            window = {
                padding = 0,
                margin = { horizontal = 0 },
            },
            render = function(props)
                local full_path = vim.api.nvim_buf_get_name(props.buf)
                --Comparing to 1 to check if pattern is at start of string
                local oil = string.find(full_path, "oil://", 1, true) == 1
                local filename = vim.fn.fnamemodify(full_path, ':t')

                if filename == '' then
                    filename = '[Untitled]'
                end
                if oil then
                    --7 is start of actual path without "oil://"
                    filename = string.sub(full_path, 7)
                end

                --Using full path instead of filename as it avoids errors with oil
                local ft_icon, hl_name = mini_icons.get("file", full_path)
                local hl_group = vim.api.nvim_get_hl(0, { name = hl_name })
                --Doing this since with some colorschemes it just links to another hl group
                hl_group = hl_group.fg == nil and vim.api.nvim_get_hl(0, { name = hl_group.link }) or hl_group

                local decimal_color = hl_group.fg
                local ft_color = string.format("#%06x", decimal_color)
                local modified = vim.bo[props.buf].modified
                local modified_symbol = modified and ' 󰛓󰛓󰛓' or ''
                -- local modified_symbol = modified and (math.random() > 0.5 and '󰛓󰛓󰛓' or '󰛓') or ''
                -- local modified_symbol = modified and ' [+]' or ''

                return {
                    ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
                    ' ',
                    { filename .. modified_symbol, gui = modified and 'bold,italic' or 'bold' },
                    ' ',
                    guibg = '#44406e',
                }
            end,
        })
    end,
}
