local localTest = require("cmake.localTest")

vim.api.nvim_buf_create_user_command(0,"CreateLocalTest","lua require('cmake.localTest').createLocalTestFile()",{} )
vim.keymap.set("n","<leader>t",":wa<cr><cmd>CreateLocalTest<CR><cmd>terminal sh ./test.sh<cr>i")
vim.keymap.set("n","<leader>m",":wa<cr>:!make<cr>:!./test<cr>")
