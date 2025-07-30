return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<m-f>", "<cmd>lua require('fzf-lua').grep_cword()<CR>",  { silent = true } },
		{ "<c-f>", "<cmd>lua require('fzf-lua').grep_curbuf()<CR>", { silent = true } },
		-- BUG: There maybe a bug with grep_lcurbuf and live_grep. When
		-- search a string in regex model and switch to fuzzy to refine
		-- result, fzf_lua shows "IO error on operation on ..." and rg
		-- shows "unable to stat file rg"
		{ "<c-f>", "<cmd>lua require('fzf-lua').grep_visual()<CR>", mode = { "v" },   { silent = true } },
		{ "<m-f>", "<cmd>lua require('fzf-lua').grep_cword()<CR>",  mode = { "v" },   { silent = true } },
		{ "<c-b>", "<cmd>lua require('fzf-lua').builtin()<CR>",     { silent = true } },
	}
}
