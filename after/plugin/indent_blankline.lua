local exist,indent_blankline = pcall(require,'indent_blankline')
if exist then
	indent_blankline.setup {
		char = '┊',
		show_trailing_blankline_indent = false,
	}
end
