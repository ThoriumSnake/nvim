return {
    "rcarriga/nvim-notify",
    enabled = false,
    config = function()
        vim.notify = require("notify")
        require("notify").setup({
            max_width = 80,
            render = "compact",
            stages = "slide",
            fps = 60,
            top_down = false,
        })
    end,
}
