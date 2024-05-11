vim.keymap.set({ 'n', 'i' }, '<F5>', function()
	local file_path = vim.api.nvim_buf_get_name(0)
	local cmd_name = [["python "]] .. file_path .. [[""]]
	local cmd = [["python ]] .. file_path .. [["]]
	return string.format("<cmd>TermExec cmd=%s name=%s<CR>", cmd, cmd_name)
end, { expr = true })
