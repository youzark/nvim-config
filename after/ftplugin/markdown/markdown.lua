local screenshot = require("screenshot.screenshot")
vim.keymap.set("n","<leader>i",screenshot.markdownTakeShotAndSave,{silent = true})

