return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                              , branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons'
	},
	config = function ()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		local function my_help_tag()
			builtin.help_tags({
				-- More details can be found in telescope's wiki
				-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md#replacing-actions
				attach_mappings = function (prompt_bufnr, _)
					actions.select_default:replace(function ()
						actions.select_vertical({prompt_bufnr})
					end)
					return true
				end
			})
		end

		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', my_help_tag, {})
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
