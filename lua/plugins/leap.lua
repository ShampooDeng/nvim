return {
	PLUGIN_PROXY .. "ggandor/leap.nvim",
	dependencies = "VonHeikemen/lsp-zero.nvim",
	keys = {"s",'s',"x",'X'},
	config = function()
		require("leap").add_default_mappings()

		-- Custom keymapping
		vim.keymap.del({"n","x","o"}, "gs")
		vim.keymap.set({"n","x","o"}, "<Leader>s", "<Plug>(leap-from-window)")
	end
}
