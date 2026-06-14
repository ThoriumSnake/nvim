local function attach_keymaps(bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

--------------------------
--------------------------

vim.lsp.enable({ "lua_ls" })

local vue_config = require("lsp.vue_config")
-- require("utils.common").print_table(vue_config)
vim.lsp.config("vtsls", vue_config.vtsls_config)
vim.lsp.config("ts_ls", vue_config.ts_ls_config)
vim.lsp.enable({ "ts_ls", "vue_ls" })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
-- vim.keymap.set("n", "`d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
-- vim.keymap.set("n", "+d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
-- vim.keymap.set("n", "<A-S-d>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
-- vim.keymap.set("n", "<A-d>", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            vim.notify("WRONG LSP CLIENT ID")
            return
        end

        -- if client:supports_method("textDocument/completion") then
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        -- end

        attach_keymaps()
    end,
})

vim.diagnostic.config({
    severity_sort = true,

    virtual_text = {
        prefix = " 󰊠",
    },

    -- virtual_lines = {
    --     prefix = " 󰊠",
    --     current_line = false,
    -- },

    float = {
        focusable = false,
        source = "if_many",
        border = "rounded",
        prefix = {
            "󰊠 ",
            "MiniIndentscopeSymbol",
        },
        -- header = "",
        severity_sort = true,
    },
    --Setting this up here since I'm also adding linehl
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },

        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
        --     [vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
        --     [vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
        --     [vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
        -- },
    },
})

vim.cmd("set completeopt+=noselect")
