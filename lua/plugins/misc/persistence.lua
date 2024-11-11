return {
    "folke/persistence.nvim",
    enabled = false,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    },
    config = function()
        local pers = require("persistence")
        pers.setup()
        vim.keymap.set("n", "<C-s>", function()
            pers.select()
        end)
    end,
}
