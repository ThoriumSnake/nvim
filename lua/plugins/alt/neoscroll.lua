return {
    "karb94/neoscroll.nvim",
    enabled = vim.g.neovide == nil,
    config = function ()
        local neoscroll = require('neoscroll')
        neoscroll.setup()

        local keymap = {
            ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 175 }) end;
            ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 175 }) end;

            ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 175 }) end;
            ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 175 }) end;

            ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 20 }) end;
            ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 20 }) end;
        }
        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end
}
