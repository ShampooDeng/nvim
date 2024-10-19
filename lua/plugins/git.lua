local git_plugins = {}

git_plugins.gitsigns = {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup {
			on_attach = function(bufnr)
				-- Setup keymaps
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[g",
					'<cmd>lua require"gitsigns".prev_hunk()<CR>', {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "]g",
					'<cmd>lua require"gitsigns".next_hunk()<CR>', {})
			end
		}
	end
}

git_plugins.lazygit = {
	"kdheepak/lazygit.nvim",
	keys = {
		{ "<Leader>g" }
	},
	config = function()
		vim.keymap.set("n", "<Leader>g", "<cmd>LazyGit<CR>", { silent = true })
	end
}

-- TODO:Add gather all plugins related to git
return git_plugins
