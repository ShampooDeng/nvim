-- vim.keymap.set('n', '<leader>b', function()
-- 	vim.cmd.RustLsp { 'runnables' }
-- end)
vim.keymap.set('n', '<leader>r', function()
	vim.cmd.RustLsp { 'runnables' }
end)
vim.keymap.set('n', '<leader>b', function()
	vim.cmd.Cargo { 'build' }
end)
vim.keymap.set('n', '<leader>t', function()
	vim.cmd.RustLsp { 'testables' }
end)
vim.keymap.set('n', '<leader>od', function()
	vim.cmd.RustLsp { 'openDocs' }
end)
