return {
	{
		'stevearc/oil.nvim',
		enabled = true,
        lazy = false,
		opts = {
			-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
			-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
			default_file_explorer = true,

			-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
			delete_to_trash = true,

            keymaps = {
        ["<Space>"] = {
            "actions.select",
            mode = "n",
            nowait = true,
        },
            },

			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				-- This function defines what is considered a "hidden" file
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, ".git")
				end,
				-- Sort file names in a more intuitive order for humans. Is less performant,
				-- so you may want to set to false if you work with large directories.
				natural_order = true,
				-- Sort file and directory names case insensitive
				case_insensitive = false,
				sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},

			-- Configuration for the floating window in oil.open_float
			float = {
				-- Padding around the floating window
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "right",
			},
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		--dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}

--Translation of WTF is going on here: Basically, this is the SAME THING as the typical way of having a plugin file for lazy
--except that instead of doing THAT mfers decided to be fancy.
--@type: Doesn't do anything, it's just for IDE completion and whatnot
--local spec: Basically it's a table. The first item has an integer key by default, the other items (spec.lazy, spec.event, etc) have string keys
--All of this is returned like in a normal plugin file, except it's dumb

-----@type LazySpec
--local spec = { 'stevearc/oil.nvim' }
--
--spec.lazy = not require('utils.common').argv_contains('oil-ssh://')
--
--spec.event = 'VeryLazy'
--
----local map = require('utils.lazy').generate_map('', 'Oil: ')
----spec.keys = {
	----	map('gX', 'n', '<CMD>Oil<CR>', 'Open'),
	----}
	--
	--spec.init = function()
		--	vim.g.loaded_netrwPlugin = 1
		--end
		--
		--spec.opts = function()
			--	local hiddens = { '.DS_Store', '.git', '.gitmodules', 'node_modules' }
			--
			--	return {
				--		delete_to_trash = true,
				--		skip_confirm_for_simple_edits = false,
				--		cleanup_delay_ms = 1000,
				--		keymaps = {
					--			['g?'] = 'actions.show_help',
					--			['<CR>'] = 'actions.select',
					--			['<C-s>'] = 'actions.select_vsplit',
					--			['g<C-s>'] = 'actions.select_split',
					--			['K'] = 'actions.preview',
					--			['<C-c>'] = 'actions.close',
					--			['<C-l>'] = 'actions.refresh',
					--			['-'] = 'actions.parent',
					--			['+'] = 'actions.open_cwd',
					--			['_'] = 'actions.cd',
					--			['`'] = 'actions.change_sort',
					--			['gx'] = 'actions.open_external',
					--			['g.'] = 'actions.toggle_hidden',
					--			['g\\'] = 'actions.toggle_trash',
					--		},
					--		use_default_keymaps = false,
					--		view_options = {
						--			show_hidden = true,
						--			is_always_hidden = function(name, _)
							--				return vim.list_contains(hiddens, name)
							--			end,
							--		},
							--	}
							--end
							--
							----spec.specs = { 'nvim-tree/nvim-web-devicons' }
							--spec.specs = { "echasnovski/mini.icons", opts = {} }
							--
							--return spec

