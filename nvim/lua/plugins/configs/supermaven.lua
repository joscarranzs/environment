-- File: nvim/lua/plugins/config/supermaven.lua

return {
    {
        "supermaven-inc/supermaven-nvim", -- Repositorio correcto de SuperMaven en GitHub
        lazy = false, -- Asegura que el plugin siempre se cargue al iniciar
        config = function()
            require("supermaven-nvim").setup({
                -- Configuración personalizada para SuperMaven
                keymaps = {
                    accept_suggestion = "<C-g>", -- Cambia a Ctrl + g para aceptar sugerencias
                    clear_suggestion = "<C-]>", -- Tecla predeterminada para borrar sugerencias
                    accept_word = "<C-j>", -- Tecla predeterminada para aceptar una palabra
                },
                -- Añade cualquier otra opción específica que necesites
                ignore_filetypes = { cpp = true }, -- Ejemplo: Ignorar sugerencias en archivos cpp
                log_level = "info", -- Establece "info" para habilitar el registro
            })
        end,
    },
}
