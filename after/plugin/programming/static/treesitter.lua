require('nvim-treesitter.configs').setup{
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true
	},
	indent = {
		enable = true,
		disable = {"yaml"}
	},
	textobjects = {
		enable = true
	}
}
require("nvim-treesitter.install").prefer_git = true
