return {
	'stevearc/aerial.nvim',
	lazy = false,
	keys = {
		{ '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'Toggle Aerial Outline' },
	},
	opts = {
		layout = {
			placement = 'edge',
			attach_mode = 'global',
			width = 23,
			min_width = 20
		},
		on_attach = function()
			require('aerial').open({
				focus = false,
				direction = 'right',
			})
		end,
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
}
