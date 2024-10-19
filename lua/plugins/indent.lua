return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		-- vim.opt.termguicolors = true

		-- vim.opt.list = true
		-- vim.opt.listchars:append "space:⋅"
		-- require("ibl").setup{
		-- 	space_char_blankline = " ",
		-- 	show_current_context = false,
		-- 	show_current_context_start = true,
		-- 	context_char = '┃'
		-- }
		local highlight = { "Green" }
		local hooks = require "ibl.hooks"
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Green", { fg = "#98C379" })
		end)
		require("ibl").setup {
			scope = {
				enabled = true,
				-- char = "┃",
				highlight = highlight,
			},
		}
	end
}
