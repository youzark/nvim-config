#!/usr/bin/env lua
vim.keymap.set('n', 'C',"<cmd>wall<cr>:lua require('cpp.debugger').runLocalTest()<CR>" , { buffer = true })
vim.keymap.set('n', 'b', ":lua require('dap').toggle_breakpoint()<CR>", { buffer = true })
vim.keymap.set('n', 'R', ":lua require('dap').run_last()<CR>", { buffer = true })
vim.keymap.set('n', '<leader>cc', function ()
    require("dap").terminate({},{ terminateDebuggee = true },function ()
        require("dapui").close()
        os.execute("rm " .. vim.fn.getcwd() .. "/__debug")
        vim.api.nvim_buf_del_keymap(0,"n","n")
        vim.api.nvim_buf_del_keymap(0,"n","s")
        vim.api.nvim_buf_del_keymap(0,"n","S")
    end)
end,{buffer = true})

vim.keymap.set('n', '<space>h', function ()
    local dapui = require("dapui")
    dapui.register_element("stack",{id = "stack", point = 0.5})
    dapui.float_element("stack")
end,{ buffer = true })


local dap = require("dap")
dap.listeners.after.event_initialized["setKey"] = function()
    vim.keymap.set('n', 's', ":lua require('dap').step_into()<CR>", { })
    vim.keymap.set('n', 'S', ":lua require('dap').step_out()<CR>", {  })
    vim.keymap.set('n', 'n', ":lua require('dap').step_over()<CR>", { })
end

dap.listeners.before.event_exit["dapui_config"] = function()
    os.execute("rm " .. vim.fn.getcwd() .. "/__debug")
    vim.api.nvim_buf_del_keymap(0,"n","n")
    vim.api.nvim_buf_del_keymap(0,"n","s")
    vim.api.nvim_buf_del_keymap(0,"n","S")
end
