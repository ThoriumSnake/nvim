--TODO add keys pressed to line
return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("lualine").setup({

            -- options = {
                --     globastatus = true,
                -- },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    -- lualine_c = { require("grapple-line").lualine },
                    -- lualine_c = { "grapple" },
                    lualine_c = {
                        { 'searchcount', maxcount = 999999, timeout = 500 },
                        { 'selectioncount' }
                    },

                    lualine_x = {
                        {
                            function()
                                return "󰛢 ".."["..require("grapple").name_or_index().."]"
                            end,
                            cond = function()
                                return package.loaded["grapple"] and require("grapple").exists()
                            end
                        },
                        {
                            require("core.grapple-line").statusline,
                        },
                    },
                    lualine_y = {'" "..tostring(vim.api.nvim_win_get_cursor(0)[1]).."/"..tostring( vim.api.nvim_buf_line_count(0) )'},
                    lualine_z = {'progress'},
                },

                inactive_sections = {
                    lualine_x = {},
                },

                -- extensions = { "oil", }

            })
        end,
    }
