return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason.nvim", lazy = false, config = true },
        { "williamboman/mason-lspconfig.nvim" },
        { "VonHeikemen/lsp-zero.nvim", branch = "v4.x", lazy = true, config = false },
    },
    config = function()
        -- note: diagnostics are not exclusive to lsp servers
        -- so these can be global keybindings
        vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
        vim.keymap.set("n", "<A-S-d>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
        vim.keymap.set("n", "<A-d>", "<cmd>lua vim.diagnostic.goto_next()<cr>")

        ---- BASIC SETUP ----
        local lsp_zero = require("lsp-zero")

        -- lsp_attach is where you enable features that only work
        -- if there is a language server active in the file
        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end

        lsp_zero.extend_lspconfig({
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        ---- BASIC SETUP ----

        vim.diagnostic.config({
            -- update_in_insert = true,
            severity_sort = true,

            float = {
                focusable = false,
                source = "always",
                header = "",
                -- prefix = "",
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

                linehl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
                    [vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
                    [vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
                    [vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
                },
            },
        })

        ---- LANGUAGE SETUP ----
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                ts_ls = function()
                    local mason_registry = require("mason-registry")
                    local vue_language_server_path = mason_registry
                        .get_package("vue-language-server")
                        :get_install_path() .. "/node_modules/@vue/language-server"

                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup({
                        init_options = {
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    location = vue_language_server_path,
                                    -- languages = { "javascript", "typescript", "vue" },
                                    languages = { "vue" },
                                },
                            },
                        },
                        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    })
                    -- No need to set `hybridMode` to `true` as it's the default value
                    -- lspconfig.volar.setup({})
                end,
            },
        })
    end,
}
