-- Mapeo de teclas para el plugin de traducción
vim.keymap.set("v", "<leader>t", ":Translate<CR>", { desc = "Traducir selección" }) -- Traducción básica
vim.keymap.set("v", "<leader>tw", ":TranslateW<CR>", { desc = "Traducir en ventana flotante" }) -- Traducción flotante
vim.keymap.set("v", "<leader>tr", ":TranslateR<CR>", { desc = "Traducir y reemplazar" }) -- Traducción con reemplazo
