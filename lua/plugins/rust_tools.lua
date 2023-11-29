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
	end
}

-- return{
-- 	'mrcjkb/rustaceanvim',
-- 	version = '^3', -- Recommended
-- 	ft = { 'rust' },
-- }
