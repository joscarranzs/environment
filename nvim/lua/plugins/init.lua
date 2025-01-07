-- Asegurar Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- última versión estable
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Configuración inicial de Lazy.nvim
require("lazy").setup({
    -- Plugin de autocompletado
    -- require("plugins.configs.supermaven"),
    -- Plugin para el theme
    require("plugins.configs.rose-pine"),
    -- Plugin para la transparencia
    require("plugins.configs.transparent"),
    -- Plugin para el fzf
    require("plugins.configs.fzf"),
    -- Plugin para el LSP
    require("plugins.configs.lsp"),
    -- Plugin para el parser de sintaxis
    require("plugins.configs.treesitter"),
    -- Plugin para el Java
    require("plugins.configs.jbtls"),
    -- Plugin para el cursor
    require("plugins.configs.cursor"),
    -- Plugin para el tmux
    require("plugins.configs.tmux"),
    -- Plugin para colorizer
    require("plugins.configs.colorizer"),
    -- Plugin para visualizar keymaps
    require("plugins.configs.which-key"),
    -- Plugin para el copilot
    require("plugins.configs.copilot"),
    -- Plugin para el translator
    require("plugins.configs.translator"),
})
