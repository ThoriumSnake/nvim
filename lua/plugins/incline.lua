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
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                if filename == '' then
                    filename = '[Untitled]'
                end
                local ft_icon, hl_name = mini_icons.get("file", filename)
                print(hl_name)
                local hl_group = vim.api.nvim_get_hl(0, { name = hl_name })
                --Doing this since sometimes it just links to another hl group
                hl_group = hl_group.fg == nil and vim.api.nvim_get_hl(0, { name = hl_group.link }) or hl_group
                if(hl_group.fg == nil) then
                    vim.fn.setreg("+", require("utils.common").dump(hl_group))
                    -- require("utils.common").print_table(hl_group)
                end

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
