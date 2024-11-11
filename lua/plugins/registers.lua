return {
	"tversteeg/registers.nvim",
	cmd = "Registers",
	config = function()
require("registers").setup({
        -- show = "\"0123456789+-*abcdefghijklmnopqrstuvwxyz:/_=#%.",
        show = "\"0123456789+-",
        window = {
            border = "rounded",
            max_width = 300,
        }
})
    end,
	keys = {
		{ "\"",    mode = { "n", "v" } },
		{ "<C-R>", mode = "i" }
	},
	name = "registers",
}
