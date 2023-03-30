vim.keymap.set("n","B","<cmd>!make<cr>",{silent = true, buffer = true})
vim.keymap.set("n","<leader>","<cmd>lua require('screenshot.screenshot').latexTakeShotAndSave()<cr>",{silent = true, buffer = true})
