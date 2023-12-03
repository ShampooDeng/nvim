return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                              , branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons'
	},
	config = function ()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', ':', builtin.commands, {})
		vim.keymap.set('n', '<leader>h', builtin.command_history, {})
		vim.keymap.set('n', '<C-p>', builtin.builtin, {})
	require('telescope').setup{
		defaults = {
			mappings = {
				i = {
					-- ["q"] = require("telescope.actions").close,
				},
			}
		}
	}
	end
}
