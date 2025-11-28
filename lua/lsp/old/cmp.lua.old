local utils = require("utils.common")

local function is_in_start_tag()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()
    if not node then
        return false
    end
    local node_to_check = { "start_tag", "self_closing_tag", "directive_attribute" }
    return vim.tbl_contains(node_to_check, node:type())
end

local cmpFilterVue = function(entry, ctx)
    -- Check if the buffer type is 'vue'
    if ctx.filetype ~= "vue" then
        return true
    end

    -- Use a buffer-local variable to cache the result of the Treesitter check
    local bufnr = ctx.bufnr
    local cached_is_in_start_tag = vim.b[bufnr]._vue_ts_cached_is_in_start_tag
    if cached_is_in_start_tag == nil then
        vim.b[bufnr]._vue_ts_cached_is_in_start_tag = is_in_start_tag()
    end
    -- If not in start tag, return true
    if vim.b[bufnr]._vue_ts_cached_is_in_start_tag == false then
        return true
    end

    local cursor_before_line = ctx.cursor_before_line
    -- For events
    if cursor_before_line:sub(-1) == "@" then
        return entry.completion_item.label:match("^@")
    -- For props also exclude events with `:on-` prefix
    elseif cursor_before_line:sub(-1) == ":" then
        return entry.completion_item.label:match("^:") and not entry.completion_item.label:match("^:on%-")
    else
        return true
    end
end

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            preselect = "item",
            completion = {
                autocomplete = false,
                completeopt = "menu,menuone,noinsert",
            },

            mapping = {
                ["k"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["j"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<Space>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                -- ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                -- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        if utils.cantab() then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                --To close menu without exiting insert
                -- ["<Esc>"] = function(fallback)
                --     if cmp.visible() then
                --         cmp.close()
                --     else
                --         fallback() -- This will pass the key to Neovim if the completion menu is not visible.
                --     end
                -- end,
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp", entry_filter = cmpFilterVue },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            }),

            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },
        })
    end,
}
