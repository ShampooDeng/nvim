return {
	{
		"akinsho/bufferline.nvim",
		lazy   = false,
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup {
				options = {
					mode = "tabs",
					-- TODO
					diagnostics = "nvim_lsp",
					-- check help for more infomation
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end
				},
				-- Jump betweene buffers can use <C-i>,<C-o>
				-- Check `help jumplist` for more details.
				vim.keymap.set("n", "gn", ":BufferLineCycleNext<CR>", { silent = true }),
				vim.keymap.set("n", "gp", ":BufferLineCyclePrev<CR>", { silent = true }),
			}
		end
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				}
			})
		end
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = { "SmiteshP/nvim-navic" },
		config = function()
			vim.opt.updatetime = 200
			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				"BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end
	}
}
