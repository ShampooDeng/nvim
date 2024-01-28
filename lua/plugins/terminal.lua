return {
	"s1n7ax/nvim-terminal",
	config = function()
		vim.o.hidden = true
		require('nvim-terminal').setup()

		-- auto toggle insert mode
		local Terminal = require("nvim-terminal.terminal")
		function Terminal:my_toggle()
			self.last_term = self.last_term and self.last_term or 1
			local opened = self.window:is_valid()

			if opened then
				self:close()
			else
				self:open(self.last_term)
				vim.cmd(":startinsert")
			end
		end
		-- vim.api.nvim_create_autocmd("TermOpen", {
		-- 	callback = function()
		-- 		vim.cmd(":startinsert")
		-- 	end
		-- })

		local silent = { silent = true }
		vim.keymap.set({ "n", "t" }, "<C-`>", '<cmd>lua NTGlobal["terminal"]:my_toggle()<cr>', silent)
		vim.keymap.set({ "t" }, "<esc>", '<c-\\><c-n>', silent)
	end
}
