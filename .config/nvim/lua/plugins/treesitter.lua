require('nvim-treesitter.configs').setup {
	ensure_installed = { 
		"c", 
		"lua", 
		"vim", 
		"qmljs",
		"vimdoc", 
		"query", 
		"markdown", 
		"markdown_inline" 
	},

	sync_install = false,

	auto_install = true,

	ignore_install = { "javascript" },

	highlight = {
		enable = true,
	},
}
