local has_whitespace_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return true
    end
    local line = vim.api.nvim_get_current_line()
    --This checks whether the character at col is whitespace and if it is returns false
    return line:sub(col, col):match("%s") ~= nil
end

return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "none",
            ["<Tab>"] = {
                function(cmp)
                    if has_whitespace_before() then
                        return false
                    end
                    if cmp.is_menu_visible() then
                        return cmp.select_next()
                    end
                    return cmp.show_and_insert()
                end,
                "fallback",
            },

            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        return cmp.select_prev()
                    end
                end,
                "fallback",
            },
            -- ["<Esc>"] = {
            --     function(cmp)
            --         cmp.cancel()
            --         -- vim.cmd("stopinsert")
            --         return false
            --     end,
            --     "fallback",
            -- },
            ["<Space>"] = { "accept", "fallback" },
            ["<Esc>"] = { "cancel", "fallback" },
            -- ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
            -- ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true },
            menu = {
                auto_show = false,
                draw = { columns = { { "kind" }, { "label", "label_description", "source_name", gap = 1 } } },
            },
            list = { selection = { preselect = false, auto_insert = true } },
        },

        default = { "lsp", "path", "snippets", "buffer" },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
