return {
    "smoka7/hop.nvim",
    version = "*",
    -- enabled = false,
    config = function()
        require("hop").setup({
            -- multi_windows = true,
            hl_mode = "replace",
            -- keys = "asdfghjklqwertyuiopzxcvbnm",
            keys = "asdfghjkl",
        })
        vim.keymap.set({ "n", "v" }, "S", ":HopChar1<cr>")
        -- vim.keymap.set({ "n", "v" }, "<leader><leader>", ":HopWord<cr>")
        --
        -- vim.keymap.set({ "n", "v" }, "S", function()
        --     local hop = require("hop")
        --
        --     hop.hint_camel_case({ current_line_only = true })
        -- end)

        -- vim.keymap.set({ "n", "v" }, "<leader>h", function()
        --     local hop = require("hop")
        --     local regex = require("hop.jump_regex")
        --
        --     local opts = require("utils.common").copy_table(require("hop").opts)
        --     opts.current_line_only = true
        --
        --     hop.hint_with_regex(regex.regex_by_case_searching("[=<>}{\\][)(\"']", false, opts), opts)
        -- end)
    end,
}
