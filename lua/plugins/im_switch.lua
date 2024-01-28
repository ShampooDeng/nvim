return {
	"Kicamon/im-switch.nvim",
	config = function()
		require("im-switch").setup({
			txt = {
				'*.txt',
				'*.md',
			},
			code = {},
			en = "fcitx5-remote -c",
			zh = "fcitx5-remote -o",
			check = "fcitx5-remote",
		})
	end
}
