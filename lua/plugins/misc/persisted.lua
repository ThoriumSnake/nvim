return {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = function()
        local persisted = require("persisted")
        local utils = require("persisted.utils")
        local allowed_dirs = {
            "~/code",
            "~/.config/nvim",
        }

        persisted.setup({
            -- autostart = false,
            autoload = true,
            on_autoload_no_session = function()
                vim.notify("No session????")
            end,

            should_save = function()
                return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
            end,

            allowed_dirs = allowed_dirs,

            ignored_dirs = {
                { "/", exact = true },
            --     { "/tmp", exact = true },
            --     { "~", exact = true },
            --     { "~/Desktop", exact = true },
            --     "/run/media",
            --     "~/.local/share/Steam",
            --     "~/.cache",
            --     "~/Vaults",
            },
        })
        require("telescope").load_extension("persisted")

        vim.keymap.set("n", "<C-s>", "<CMD>Telescope persisted<CR>")
    end,
}
