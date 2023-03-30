local M = {}

M.set_buf_keymaps = function (keymaps)
    for keymap in keymaps do
        vim.api.nvim_buf_set_keymap(keymap[1],keymap[2],keymap[3],keymap[4])
    end
end

return M
