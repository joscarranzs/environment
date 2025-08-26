return {
    'tpope/vim-dadbod',
    dependencies = {
        'kristijanhusak/vim-dadbod-ui',
        'kristijanhusak/vim-dadbod-completion'
    },
    config = function()
        -- Keymap para abrir la UI
        vim.keymap.set("n", "<leader>du", ":DBUIToggle<CR>")

        -- Simulación de URI mssql usando mysql:// (para que DBUI no crashee)
        -- vim.g.db_ui_win_position = "right"
        vim.g.db_ui_save_location = "~/nvim-db"
        vim.g.dbs = {
            ["sqlserver_test"] = "sqlserver://sa:Carranz2808@localhost:1433/test"
        }
    end
}
