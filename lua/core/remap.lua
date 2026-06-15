---- LEADER ----
vim.g.mapleader = ";"
vim.keymap.set({ "n", "x" }, ",", ";", { noremap = true })

---- OIL ----
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

---- LSP/NVIM-CMP ----
vim.keymap.set(
    "n",
    "<Tab>",
    -- "i",
    "i<Cmd>lua require('blink.cmp').show_and_insert()<CR>",
    { desc = "Open blink.cmp completion menu from normal mode" }
)

--I have absolute no idea why it needs two <C-Space>
-- vim.keymap.set("n", "<C-Space>", function()
--     vim.cmd("startinsert")
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-Space><C-Space>", true, false, true), "i", true)
-- end, { noremap = true, desc = "Open blink.cmp completion menu from normal mode" })

---- STUFF THAT SHOULD ALREADY BE THERE LMAO ----
-- vim.keymap.set("n", "<A-a>", "ggVG$", { desc = "Select all" })
-- vim.keymap.set("n", "<leader>y", "<CMD>%y+<CR>")
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "U", { desc = "Undo line" })

---- CONVENIENCE MAPPINGS ----
---- YANKING/PASTING ----
vim.keymap.set({ "n", "x" }, "<C-p>", [["+p]], { desc = "Paste from system clipboard (For neovide)" })
vim.keymap.set({ "n", "x" }, "<C-y>", [["+y]], { desc = "Yank to system clipboard (For neovide)" })

---- SUBSTITUTION ----
-- vim.keymap.set("n", "<leader>s", [[:%s/]])

---- MOVEMENT ----
vim.keymap.set({ "n", "v" }, "$", "g$", { noremap = true })
vim.keymap.set({ "n", "v" }, "^", "g^", { noremap = true })
vim.keymap.set({ "n", "v" }, "0", "g0", { noremap = true })

vim.keymap.set({ "n", "v" }, "M", "`")
-- vim.keymap.set({ "n", "v" }, "m", "`")

--Uses gk/gj instead of j/k. But if there's a count (ex 4j) it uses j/k instead. (This helps with relative numbers as linebreak doesn't increase linecount)
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, desc = "Better down" })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, desc = "Better up" })

--Doing this to fix CTRL-I being overriden (May only work in neovide)
vim.keymap.set("n", "<C-i>", "<Tab>")

---- MISC PROGRAMMING ----
vim.keymap.set({ "n", "v" }, "<leader>qf", "<CMD>lua vim.diagnostic.setqflist()<CR>")

---- WINDOW MOVEMENT ----
--ctrl + j ctrl + k ctrl + h, etc
vim.keymap.set({ "n", "v" }, "<Space>h", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<Space>j", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<Space>k", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<Space>l", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<Space>n", "<CMD>tabnext<CR>")
vim.keymap.set({ "n", "v" }, "<Space>p", "<CMD>tabprevious<CR>")
vim.keymap.set({ "n", "v" }, "<Space>t", "<CMD>tabnew<CR>")
vim.keymap.set({ "n", "v" }, "<Space>w", "<CMD>tabclose<CR>")
