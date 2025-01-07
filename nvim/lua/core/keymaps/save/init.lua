
-- Función para limpiar y formatear archivos
local function clean_and_format()
    -- Guardar la posición actual del cursor
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Eliminar caracteres no deseados como ^M (si existen)
    vim.cmd([[%s/\r//ge]])  -- Reemplaza ^M en todo el archivo (sin errores si no se encuentra)

    -- Reindentar todo el archivo
    vim.cmd("normal! gg=G") -- Usa `normal!` para evitar conflictos con remapeos

    -- Restaurar la posición del cursor
    vim.api.nvim_win_set_cursor(0, cursor_pos)

    -- Guardar el archivo
    vim.cmd("write")
end

-- Registrar el comando "CleanAndFormat"
vim.api.nvim_create_user_command("CleanAndFormat", clean_and_format, {})

-- Vincular la función al mapeo de teclas (líder + s)
vim.keymap.set("n", "<leader>s", clean_and_format, { noremap = true, silent = true })
