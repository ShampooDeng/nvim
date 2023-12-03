return {
	'ShampooDeng/rust-tools.nvim',
	dependencies={
		'neovim/nvim-lspconfig',
		-- Debuging
		'nvim-lua/plenary.nvim',
		'mfussenegger/nvim-dap',
	},
	config = function ()
		local rs = require('rust-tools')
		rs.setup()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rust",
			callback = function()
				vim.keymap.set('n','<leader>b', '<cmd>RustLastRun<cr>')
				vim.keymap.set('n','<leader>B', '<cmd>RustRunnables<cr>')
			end
		})
	end
}

-- return{
-- 	'mrcjkb/rustaceanvim',
-- 	version = '^3', -- Recommended
-- 	ft = { 'rust' },
-- }
