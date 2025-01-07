-- File: nvim/lua/plugins/configs/translator.lua

return {
    "voldikss/vim-translator",
    config = function()
        -- Configuración principal
        vim.g.translator_target_lang = "es" -- Idioma de destino: español
        vim.g.translator_source_lang = "en" -- Idioma de origen: inglés
        vim.g.translator_default_engines = { "google" } -- Motor de traducción: Google Translate

        -- Función para invertir idiomas
        function _G.toggle_translator_lang()
            if vim.g.translator_source_lang == "en" then
                vim.g.translator_source_lang = "es"
                vim.g.translator_target_lang = "en"
                print("Idiomas cambiados: Español -> Inglés")
            else
                vim.g.translator_source_lang = "en"
                vim.g.translator_target_lang = "es"
                print("Idiomas cambiados: Inglés -> Español")
            end
        end

        -- Opcional: Configuración para abrir resultados en una ventana flotante
        vim.g.translator_window_type = "popup" -- Cambiar a "popup" o "split" según prefieras

        -- Mapeo para alternar idiomas (puedes usar el comando directamente también)
        vim.keymap.set("n", "<leader>ti", ":lua toggle_translator_lang()<CR>", { desc = "Invertir idiomas de traducción" })
    end
}
