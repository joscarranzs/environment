-- Mapear <Leader>o para insertar una nueva línea limpia debajo sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>o", "o<Esc>0D",{noremap = true, silent = true})

-- Mapear <Leader>O para insertar una nueva línea limpia arriba sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>O", "O<Esc>0D",{noremap = true, silent = true})
