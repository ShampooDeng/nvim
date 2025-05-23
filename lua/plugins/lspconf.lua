local function config_lsp_keybinding()
	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'LSP actions',
		callback = function(event)
			local opts = { buffer = event.buf }
			-- lsp keymapping
			vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			-- vim.keymap.set({ 'n', 'i' }, "<M-'>", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			vim.keymap.set({ 'n', 'i' }, "<c-'>", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
			vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

			-- diagnostic keymapping
			vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
			vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
			vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		end
	})
end

local function load_lsp_config()
	require("plugins.lsp")
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

local function config_mason()
	require("mason").setup({
		github = {
			---@since 1.0.0
			-- The template URL to use when downloading assets from GitHub.
			-- The placeholders are the following (in order):
			-- 1. The repository (e.g. "rust-lang/rust-analyzer")
			-- 2. The release version (e.g. "v0.3.0")
			-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
			download_url_template = "https://github.com/%s/releases/download/%s/%s",
			-- download_url_template = "https://mirror.ghproxy.com/https://github.com/%s/releases/download/%s/%s",
		},
	})
end

local function config_mason_lspcfg()
	require("mason-lspconfig").setup({
		automatic_installation = {},
		ensure_installed = {"lua_ls"},
	})
end

local function config()
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
	load_lsp_config()
	lsp.setup()

	-- Override settings of nvim-cmp configed by lsp-zero
	require("plugins.autocompletion").config()

	-- Lsp keybindings:
	config_lsp_keybinding()
	-- Note: More keybindings related to lsp can be found in
	-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md
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
			config = config_mason,
		},
		{
			'williamboman/mason-lspconfig.nvim',
			config = config_mason_lspcfg,
		},            -- Optional
		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' }, -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'L3MON4D3/LuaSnip' }, -- Required
		{ "folke/neodev.nvim",    config = config_neodev },
	},
	config = config
}
