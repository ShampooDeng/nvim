local git_plugins = {}

git_plugins.gitsigns = {
	"lewis6991/gitsigns.nvim",
	keys = {
		{ "[c",    "<cmd>lua require'gitsigns'.prev_hunk()<CR>",    desc = "Previous Git Hunk" },
		{ "]c",    "<cmd>lua require'gitsigns'.next_hunk()<CR>",    desc = "Next Git Hunk" },
		{ "<c-.>", "<cmd>lua require'gitsigns'.preview_hunk()<CR>", desc = "Preview Git Hunk" }
	},
}

git_plugins.lazygit = {
	"kdheepak/lazygit.nvim",
	keys = {
		{ "<Leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" }
	},
}

return git_plugins
