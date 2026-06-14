return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        outline_window = {
            position = "left",
            -- Percentage or integer of columns
            width = 20,

            show_numbers = false,
            show_relative_numbers = true,
            wrap = false,
        },
    },
}
