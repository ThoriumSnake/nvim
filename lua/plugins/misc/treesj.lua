return {
    "Wansmer/treesj",
    keys = { "<leader>S", "<leader>J" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
        vim.keymap.set("n", "<leader>S", require("treesj").split)
        vim.keymap.set("n", "<leader>J", require("treesj").join)
        require("treesj").setup({
            use_default_keymaps = false,
        })
    end,
}
