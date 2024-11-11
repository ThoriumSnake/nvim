return {
    'b0o/incline.nvim',
    -- Optional: Lazy load Incline
    -- lazy = false,
    -- event = 'VeryLazy',
    dependencies = { "nvim-tree/nvim-web-devicons"},

    config = function()
        local helpers = require('incline.helpers')
        local devicons = require('nvim-web-devicons')

        require('incline').setup({
            window = {
                padding = 0,
                margin = { horizontal = 0 },
            },
            render = function(props)
                local full_path = vim.api.nvim_buf_get_name(props.buf)
                local filename = vim.fn.fnamemodify(full_path, ':t')
                local oil = string.find(full_path, "oil://", 1, true) == 1

                if filename == '' then
                    filename = '[Untitled]'
                end
                local ft_icon, ft_color = devicons.get_icon_color(filename)
                local modified = vim.bo[props.buf].modified

                if oil then
                    --7 is start of actual path without "oil://"
                    ft_icon = "󰉋"
                    ft_color = "#9ece6a"
                    filename = string.sub(full_path, 7)
                end

                return {
                    ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
                    ' ',
                    { filename, gui = modified and 'bold,italic' or 'bold' },
                    ' ',
                    guibg = '#44406e',
                }
            end,
        })
    end,
}
