local oil = require('utils.common').argv_contains('oil://')

return {
	'rmagatti/auto-session',
	lazy = false,
	dependencies = {
		'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
	},

	opts = {
		bypass_session_save_file_types = { 'oil' },

		no_restore_cmds = {
			function()
				if require('utils.common').argv_contains('oil://') then
					print("Oil argument detected!")
					vim.cmd.SessionRestore()
				else
					print("Oil is not in argv, this is probably a normal file. Not restoring session with hook.")
				end
			end
		},
	}
}

