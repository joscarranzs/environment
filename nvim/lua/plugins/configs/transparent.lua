return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            enable = true, -- Habilita la transparencia automáticamente
            extra_groups = { -- Agrega transparencia a grupos adicionales
                "Normal", -- Fondo normal
                "NormalFloat", -- Ventanas flotantes
                "LazyNormal", -- Fondo de Lazy.nvim
                "MasonNormal", -- Fondo de Mason.nvim
                "TelescopePrompt", -- Ventana de búsqueda de Telescope
                "TelescopeResults", -- Resultados de Telescope
                "TelescopePreview", -- Vista previa de Telescope
                "Pmenu", -- Menú de autocompletado
                "PmenuSel", -- Elemento seleccionado en el menú
                "NotifyBackground", -- Fondo de notificaciones
                "TSInstallInfo", -- Ventana de instalación de Treesitter
                "StatusLine", -- Línea de estado
                "DiagnosticFloat", -- Ventanas de diagnóstico
            },
        })

        -- Activa manualmente la transparencia
        vim.cmd("TransparentEnable")
    end,
}
