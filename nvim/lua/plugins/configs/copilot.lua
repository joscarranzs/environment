return {
    {
        "github/copilot.vim",
        config = function()
            -- Activar Copilot para los lenguajes que usas
            vim.g.copilot_filetypes = {
                python = true,
                java = true,
                javascript = true,
                typescript = true,
                mysql = true,
                html = true,
                css = true,
                sass = true,
                astro = true, -- Framework Astro
            }
        end,
    },
}
