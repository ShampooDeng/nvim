return {
	PLUGIN_PROXY .. "theniceboy/joshuto.nvim",
	keys = {
		{"<leader>j"},
	},
	config = function()
		vim.keymap.set(
			"n", "<leader>j", "<cmd>Joshuto<cr>", {silent = true}
		)
	end
}
