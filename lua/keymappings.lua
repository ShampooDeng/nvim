-- Make sure to set `mapleader` before lazy so your mappings are correct
-- vim.g.mapleader = "\\"
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = ";",     to = ":" },
	{ from = ">",     to = ">>" },
	{ from = "<",     to = "<<" },
	{ from = "q;",     to = "q:" },
	-- { from = "J", to = "10j" },
	-- { from = "K", to = "10k" },
	-- { from = "<C-j>", to = "J", mode = mode_nv },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

-- require(md-snippets)

-- >>> Python >>>
-- Running current python file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.keymap.set({ 'n', 'i' }, '<F5>', function()
			local file_path = vim.api.nvim_buf_get_name(0)
			vim.cmd(":w")
			return "<cmd>!time python " .. file_path .. "<CR>"
		end, { expr = true })
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function ()
		-- Markdown keymap:
		-- list
		-- bold
		-- italic
		-- Auto complete next item of a list
	end
})

-- local function match_dir_name(file_path)
-- 	-- /home/shampoo/lua_missions/missions/missions.lua
-- 	local pattern = "(/[^/]+/[^/]+/)([^/]+/[^/]+/)"
-- 	local parant_dir, sub_dir = string.match(file_path, pattern)
-- 	if sub_dir == "lua_missions/missions/" then
-- 		return parant_dir .. sub_dir .. "missions.lua"
-- 	end
-- 	return file_path
-- end
-- 
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "lua",
-- 	callback = function()
-- 		-- print("entering python file")
-- 		vim.keymap.set({ 'n', 'i' }, '<F5>', function()
-- 			local file_path = vim.api.nvim_buf_get_name(0)
-- 			file_path = match_dir_name(file_path)
-- 			vim.cmd(":w")
-- 			return "<cmd>!time lua " .. file_path .. "<CR>"
-- 		end, { expr = true })
-- 	end
-- })
