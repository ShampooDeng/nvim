return {
	'notjedi/nvim-rooter.lua',
	opts = {
		rooter_patterns = { '.git', '.hg', '.svn' },
		trigger_patterns = { '*' },
		manual = false,
		fallback_to_parent = false,
	}
}
