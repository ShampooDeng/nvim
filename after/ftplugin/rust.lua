-- vim.keymap.set('n', '<leader>b', function()
-- 	vim.cmd.RustLsp { 'runnables' }
-- end)
vim.keymap.set('n', '<leader>b', function()
	vim.cmd.RustLsp { 'runnables', bang = true }
end)
vim.keymap.set('n', '<leader>t', function()
	vim.cmd.RustLsp { 'testables'}
end)
vim.keymap.set('n', '<leader>od', function()
	vim.cmd.RustLsp { 'openDocs'}
end)
