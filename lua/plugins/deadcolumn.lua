local linewidth_configs = {
	-- filetype, width
	{'pyton', 79},
}

local function setup_colorcolumn_per_filetype(type, width)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = type,
		callback = function ()
			vim.opt_local.colorcolumn = {width}
		end
	})
end

local function colorcolumn_per_filetype()
	for _, lw_config in ipairs(linewidth_configs) do
		setup_colorcolumn_per_filetype(lw_config[1], lw_config[2])
	end
end

return {
	'Bekaboo/deadcolumn.nvim',
	config = function ()
		vim.opt.colorcolumn = {80}
		colorcolumn_per_filetype()
		require("deadcolumn").setup({
			scope = "line"
		})
	end
}
