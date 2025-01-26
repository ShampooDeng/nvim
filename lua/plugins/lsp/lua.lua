return {
	require("lspconfig")["lua_ls"].setup {
		settings = {
			Lua = {
				runtime = {
					-- version = "LuaJIT",
					version = "Lua 5.4",
					path = {
						"?.lua",
						"?/init.lua",
						vim.fn.expand("~/.luarocks/share/lua/5.4/?/?.lua"),
						vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
						"/usr/share/lua/5.4/?.lua",
						"/usr/share/lua/5.4/?/init.lua",
					}
				},
				diagnostics = {
					globals = { "vim" }
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.fn.expand("~/.luarocks/share/lua/5.4"),
						"/usr/share/lua/5.4"
					}
				},
				completion = {
					enable = true,
					callSnippet = "Disable"
				},
				hint = {
					enable = true
				}
			},
		}
	}
}
