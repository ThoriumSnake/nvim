return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_c = {},
            },
        })
    end,
}
