return {
    "zaldih/themery.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Minimal config
        require("themery").setup({
            themes = {
                "catppuccin",
                "citruszest",
                "calvera",
                "cyberdream",
                "edge",
                "everforest",
                "falcon",
                "flow",
                "fluoromachine",
                "gruvbox-material",
                "kanagawa-dragon",
                "kanagawa-paper",
                "duskfox",
                "nightfly",
                "nordic",
                "oh-lucy",
                "oh-lucy-evening",
                "oldschool",
                "oxocarbon",
                "PaperColor",
                "rose-pine",
                "sonokai",
                "tokyodark",
                "tokyonight-storm",
                "tempus_future",
                "tempus_night",
                "tempus_summer",
                "tempus_winter",
                "tempus_warp",
                "minischeme",
                "minicyan",
            }, -- Your list of installed colorschemes.
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end,
}
