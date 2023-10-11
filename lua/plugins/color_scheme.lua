return {
	PLUGIN_PROXY .. "sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- Configure colorscheme
		if vim.fn.has("termguicolors") then
			vim.opt.termguicolors = true
		end
		vim.opt.background = "dark"
		vim.g.everforest_background = "medium"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_transparent_background = 2
		vim.cmd.colorscheme("everforest")
	end,
}
