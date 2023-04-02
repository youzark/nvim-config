require('telescope').setup
{
	defaults =
	{
		prompt_prefix = "$ ",
		border = true,
		dynamic_preview_title = true,
		layout_stategy="horizontal"
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

pcall(require('telescope').load_extension,'fzf')
