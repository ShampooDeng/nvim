return {
	PLUGIN_PROXY .. "theniceboy/joshuto.nvim",
	keys = {
		{ "<leader>j" },
	},
	config = function()
		vim.keymap.set(
			"n", "<leader>j", function()
				vim.cmd([[lua require('joshuto').joshuto({edit_in_tab = true})]])
			end, { silent = true }
		)
	end
}
