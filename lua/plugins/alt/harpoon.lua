return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<A-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "-", function() harpoon:list():prev() end)
        vim.keymap.set("n", "+", function() harpoon:list():next() end)

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-s>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<Space>", function()
                    harpoon.ui:select_menu_item()
                end, { buffer = cx.bufnr })
            end,
        })
    end
}
