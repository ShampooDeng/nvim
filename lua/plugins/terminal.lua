local M = {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},

	{
		"willothy/flatten.nvim",
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
		opts = {
			window = {
				open = "alternate",
			},
			one_per = {
				kitty = true,
			}
		}
	},
}

local function set_term_keymap()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-w>l', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>H', [[<Cmd>wincmd H<CR>]], opts)
	vim.keymap.set('t', '<C-w>J', [[<Cmd>wincmd J<CR>]], opts)
	vim.keymap.set('t', '<C-w>K', [[<Cmd>wincmd K<CR>]], opts)
	vim.keymap.set('t', '<C-w>L', [[<Cmd>wincmd L<CR>]], opts)
	-- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local function set_size(term)
	if term.direction == "horizontal" then
		return 10
	elseif term.direction == "vertical" then
		return vim.o.columns * 0.4
	end
end

M[1].config = function()
	require("toggleterm").setup({
		size = set_size,
		open_mapping = [[<C-\>]],
		on_open = set_term_keymap,
		-- direction = "vertical",
		direction = "horizontal",
		close_on_exit = true,
	})
	-- TODO: try float terminal
end

return M

-- >>> The older version of terminal.lua
-- return {
-- 	"s1n7ax/nvim-terminal",
-- 	config = function()
-- 		vim.o.hidden = true
-- 		require('nvim-terminal').setup()
--
-- 		-- auto toggle insert mode
-- 		local Terminal = require("nvim-terminal.terminal")
-- 		function Terminal:my_toggle()
-- 			self.last_term = self.last_term and self.last_term or 1
-- 			local opened = self.window:is_valid()
--
-- 			if opened then
-- 				self:close()
-- 			else
-- 				self:open(self.last_term)
-- 				vim.cmd(":startinsert")
-- 			end
-- 		end
-- 		-- vim.api.nvim_create_autocmd("TermOpen", {
-- 		-- 	callback = function()
-- 		-- 		vim.cmd(":startinsert")
-- 		-- 	end
-- 		-- })
--
-- 		local silent = { silent = true }
-- 		vim.keymap.set({ "n", "t" }, "<C-`>", '<cmd>lua NTGlobal["terminal"]:my_toggle()<cr>', silent)
-- 		-- vim.keymap.set({ "t" }, "<esc>", '<c-\\><c-n>', silent)
-- 		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", '<c-\\><c-n>', silent)
-- 	end
-- }
