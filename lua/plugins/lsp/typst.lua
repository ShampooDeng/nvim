return {
	require("lspconfig")["tinymist"].setup {
		-- see https://github.com/neovim/neovim/issues/30675
		-- and https://github.com/Myriad-Dreamin/tinymist/issues/766
		offset_encoding = "utf-8",
		settings = {
			formatterMode = "typstyle",
			exportPdf = "onType",
			semanticTokens = "disable"
		}
	}
}
