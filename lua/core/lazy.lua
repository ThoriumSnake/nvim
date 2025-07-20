-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--Setup lazy.nvim
if vim.g.vscode then
    require("lazy").setup({
        spec = {
            --NOTE No clue whether this is related to loading order. It PROBABLY joins the lists of plugins and uses the set priority for it.
            -- { import = "plugins.colorschemes" },
            -- { import = "plugins" },
            -- { import = "plugins.misc" },
            -- { import = "lsp" },
        },

        ui = {
            border = "rounded",
        },

        change_detection = {
            notify = false,
        },
    })
else
    require("lazy").setup({
        spec = {
            --NOTE No clue whether this is related to loading order. It PROBABLY joins the lists of plugins and uses the set priority for it.
            { import = "plugins.colorschemes" },
            { import = "plugins" },
            { import = "plugins.misc" },
            { import = "lsp" },
        },

        ui = {
            border = "rounded",
        },

        change_detection = {
            notify = false,
        },
    })
end
