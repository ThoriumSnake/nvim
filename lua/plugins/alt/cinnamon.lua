return {
    "declancm/cinnamon.nvim",
    enabled = false,
    version = "*", -- use latest release
    opts = {
        -- change default options here
    },
    config = function()
        require("cinnamon").setup {
            mode = "cursor",
            delay = 999,

            max_delta = {
                time = 1000,
            },
            -- Enable all provided keymaps
            keymaps = {
                basic = true,
                extra = true,
            },
            -- Only scroll the window
        }
    end
}
