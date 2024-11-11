return{
    'mvllow/modes.nvim',
    dependencies = { 'nvim-lualine/lualine.nvim', },
    enabled = false,
    config = function()

        local background = vim.api.nvim_get_hl(0, {name = "Normal"}).bg
        local lualine_hl = vim.api.nvim_get_hl(0, {name = "lualine_a_insert"})
        local insert = lualine_hl.bg == background and lualine_hl.fg or lualine_hl.bg
        print(insert)
        insert = string.format("#%06x", insert)

        require('modes').setup({
            colors = {
                copy = "#f5c359",
                delete = "#f75c6a",
                insert = insert,
                visual = "#9745be",
            },
        })

    end,
}
