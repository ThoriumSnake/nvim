return  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_style = "andromeda"
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        -- vim.g.sonokai_enable_italic = true
    end
}
