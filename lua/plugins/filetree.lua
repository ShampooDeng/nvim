return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	keys = {
		{ "<leader>e",  "<cmd>Neotree<cr>",        desc = "NeoTree" },
		{ "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "<T>oggle Neo<T>ree" }
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		close_if_last_window = true,
		action = "focus",
		source = "filesystem",
		position = "left",
		toggle = true,
		reveal = false,
		enable_diagnostics = true,
		enable_git_status = true,
		window = {
			position = "left",
			width = 23,
		}
	}
}
