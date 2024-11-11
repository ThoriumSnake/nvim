return {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = function()
        require("persisted").setup({
            autoload = true,
            on_autoload_no_session = function()
                -- print("No session????")
                vim.notify("No session????")
            end,

            ignored_dirs = {
                { "/", exact = true },
                { "/tmp", exact = true },
                { "~", exact = true },
            },
        })
        require("telescope").load_extension("persisted")

        vim.keymap.set("n", "<C-s>", "<CMD>Telescope persisted<CR>")
    end,
}
