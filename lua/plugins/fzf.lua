return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{"<C-f>", mode = {"x","n"}},
	},
	config = function()
		local fzf = require("fzf-lua")

		vim.keymap.set("n", "<C-f>", function()
			fzf.grep({ search = "", fzf_opts = { ['--layout'] = 'default' } })
		end)
		vim.keymap.set("x", "<C-f>", function()
			fzf.grep_visual({ fzf_opts = { ['--layout'] = 'default' } })
		end)

		fzf.setup({})
	end
}
