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
	},
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		-- Disable scrollbar in vscode
		cond = not vim.g.vscode,
		denpendencies = { "lewis6991/gitsigns.nvim" },
		config = function()
			require("scrollbar").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "]t",         "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next todo comment" },
			{ "[t",         "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous todo comment" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "Find todo comments" },
			-- -- You can also specify a list of valid jump keywords
			-- vim.keymap.set("n", "]t", function()
			--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
			-- end, { desc = "Next error/warning todo comment" })
		},
		opts = {
			-- your configuration comes herpe
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	}
}
