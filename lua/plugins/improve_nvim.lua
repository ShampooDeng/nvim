return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		'echasnovski/mini.comment',
		version = false,
		config = function ()
			require("mini.comment").setup()
		end
	},
	{
		'echasnovski/mini.jump',
		version = false,
		config = function ()
			require("mini.jump").setup({
				mappings = {
					forward = 'f',
					backward = 'F',
					forward_till = 't',
					backward_till = 'T',
					repeat_jump = '',
				},
			})
		end
	},
	{
		"nvimdev/hlsearch.nvim",
		event = "BufRead",
		config = function ()
			require("hlsearch").setup()
		end

	}
}
