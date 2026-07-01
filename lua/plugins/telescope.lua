return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local tsbuiltin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", tsbuiltin.find_files, {})
        vim.keymap.set("n", "<leader>fg", tsbuiltin.git_files, {})
        vim.keymap.set("n", "<leader>fs", tsbuiltin.live_grep, {})

        require("telescope").setup({
            -- pickers = {
            --     find_files = {
            --         hidden = true,
            --     },
            -- },
            -- file_ignore_patterns = { "node%_modules/.*" },

            defaults = {
                file_ignore_patterns = { "node%_modules/.*" },
                layout_strategy = "horizontal",
                layout_config = {
                    --width = 0.8
                    preview_cutoff = 1,
                    --preview_width = 0.5,
                },
            },
        })
    end,
}
