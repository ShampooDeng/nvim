-- Config github proxy with global variabel plugin_proxy
PLUGIN_PROXY = ""
-- local plugin_proxy = "https://hub.fgit.ml/" -- Github proxy
if PLUGIN_PROXY == nil then
	PLUGIN_PROXY = "https://github.com/"
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)

-- Check if lazy.nvim is installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
-- vim.g.mapleader = " "

if vim.g.vscode then
	-- If running in VSCode extension
	require("lazy").setup({
		-- not test on vscode yet!
		require("plugins.improve_nvim"),
		require("plugins.leap"),
	})
else
	-- Running in ordinary Neovim
	require("lazy").setup({
		require("plugins.improve_nvim"),
		require("plugins.smartselection"),
		require("plugins.leap"),
		require("plugins.color_scheme").gruvbox,
		require("plugins.statusline"),
		require("plugins.tabline"),
		require("plugins.joshuto"),
		require("plugins.autopairs"),
		require("plugins.autocompletion").install,
		require("plugins.lspconf"),
		require("plugins.treesitter"),
		require("plugins.tabout"), -- Tabout should be loaded after autocompletion.
		require("plugins.git").gitsigns,
		require("plugins.git").lazygit,
		require("plugins.indent"),
		require("plugins.fzf"),
		require("plugins.rust_tools"),
		require("plugins.telescope"),
		require("plugins.rooter"),
		require("plugins.deadcolumn"),
		require("plugins.im_switch"),
		require("plugins.terminal"),
	})
end
