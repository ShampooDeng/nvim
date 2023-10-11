local opt = vim.opt

opt.syntax = "on"
opt.number = true
opt.relativenumber = true
-- Tabs behavior
opt.smartindent = true
opt.autoindent = true
opt.shiftwidth = 8
opt.tabstop = 8
-- Search pattern
opt.ignorecase = true
opt.smartcase = true
-- Others
-- TODO: Shared clipboard through nvim instances.
opt.clipboard:append({"unnamedplus"})
opt.ttimeoutlen = 100
