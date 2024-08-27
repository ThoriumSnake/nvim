vim.g.mapleader = " "
vim.keymap.set("", "ñ", " ", { remap = true })

vim.keymap.set("n", "<leader>p", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit buffer" })
vim.keymap.set("n", "<leader>qa", "<CMD>qa<CR>", { desc = "Close all buffers" })

vim.keymap.set("", "<leader>w", "<CMD>w<CR>", { desc = "Write buffer" })
vim.keymap.set("", "<C-S>", "<CMD>w<CR>", { desc = "Write buffer" })

vim.keymap.set("n", "<C-A>", "ggVG$", { desc = "Select all" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

--Uses gk/gj instead of j/k. But if there's a count (ex 4j) it uses j/k instead. (This helps with relative numbers as linebreak doesn't increase linecount)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, desc = "Better down" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, desc = "Better up" })
