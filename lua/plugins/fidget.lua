return {
    "j-hui/fidget.nvim",
    enabled = true,
    opts = {
        -- Options related to LSP progress subsystem
        progress = {
            -- Options related to how LSP progress messages are displayed as notifications
            display = {
                done_ttl = 7,               -- How long a message should persist after completion
            },
        },

        -- Options related to notification subsystem
        notification = {
            override_vim_notify = true,  -- Automatically override vim.notify() with Fidget

                window = {
                    zindex = 1000,                -- Stacking priority of the notification window
                    winblend = 10
                },

            },
        }
    }
