require("youzark")

local dapFloat = function ()
    local dapui = require("dapui")
    local stack = dapui.elements.stack
    print(vim.inspect(stack))
    dapui.register_element("myStack",stack)
    dapui.float_element("myStack")
end

local dapClose = function ()
    local dapui = require("dapui")
    dapui.close()
end

vim.api.nvim_create_user_command("TestDapuiClose",dapClose,{})
vim.api.nvim_create_user_command("TestDapui",dapFloat,{})

