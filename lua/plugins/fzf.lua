return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- keys = {
	-- 	{ "<C-f>", mode = { "x", "n" } },
	-- },
	config = function()
		require("fzf-lua").setup({})

		-- vim.keymap.set("n", "<C-f>", function()
		-- 	fzf.grep({ search = "", fzf_opts = { ['--layout'] = 'default' } })
		-- end)
		-- vim.keymap.set("x", "<C-f>", function()
		-- 	fzf.grep_visual({ fzf_opts = { ['--layout'] = 'default' } })
		-- end)
		vim.keymap.set("n", "<m-f>", "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
		vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').grep_curbuf()<CR>", { silent = true })
		-- BUG: There maybe a bug with grep_lcurbuf and live_grep. When
		-- search a string in regex model and switch to fuzzy to refine
		-- result, fzf_lua shows "IO error on operation on ..." and rg
		-- shows "unable to stat file rg"
		vim.keymap.set("v", "<c-f>", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { silent = true })
		vim.keymap.set("v", "<m-f>", "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
		vim.keymap.set("n", "<c-b>", "<cmd>lua require('fzf-lua').builtin()<CR>", { silent = true })
	end
}
