return {
	"drop-stones/im-switch.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	opts = {
		set_default_im_events = {
			"VimEnter", "InsertLeave", "CmdlineLeave"
		},
		windows = {
			enabled = true,
		},
		linux = {
			enabled = true,
			-- default_im = "xkb:us::eng",
			-- obtain_im_command = { "ibus", "engine" },
			-- set_im_command = { "ibus", "engine" },
			default_im = "keyboard-us",
			obtain_im_command = { "fcitx5-remote", "-n" },
			set_im_command = { "fcitx5-remote", "-s" },
		},
	}
	-- "Kicamon/im-switch.nvim",
	-- config = function()
	-- 	require("im-switch").setup({
	-- 		txt = {
	-- 			'*.txt',
	-- 			'*.md',
	-- 		},
	-- 		code = {},
	-- 		-- en = "fcitx5-remote -c",
	-- 		-- zh = "fcitx5-remote -o",
	-- 		-- check = "fcitx5-remote",
	-- 		en = "ibus engine xkb:us::eng",
	-- 		zh = "ibus engine rime",
	-- 		check = "ibus engine",
	-- 	})
	-- end
}
