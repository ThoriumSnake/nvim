local oil = require('utils.common').argv_contains('oil://')

require("auto-session").setup({
	--log_level = "debug",
	bypass_session_save_file_types = { 'oil' },

	--This is more of a "just in case". Saves session even if nvim was opened with a "file argument" if either: there are at least two open buffers. Or if oil was detected in arguments (won't save otherwise)
--	args_allow_files_auto_save = function()
--		local supported = 0
--
--		local buffers = vim.api.nvim_list_bufs()
--		for _, buf in ipairs(buffers) do
--			-- Check if the buffer is valid and loaded
--			if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
--				local path = vim.api.nvim_buf_get_name(buf)
--				if vim.fn.filereadable(path) ~= 0 then supported = supported + 1 end
--			end
--		end
--
--		-- If we have more 2 or more supported buffers, save the session
--		if supported >= 2 then return true end
--		if oil == true then return true end
--
--		return false
--	end,

	--This is done because auto-session detects oil as a "file argument", meaning it doesn't need to restore session.
	no_restore_cmds = {
		function()
			if require('utils.common').argv_contains('oil://') then
				--vim.cmd("SessionRestore " + vim.fn.getcwd())
				print("Oil argument detected!")
				vim.cmd.SessionRestore()
			else
				print("Oil is not in argv, this is probably a normal file. Not restoring session with hook.")
			end
		end
	},
})
