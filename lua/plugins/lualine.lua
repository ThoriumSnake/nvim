--TODO add keys pressed to line

--Doing this bizarre function because for some reason section separators have a different color with neovide transparency?? no idea why
local function neovide_section_separators()
    if vim.g.neovide then
        if vim.g.neovide_opacity < 1 then
            return { left = " ", right = " " }
        end
    end
    return { left = "", right = "" }
end
return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        --Required for mini.icons to work without explicit plugin compatability
        require("mini.icons").setup()
        MiniIcons.mock_nvim_web_devicons()
        require("lualine").setup({

            options = {
                -- theme = "falcon",
                globastatus = false,
                component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                section_separators = neovide_section_separators(),
            },

            inactive_winbar = {
                lualine_a = {
                    {
                        "filename",
                        symbols = {
                            modified = "󰛓󰛓󰛓", -- Text to show when the file is modified.
                            readonly = "[readonly]", -- Text to show when the file is non-modifiable or readonly.
                            unnamed = "[No File]", -- Text to show for unnamed buffers.
                            newfile = "[New]", -- Text to show for newly created file before first write
                        },
                        separator = "",
                    },
                    { "filetype", icon_only = true },
                },
            },

            sections = {
                lualine_a = { "mode" },
                -- lualine_c = { require("grapple-line").lualine },
                -- lualine_c = { "grapple" },
                lualine_b = {
                    {
                        "filename",
                        symbols = {
                            modified = "󰛓󰛓󰛓", -- Text to show when the file is modified.
                            readonly = "[readonly]", -- Text to show when the file is non-modifiable or readonly.
                            unnamed = "[No File]", -- Text to show for unnamed buffers.
                            newfile = "[New]", -- Text to show for newly created file before first write
                        },
                        separator = "",
                    },
                    { "filetype", icon_only = true },
                },
                lualine_c = { "branch", "diff", "diagnostics" },

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

            extensions = { "oil" },
        })
    end,
}
