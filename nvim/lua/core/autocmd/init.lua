-- Comando automatico que detecta si hay actualizacion en Lazy
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local status_ok, lazy_status = pcall(require, "lazy.status")
        if status_ok and lazy_status.has_updates() then
            print("✨ Plugins actualizables: usa :Lazy update")
        end
    end,
})
