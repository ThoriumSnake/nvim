return {
    'echasnovski/mini.notify',
    enabled = false,
    version = false,
    config = function()
        require("mini.notify").setup({
            window ={
                winblend = 0,
            },
        })
        vim.notify = require('mini.notify').make_notify()
    end
}
