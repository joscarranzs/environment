-- Siguiente buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Buffer anterior
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Ocultar buffer
vim.api.nvim_set_keymap('n', '<Leader>hb', ':lua local bufs = vim.fn.getbufinfo({bufloaded = 1}) if #bufs > 1 then vim.cmd("bdelete") else print("No se puede ocultar el último buffer visible.") end<CR>', { noremap = true, silent = true })
