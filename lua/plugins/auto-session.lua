return {
    'rmagatti/auto-session',
    enabled = true,
    lazy = false,
    dependencies = {
        'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },

    --NOTE: For SOME reason you HAVE to run setup manually with auto-session, idk if this is a new bug or what
    config = function()

        require("auto-session").setup({
            --Bit of a misnomer I think. Disabling this so that if neovim is not explicitly passed a directory, it will not attempt to restore a session for the cwd.
            auto_restore = false,
            suppressed_dirs = { '~/', '~/Downloads', '/' },
            --DO NOT ENABLE THIS. This WILL disable saving on ALL files if oil is enabled
            --bypass_session_save_file_types = { 'oil' },

            --log_level = "debug",
            bypass_save_filetypes = { 'alpha', 'dashboard' }, -- or whatever dashboard you use

            args_allow_files_auto_save = function()
                --DO NOT PUT THIS OUTSIDE OF THIS FUNTION. Shit's wack and the function will be run before oil is loaded
                local oil = require('utils.common').argv_contains('oil://')
                return oil
            end,

            no_restore_cmds = {
                function()
                    --DO NOT PUT THIS OUTSIDE OF THIS FUNTION. Shit's wack and the function will be run before oil is loaded
                    local oil = require('utils.common').argv_contains('oil://')

                    if oil then
                        print("Oil argument detected!")
                        vim.cmd.SessionRestore()
                    else
                        print("Oil is not in argv, this is probably a normal file. Not restoring session with hook.")
                    end
                end
            },

            session_lens = {
                -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
                load_on_setup = true,
                previewer = false,
                mappings = {
                    vim.keymap.set("n", "<C-s>", "<CMD>SessionSearch<CR>")
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    --delete_session = { "i", "<C-D>" },
                    --alternate_session = { "i", "<C-S>" },
                },
                -- Can also set some Telescope picker options
                theme_conf = {
                    border = true,
                     layout_config = {
                           width = 0.8, -- Can set width and height as percent of window
                           height = 0.5,
                         },
                    },
                },

            })

        end,
    }

