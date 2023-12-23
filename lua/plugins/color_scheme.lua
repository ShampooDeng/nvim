local M = {}

M.everforest = {
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
	end,
}

M.gruvbox_baby = {
	"luisiacc/gruvbox-baby",
	branch = "main",
	lazy = false,
	priority = 1000,
	config = function ()
		vim.g.gruvbox_baby_background_color = "medium"
		-- Each highlight group must follow the structure:
		-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
		-- See also :h highlight-guifg
		local colors = require("gruvbox-baby.colors").config()
		-- vim.g.gruvbox_baby_highlights = {Comment = {fg = colors.milk, bg = "None"}}

		-- Enable telescope theme
		vim.g.gruvbox_baby_telescope_theme = 1

		-- Enable transparent mode
		vim.g.gruvbox_baby_transparent_mode = 0

		-- Load the colorscheme
		vim.cmd[[colorscheme gruvbox-baby]]
	end
}

M.gruvbox = {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function ()
		vim.o.background = "dark"
		vim.cmd[[colorscheme gruvbox]]
	end
}

M.evaglion = {
	"nyngwang/nvimgelion",
	priority = 1000,
	config = function ()
		vim.cmd[[colorscheme nvimgelion]]
	end
}

return M
