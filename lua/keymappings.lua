-- Make sure to set `mapleader` before lazy so your mappings are correct
-- vim.g.mapleader = "\\"
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = ";",  to = ":" },
	{ from = ">",  to = ">>" },
	{ from = "<",  to = "<<" },
	{ from = "q;", to = "q:" },
	-- { from = "J", to = "10j" },
	-- { from = "K", to = "10k" },
	-- { from = "<C-j>", to = "J", mode = mode_nv },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
