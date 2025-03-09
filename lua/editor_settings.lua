local opt = vim.opt

opt.syntax = "on"
opt.number = true
opt.relativenumber = true
-- Tabs behavior
opt.smartindent = true
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
-- Search pattern
opt.ignorecase = true
opt.smartcase = true
-- Others
opt.clipboard:append({ "unnamedplus" })
opt.ttimeoutlen = 100


vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local file_type, _ = vim.filetype.match({ buf = 0 })
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local nvim_version = vim.version()
		if client ~= nil and client.server_capabilities.inlayHintProvider and nvim_version.minor >= 10 then
			vim.keymap.set(
				{ "n" },
				"<leader>k",
				"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>"
			)
			vim.api.nvim_cmd({
				cmd = 'lua',
				args = { "vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())" }
			}, {})
		end
	end
})
