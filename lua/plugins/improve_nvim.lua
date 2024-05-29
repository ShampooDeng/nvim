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
		config = function()
			require("mini.comment").setup()
		end
	},
	{
		'echasnovski/mini.jump',
		version = false,
		config = function()
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
		config = function()
			require("hlsearch").setup()
		end

	},
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		denpendencies = { "lewis6991/gitsigns.nvim" },
		config = function()
			require("scrollbar").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes herpe
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "]t", function()
			  require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
			  require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			-- -- You can also specify a list of valid jump keywords
			-- vim.keymap.set("n", "]t", function()
			--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
			-- end, { desc = "Next error/warning todo comment" })
		end
	},
}
