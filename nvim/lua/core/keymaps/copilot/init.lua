-- Configura el atajo de teclado para aceptar sugerencias.
vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
