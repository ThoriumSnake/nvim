--Leader
--vim.keymap.set("n", "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = "ñ"
--vim.keymap.set("", " ", "ñ", { remap = true })

--Oil
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--Stuff that should already be there lmao
vim.keymap.set("n", "gga", "ggVG$", { desc = "Select all" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "M", "J", { desc = "Join lines" })

--LSP/Nvim-cmp
vim.keymap.set("n", "<C-Space>", "i<Cmd>lua require('cmp').complete()<CR>", { desc = "Open nvim-cmp completion menu from normal mode" })

--Convenience mappings
--Yanking/Pasting
vim.keymap.set({"n", "x"}, "<C-p>", [["+p]], { desc = "Paste from system clipboard (For neovide)" })
vim.keymap.set({"n", "x"}, "<C-y>", [["+y]], { desc = "Yank to system clipboard (For neovide)" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete and put in black hole register" })

--Move lines
vim.keymap.set({"n", "v"}, '<A-j>', ':m .+1<CR>==')
vim.keymap.set({"n", "v"}, '<A-k>', ':m .-2<CR>==')

--Substitution
vim.keymap.set("n", "<leader>s", [[:%s/]])

--Open config
vim.keymap.set("n", "<leader>co", "<CMD>cd ~/.config/nvim/<CR><CMD>edit .<CR>")

--Movement
vim.keymap.set("n", "H", "g^")
vim.keymap.set("n", "L", "g$")
--Uses gk/gj instead of j/k. But if there's a count (ex 4j) it uses j/k instead. (This helps with relative numbers as linebreak doesn't increase linecount)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, desc = "Better down" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, desc = "Better up" })

vim.keymap.set("n", "<S-Space>", "g$")
vim.keymap.set("n", "<Tab>", "h")
vim.keymap.set("n", "<S-Tab>", "g^")
