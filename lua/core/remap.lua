---- LEADER ----
vim.g.mapleader = "ñ"

---- OIL ----
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

---- STUFF THAT SHOULD ALREADY BE THERE LMAO ----
vim.keymap.set("n", "<A-a>", "ggVG$", { desc = "Select all" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "U", { desc = "Undo line" })

---- LSP/NVIM-CMP ----
vim.keymap.set(
    "n",
    "<Tab>",
    "i<Cmd>lua require('cmp').complete()<CR>",
    { desc = "Open nvim-cmp completion menu from normal mode" }
)

-- vim.keymap.set("i", "<Tab>", function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--     if cmp.visible() then
--         cmp.select_next_item()
--     elseif luasnip.locally_jumpable(1) then
--         luasnip.jump(1)
--     else
--         cmp.complete()
--         --     fallback()
--     end
-- end, { desc = "Open nvim-cmp completion menu from normal mode", nowait = true })

---- CONVENIENCE MAPPINGS ----
---- YANKING/PASTING ----
vim.keymap.set({ "n", "x" }, "<C-p>", [["+p]], { desc = "Paste from system clipboard (For neovide)" })
vim.keymap.set({ "n", "x" }, "<C-y>", [["+y]], { desc = "Yank to system clipboard (For neovide)" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete and put in black hole register" })

---- MOVE LINES ----
-- vim.keymap.set({"n", "v"}, '<A-j>', ':m .+1<CR>==')
-- vim.keymap.set({"n", "v"}, '<A-k>', ':m .-2<CR>==')

---- SUBSTITUTION ----
vim.keymap.set("n", "<leader>s", [[:%s/]])

---- OPEN CONFIG ----
-- vim.keymap.set("n", "<leader>co", "<CMD>cd ~/.config/nvim/<CR><CMD>edit .<CR>")

---- MOVEMENT ----
vim.keymap.set({ "n", "v" }, "H", "g^")
vim.keymap.set({ "n", "v" }, "L", "g$")

--Uses gk/gj instead of j/k. But if there's a count (ex 4j) it uses j/k instead. (This helps with relative numbers as linebreak doesn't increase linecount)
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, desc = "Better down" })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, desc = "Better up" })

-- vim.keymap.set({ "n", "v" }, "<S-Space>", "g$")
-- vim.keymap.set({"n", "v"}, "<Tab>", "h")
-- vim.keymap.set({"n", "v"}, "<S-Tab>", "g^")
--Doing this to fix CTRL-I being overriden (May only work in neovide)
vim.keymap.set("n", "<C-i>", "<Tab>")

---- MISC PROGRAMMING ----
vim.keymap.set({ "n", "v" }, "<leader>qf", "<CMD>lua vim.diagnostic.setqflist()<CR>")
vim.keymap.set("n", "<leader>z", "<CMD>ZenMode<CR>", { desc = "Zen mode toggle" })

vim.keymap.set({ "n", "v" }, "<", "<<")
vim.keymap.set({ "n", "v" }, ">", ">>")

---- WINDOW MOVEMENT ----
--ctrl + j ctrl + k ctrl + h, etc
-- vim.keymap.set({ "n", "v" }, "<Space><Space>", "<C-w>w")
vim.keymap.set({ "n", "v" }, "<Space>h", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<Space>j", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<Space>k", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<Space>l", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<Space>n", "<CMD>tabnext<CR>")
vim.keymap.set({ "n", "v" }, "<Space>p", "<CMD>tabprevious<CR>")
vim.keymap.set({ "n", "v" }, "<Space>t", "<CMD>tabnew<CR>")
vim.keymap.set({ "n", "v" }, "<Space>w", "<CMD>tabclose<CR>")
