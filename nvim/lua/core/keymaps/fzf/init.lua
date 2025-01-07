-- Keymaps para fzf.vim
local opts = { noremap = true, silent = true }

-- Buscar archivos en el directorio actual
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Files<CR>", opts)

-- Buscar archivos del repositorio Git
vim.api.nvim_set_keymap("n", "<Leader>fg", ":GFiles<CR>", opts)

-- Buscar líneas en los buffers abiertos
vim.api.nvim_set_keymap("n", "<Leader>fl", ":Lines<CR>", opts)

-- Buscar texto en el proyecto (necesita ripgrep instalado)
vim.api.nvim_set_keymap("n", "<Leader>fp", ":Rg<CR>", opts)

-- Buscar etiquetas en el archivo actual (ctags necesario)
vim.api.nvim_set_keymap("n", "<Leader>ft", ":BTags<CR>", opts)

-- Buscar etiquetas en todo el proyecto (ctags necesario)
vim.api.nvim_set_keymap("n", "<Leader>fT", ":Tags<CR>", opts)
