vim.g.mapleader = " "
vim.keymap.set("", "ñ", " ", { remap = true })

vim.keymap.set("n", "<leader>p", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>q", "<CMD>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>qa", "<CMD>qa<CR>", { desc = "Close all buffers" })

vim.keymap.set("", "<leader>w", "<CMD>w<CR>", { desc = "Write buffer" })
vim.keymap.set("", "<C-S>", "<CMD>w<CR>", { desc = "Write buffer" })

vim.keymap.set("n", "<C-A>", "ggVG$", { desc = "Select all" })
