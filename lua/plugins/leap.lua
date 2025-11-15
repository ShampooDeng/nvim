return {
	PLUGIN_PROXY .. "ggandor/leap.nvim",
	dependencies = "VonHeikemen/lsp-zero.nvim",
	keys = {"s",'S'},
	config = function()
		vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
		vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
	end
}
