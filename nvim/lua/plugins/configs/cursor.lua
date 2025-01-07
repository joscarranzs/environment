-- File: nvim/lua/plugins/configs/cursor.lua

return {
    "terryma/vim-multiple-cursors", -- The plugin you want to install

    -- You can add additional configurations here if needed
    config = function()
        vim.g.VM_maps = {
            ["Find Under"] = "<C-n>", -- Selects the next occurrence using Ctrl+n
            ["Find Subword Under"] = "<C-n>", -- Selects the next subword occurrence using Ctrl+n
            ["Select All"] = "<C-A-n>", -- Selects all occurrences using Ctrl+Alt+n
            ["Skip Region"] = "<C-x>", -- Skips an occurrence using Ctrl+x
            ["Remove Region"] = "<C-p>", -- Removes an occurrence using Ctrl+p
        }
    end,
}
