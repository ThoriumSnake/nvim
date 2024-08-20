local tsbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tsbuiltin.find_files, {})
vim.keymap.set("n", "<C-p>", tsbuiltin.git_files, {})
vim.keymap.set('n', '<leader>fs', function ()
	tsbuiltin.grep_string({ search = vim.fn.input("Grep > ") });
end)
