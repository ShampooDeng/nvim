return {
	"akinsho/bufferline.nvim",
	lazy = false,
	config  = function ()
		vim.opt.termguicolors = true
		require("bufferline").setup{
			options = {
				-- TODO
			},
			vim.keymap.set("n","gn",":BufferLineCycleNext<CR>",{silent = true}),
			vim.keymap.set("n","gp",":BufferLineCyclePrev<CR>",{silent = true}),
		}
	end
}

