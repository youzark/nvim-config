-- Used for unstandard input method: when Esc is pressed to exit Insert Mode, automatically
-- turn back to Ascii keyboard layout
vim.api.nvim_create_autocmd("InsertLeave",{
	pattern = {"*.md","*.txt","*.cpp","*.tex"},
	callback = function() os.execute("fcitx-remote -s fcitx-keyboard-us") end,
})

-- local project = require("project.environment")
-- vim.api.nvim_create_autocmd("BufEnter",{
--     callback = project.setEnv,
-- })
