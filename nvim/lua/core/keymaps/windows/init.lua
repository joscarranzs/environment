-- Mapeos de teclas para redimensionar ventanas más significativamente usando combinaciones con la tecla líder
vim.api.nvim_set_keymap("n", "<leader>rl", "5<C-w><",{noremap = true, silent = true})-- Redimensionar ventana hacia la izquierda más
vim.api.nvim_set_keymap("n", "<leader>rr", "5<C-w>>",{noremap = true, silent = true})-- Redimensionar ventana hacia la derecha más
vim.api.nvim_set_keymap("n", "<leader>rt", "5<C-w>+",{noremap = true, silent = true})-- Redimensionar ventana hacia arriba más
vim.api.nvim_set_keymap("n", "<leader>rd", "5<C-w>-",{noremap = true, silent = true})-- Redimensionar ventana hacia abajo más

-- Mapeos de teclas para moverse entre ventanas usando combinaciones con la tecla líder
vim.api.nvim_set_keymap("n", "<leader>ml", "<C-w>h",{noremap = true, silent = true})-- Moverse a la ventana de la izquierda
vim.api.nvim_set_keymap("n", "<leader>mr", "<C-w>l",{noremap = true, silent = true})-- Moverse a la ventana de la derecha
vim.api.nvim_set_keymap("n", "<leader>mt", "<C-w>k",{noremap = true, silent = true})-- Moverse a la ventana superior
vim.api.nvim_set_keymap("n", "<leader>md", "<C-w>j",{noremap = true, silent = true})-- Moverse a la ventana inferior

-- Mover ventana hacia la derecha
vim.keymap.set("n", "<leader>pL", "<C-w>L",{desc = "Mover ventana hacia la derecha"})

-- Mover ventana hacia la izquierda
vim.keymap.set("n", "<leader>pR", "<C-w>H",{desc = "Mover ventana hacia la izquierda"})

-- Mover ventana hacia abajo
vim.keymap.set("n", "<leader>pD", "<C-w>J",{desc = "Mover ventana hacia abajo"})

-- Mover ventana hacia arriba
vim.keymap.set("n", "<leader>pT", "<C-w>K",{desc = "Mover ventana hacia arriba"})
