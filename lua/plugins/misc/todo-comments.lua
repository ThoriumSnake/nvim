return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        },

        search = {
            pattern = [[\b(KEYWORDS)(\s|:)]], -- match without the extra colon. You'll likely get false positives
        },
    }
}
