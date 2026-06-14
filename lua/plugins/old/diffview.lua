return {
    "sindrets/diffview.nvim",

    dependencies = { "echasnovski/mini.icons" },
    enabled = false,
    config = function()
        --Required for mini.icons to work without explicit plugin compatability
        require("mini.icons").setup()
        MiniIcons.mock_nvim_web_devicons()
    end,
}
