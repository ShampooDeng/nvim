local function config_lsp_keybinding()
	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			local opts = { buffer = event.buf }
			vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			vim.keymap.set({ 'n', 'i' }, "<C-'>", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			-- vim.keymap.set({'n','i'}, 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
			vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

			vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
			vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
			vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		end
	})
end

local function config_lsp_server()
	require("plugins.lsp.lua")
end

local function lsp_zero_config()
	-- Config lsp_zero_config
	local lsp = require('lsp-zero').preset({
		manage_nvim_cmp = {
			-- Add extra mappings for going to snippet place holder
			-- and disable <Tab>&<S-Tab> introduced by extra mappings
			-- in Autocompletion.lua
			set_extra_mappings = true,
		}
	})

	-- lsp.on_attach(function(client, bufnr)
	-- 	-- see :help lsp-zero-keybinding to learn the available actions
	-- 	lsp.default_keymaps({ buffer = bufnr })
	-- end)

	-- (Optional) Configure lua language server for neovim
	-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
	config_lsp_server()
	lsp.setup()

	-- Override settings of nvim-cmp configed by lsp-zero
	require("plugins.autocompletion").config()

	-- Lsp keybindings:
	config_lsp_keybinding()
	-- Note: More keybindings related to lsp can be found in
	-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md
end

local function config_neodev()
	require("neodev").setup({
		-- use default settings.
		library = {
			enable = true,
			runtime = true,
			types = true,
			plugins = true,
		},
	})
end

return {
	PLUGIN_PROXY .. "VonHeikemen/lsp-zero.nvim",
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' }, -- Required
		{              -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.api.nvim_command, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },   -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'L3MON4D3/LuaSnip' },   -- Required
		{ "folke/neodev.nvim",                config = config_neodev },
	},
	config = lsp_zero_config
}
