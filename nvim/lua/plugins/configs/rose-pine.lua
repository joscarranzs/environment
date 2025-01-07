-- File: neovim/lua/plugins/configs/rose-pine.lua

return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        -- Configuración básica del tema
        require("rose-pine").setup({
            variant = "main",
            disable_italics = true,
            disable_background = true,
        })

        -- Activar el esquema de colores
        vim.opt.background = "dark"
        vim.cmd("colorscheme rose-pine")

        -- Función para alternar variantes del tema
        local current_variant = "main"
        function ToggleRosePineVariant()
            current_variant = current_variant == "moon" and "main" or "moon"
            require("rose-pine").setup({ variant = current_variant })
            vim.cmd("colorscheme rose-pine")
            print("Tema cambiado a: " .. current_variant)
        end

        -- Mapeo para alternar variantes del tema
        vim.api.nvim_set_keymap("n", "<leader>tm", ":lua ToggleRosePineVariant()<CR>", { noremap = true, silent = true })
    end,
}
