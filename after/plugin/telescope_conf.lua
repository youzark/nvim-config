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


local silent={silent=true,noremap=true}
-- telescope
vim.api.nvim_set_keymap('n','<leader>h','<cmd>lua require("telescope.builtin").help_tags()<cr>',silent)
vim.api.nvim_set_keymap('n','?','<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>',silent) -- press <c-/>
vim.api.nvim_set_keymap('n','gf','<cmd>call youzark#change_cwd()<cr>,w<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>',{})
-- -- telescope coc
-- vim.api.nvim_set_keymap('n','gd','<cmd>Telescope coc definitions<cr>',silent)
-- vim.api.nvim_set_keymap('n','gi','<cmd>Telescope coc implementations<cr>',silent)
-- vim.api.nvim_set_keymap('n','gr','<cmd>Telescope coc references<cr>',silent)
