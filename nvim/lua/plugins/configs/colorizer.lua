-- File: nvim/lua/plugins/configs/colorizer.lua

return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup({
                '*', -- Resalta colores en todos los archivos
                css = { rgb_fn = true; }, -- Activa funciones RGB en archivos CSS
            })
        end
    }
}
