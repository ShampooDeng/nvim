return {
	'stevearc/aerial.nvim',
	lazy = false,
	keys = {
		{ '<leader>o', '<cmd>AerialToggle!<CR>', desc = 'Toggle Aerial Outline while cursor stays in current window' },
	},
	opts = {
		layout = {
			placement = 'edge',
			attach_mode = 'global',
			width = 23,
			min_width = 20
		},
		on_attach = function(bufnr)
			local aerial = require('aerial')
			local auto_open = vim.api.nvim_buf_line_count(bufnr) > 20
				and aerial.num_symbols(bufnr) > 0
				and not aerial.was_closed()
			-- Override auto-opening behavior
			if auto_open then
				aerial.open({
					focus = false,
				})
			end
		end,
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	}
}
