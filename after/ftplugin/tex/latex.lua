vim.keymap.set("n","B","<cmd>!make<cr>",{silent = true, buffer = true})
vim.keymap.set("n","<leader>i","<cmd>lua require('screenshot.screenshot').latexTakeShotAndSave()<cr>",{silent = true, buffer = true})
