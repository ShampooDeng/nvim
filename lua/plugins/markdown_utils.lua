return {
	{
		"roodolv/markdown-toggle.nvim",
		config = function()
			require("markdown-toggle").setup({
				use_default_keymaps = true,
			})
			-- Default keymap
			-- opts.expr = true -- required for dot-repeat in Normal mode
			-- vim.keymap.set("n", "<C-q>", toggle.quote_dot, opts)
			-- vim.keymap.set("n", "<C-l>", toggle.list_dot, opts)
			-- vim.keymap.set("n", "<Leader><C-l>", toggle.list_cycle_dot, opts)
			-- vim.keymap.set("n", "<C-n>", toggle.olist_dot, opts)
			-- vim.keymap.set("n", "<M-x>", toggle.checkbox_dot, opts)
			-- vim.keymap.set("n", "<Leader><M-x>", toggle.checkbox_cycle_dot, opts)
			-- vim.keymap.set("n", "<C-h>", toggle.heading_dot, opts)
			--
			-- opts.expr = false -- required for Visual mode
			-- vim.keymap.set("x", "<C-q>", toggle.quote, opts)
			-- vim.keymap.set("x", "<C-l>", toggle.list, opts)
			-- vim.keymap.set("x", "<Leader><C-l>", toggle.list_cycle, opts)
			-- vim.keymap.set("x", "<C-n>", toggle.olist, opts)
			-- vim.keymap.set("x", "<M-x>", toggle.checkbox, opts)
			-- vim.keymap.set("x", "<Leader><M-x>", toggle.checkbox_cycle, opts)
			-- vim.keymap.set("x", "<C-h>", toggle.heading, opts)
		end,
	},
	{
		'antonk52/markdowny.nvim',
		config = function ()
			require('markdowny').setup()
			-- Default keymap
			-- vim.keymap.set('v', '<C-b>', ":lua require('markdowny').bold()<cr>", { buffer = 0 })
			-- vim.keymap.set('v', '<C-i>', ":lua require('markdowny').italic()<cr>", { buffer = 0 })
			-- vim.keymap.set('v', '<C-k>', ":lua require('markdowny').link()<cr>", { buffer = 0 })
			-- vim.keymap.set('v', '<C-e>', ":lua require('markdowny').code()<cr>", { buffer = 0 })
		end
	}
}
