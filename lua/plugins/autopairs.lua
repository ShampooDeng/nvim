return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {}, -- this is equalent to setup({}) function
	config = function()
		-- To overide default keymaps
		local Rule = require("nvim-autopairs.rule")
		local Cond = require("nvim-autopairs.conds")
		local npairs = require('nvim-autopairs')
		npairs.setup({
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			disable_in_macro = true, -- disable when recording or executing a macro
			disable_in_visualblock = false, -- disable when insert after visual block mode
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			enable_moveright = true,
			enable_afterquote = true, -- add bracket pairs after quote
			enable_check_bracket_line = true, --- check bracket in same line
			enable_bracket_in_quote = true, --
			enable_abbr = false, -- trigger abbreviation
			break_undo = true, -- switch for basic rule break undo sequence
			check_ts = false,
			map_cr = true,
			map_bs = true, -- map the <BS> key
			map_c_h = true, -- Map the <C-h> key to delete a pair
			map_c_w = true, -- map <c-w> to delete a pair if possible
		})

		npairs.add_rules({
			Rule("<", ">", "rust")
			    :with_pair(Cond.not_before_text(' '))
			    :with_pair(Cond.before_regex('.*'))
			    :with_move(Cond.after_text('>'))
		})
	end
}
