local options = {
	cmdheight = 2,
	relativenumber = true,
	ignorecase = true,
	incsearch = true,
	nu = true,
	hidden = true,
	swapfile = false,
	foldenable = false,
	termguicolors = true,
	undofile = true,
	icon = true,
	compatible = false,
	hlsearch = false,
	foldmethod = "indent",
	foldnestmax =2,
	signcolumn ="yes",
	tabstop =4,
	shiftwidth = 4,
	scrolloff = 20,
	background = "dark",
	encoding = "utf-8",
	updatetime = 50,
	runtimepath = vim.opt.runtimepath["_value"] .. ",~/.fzf",
	shortmess = vim.opt.shortmess["_value"] .. "c",
	clipboard = "unnamedplus",
	colorcolumn = "80",
	expandtab = true,
    autochdir = true,
}


for key,val in pairs(options) do
	vim.opt[key] = val
end
