return {
    {
        "junegunn/fzf", -- Plugin base
        build = "./install --all", -- Construye fzf al instalar
    },
    {
        "junegunn/fzf.vim", -- Integra fzf en Neovim
        dependencies = { "junegunn/fzf" },
        config = function()
            -- Configuración adicional
            vim.g.fzf_layout = { down = "40%" } -- Muestra la ventana de fzf ocupando el 40% de la pantalla
            vim.g.fzf_preview_window = { "right:50%", "ctrl-/" } -- Vista previa en el lado derecho
        end,
    },
}
