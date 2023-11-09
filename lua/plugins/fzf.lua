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
		vim.keymap.set("n", "<c-p>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
		vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { silent = true })
		vim.keymap.set("n", "<c-l>", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
		vim.keymap.set("v", "<c-f>", "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
		vim.keymap.set({"n","v","x"}, ":", "<cmd>lua require('fzf-lua').commands()<CR>", { silent = true })
		vim.keymap.set("n", "<c-b>", "<cmd>lua require('fzf-lua').builtin()<CR>", { silent = true })
	end
}
