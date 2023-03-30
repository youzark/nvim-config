local M = {}


M.runLocalTest = function()
    local fileName = vim.api.nvim_buf_get_name(0)
    local debugFileName = vim.fn.getcwd() .. "/__debug"
    os.execute("g++ -g " .. fileName .. " -o " .. debugFileName)
    local dapConfig = {
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return debugFileName
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
            setupCommands = {
                {
                    text = '-enable-pretty-printing',
                    description = 'enable pretty printing',
                    ignoreFailures = false
                },
            },
        },
    }
    local dap = require("dap")
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = os.getenv("HOME") .. '/bin/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
    }
    dap.configurations.cpp = dapConfig
    dap.continue()
    -- os.execute("rm " .. debugFileName)
end

M.keymaps = {
    { 'n', 'C', ":lua require('dap').continue()<cr>" },
    { 'n', '<leader>i', ":lua require('dap').step_into()<CR>" },
    { 'n', '<leader>o', ":lua require('dap').step_out()<CR>" },
    { 'n', 'n', ":lua require('dap').step_over()<CR>" },
    { 'n', 'b', ":lua require('dap').toggle_breakpoint()<CR>" },
    { 'n', 'R', ":lua require('dap').run_last()<CR>" },
}

local telescope = require("telescope")
return M
