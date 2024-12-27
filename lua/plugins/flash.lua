return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
    { "<leader>t", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     { "<leader><leader>", mode = { "n", "x", "o" },
--     function() require("flash").jump({
--         pattern = ".", -- initialize pattern with any char
--         search = {
--             mode = function(pattern)
--                 -- remove leading dot
--                 if pattern:sub(1, 1) == "." then
--                     pattern = pattern:sub(2)
--                 end
--                 -- return word pattern and proper skip pattern
--                 return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
--             end,
--         },
--         -- select the range
--         jump = { pos = "range" },
--     })
-- end,
-- desc = "Flash jump" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
