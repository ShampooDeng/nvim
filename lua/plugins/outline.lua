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
		open_automatic = function(bufnr)
			local aerial = require('aerial')
			-- Enforce a minimum line count
			return vim.api.nvim_buf_line_count(bufnr) > 80
				-- Enforce a minimum symbol count
				and aerial.num_symbols(bufnr) > 1
				-- A useful way to keep aerial closed when closed manually
				and not aerial.was_closed()
		end
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	}
}
