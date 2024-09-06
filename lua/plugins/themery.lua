return { "zaldih/themery.nvim",
lazy = false,
config = function()
    -- Minimal config
    require("themery").setup({
        themes = {"catppuccin", "cyberdream", "edge", "everforest", "flow", "fluoromachine", "gruvbox-material", "kanagawa-dragon", "kanagawa-paper", "duskfox", "nordic", "oxocarbon", "rose-pine", "sonokai", "tokyodark", "tokyonight-storm" }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
    })
end,
}
