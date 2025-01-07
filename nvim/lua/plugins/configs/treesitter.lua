-- File: nvim/lua/plugins/configs/treesitter.lua

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Actualiza los parsers al instalar
        event = { "BufReadPost", "BufNewFile" }, -- Carga cuando se abre un archivo
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "html", "css", "javascript", "typescript", -- Lenguajes para desarrollo web
                    "c", "cpp", "java" -- Otros lenguajes
                },
                highlight = {
                    enable = true, -- Habilita el resaltado de sintaxis
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true, -- Habilita la indentación basada en Tree-sitter
                },
                incremental_selection = {
                    enable = true, -- Habilita la selección incremental
                    keymaps = {
                        init_selection = "gnn", -- Inicia la selección
                        node_incremental = "grn", -- Incrementa al siguiente nodo
                        node_decremental = "grm", -- Decrementa al nodo anterior
                        scope_incremental = "grc", -- Incrementa al siguiente scope
                    },
                },
            })
        end,
    },
}
