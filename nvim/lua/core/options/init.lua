-- Archivo: options.lua

-- Configuraciones básicas
local opt = vim.opt

opt.number = true               -- Mostrar números de línea
opt.relativenumber = true       -- Mostrar números relativos
opt.clipboard = "unnamedplus"   -- Habilitar portapapeles del sistema
opt.cursorline = true           -- Resaltar la línea actual
-- opt.mouse = "a"                 -- Habilitar el uso del mouse
opt.termguicolors = true        -- Habilitar colores en terminal
opt.wrap = false                -- Deshabilitar el ajuste de líneas
opt.splitright = true           -- Dividir ventanas verticalmente hacia la derecha
opt.splitbelow = true           -- Dividir ventanas horizontalmente hacia abajo
opt.scrolloff = 8               -- Mantener 8 líneas visibles al desplazarse
opt.sidescrolloff = 8           -- Mantener 8 columnas visibles al desplazarse horizontalmente

-- Configuración de tabulación e indentación
opt.expandtab = true            -- Usar espacios en lugar de tabulaciones
opt.shiftwidth = 4              -- Tamaño de la indentación al usar >> o <<
opt.tabstop = 4                 -- Número de espacios por tabulación
opt.softtabstop = 4             -- Espacios en lugar de tabulación al insertar
opt.autoindent = true           -- Copiar la indentación de la línea anterior
opt.smartindent = true          -- Habilitar indentación inteligente

-- Configuración de búsquedas
opt.ignorecase = true           -- Ignorar mayúsculas en búsquedas
opt.smartcase = true            -- Respetar mayúsculas si se usan en la búsqueda
opt.incsearch = true            -- Mostrar coincidencias mientras escribes
opt.hlsearch = true             -- Resaltar todas las coincidencias

-- Configuración de resaltado de coincidencias de búsquedas
vim.cmd("hi Search cterm=bold ctermbg=yellow ctermfg=black")  -- Personalizar resaltado
vim.cmd("hi IncSearch cterm=bold ctermbg=red ctermfg=white") -- Personalizar búsqueda incremental

-- Deshabilitar banner de Netrw
vim.g.netrw_banner = 0

-- Configuración del cursor
vim.opt.guicursor ={
    "n-v-c:block", -- Normal, visual y command-line: bloque
    "i-ci-ve:blinkwait100-blinkoff50-blinkon50", -- Insert, insert-completion y visual select: barra vertical
    "r-cr:hor20", -- Replace y command-line replace: subrayado
    "o:hor50", -- Operator-pending: subrayado
}

-- Configuración de caracteres ocultos
-- opt.list = true
-- opt.listchars = {
--     tab = "→ ",
--     trail = "·",
--     extends = "→",
--     precedes = "←",
--     nbsp = "␣"
-- }

-- Resaltar coincidencias de búsqueda
vim.opt.hlsearch = true    -- Resaltar coincidencias de búsqueda
vim.opt.incsearch = true   -- Resaltar incrementalmente mientras escribes en la búsqueda
vim.opt.ignorecase = true  -- Ignorar mayúsculas/minúsculas al buscar
vim.opt.smartcase = true   -- Respeta mayúsculas si las usas en la búsqueda

-- Habilitar registro de LSP
vim.lsp.set_log_level("debug")

-- Habilitar autocompletado
vim.g.copilot_enabled = true

-- Configuración de diagnósticos
vim.diagnostic.config({
    virtual_text = true, -- Muestra errores en el texto
    signs = true,        -- Habilita íconos en la columna de signos
    underline = true,    -- Subraya errores en el código
    update_in_insert = false, -- Evita actualizaciones constantes al escribir
    severity_sort = true, -- Ordena los diagnósticos por severidad
})

-- Configuración de acciones para fzf
vim.g.fzf_action = {
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
    ['ctrl-t'] = 'tabedit',
}
