--TODO add keys pressed to line
return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("lualine").setup({

            options = {
                -- globastatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                -- lualine_c = { require("grapple-line").lualine },
                -- lualine_c = { "grapple" },
                lualine_c = {
                    {
                        "filename",
                        symbols = {
                            modified = "󰛓󰛓󰛓", -- Text to show when the file is modified.
                            readonly = "[readonly]", -- Text to show when the file is non-modifiable or readonly.
                            unnamed = "[No File]", -- Text to show for unnamed buffers.
                            newfile = "[New]", -- Text to show for newly created file before first write
                        },
                    },
                },

                -- lualine_x = {
                --     {
                --         function()
                --             return "󰛢 ".."["..require("grapple").name_or_index().."]"
                --         end,
                --         cond = function()
                --             return package.loaded["grapple"] and require("grapple").exists()
                --         end
                --     },
                --     {
                --         require("core.grapple-line").statusline,
                --     },
                -- },
                lualine_x = {
                    { "searchcount", maxcount = 999999, timeout = 500 },
                    { "selectioncount" },
                },
                lualine_y = {
                    '" "..tostring(vim.api.nvim_win_get_cursor(0)[1]).."/"..tostring( vim.api.nvim_buf_line_count(0) )',
                },
                lualine_z = { "progress" },
            },

            inactive_sections = {
                -- lualine_x = {},
            },

            -- extensions = { "oil", }
        })
    end,
}
