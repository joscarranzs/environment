return {
    -- Mason: Instalador de herramientas
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason-LSPconfig: Integración con lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",    -- Lua
                    "ts_ls",     -- JavaScript/TypeScript (nuevo nombre)
                    "clangd",    -- C/C++
                    "html",      -- HTML
                    "cssls",     -- CSS
                    "tailwindcss", -- Tailwind CSS
                    "jdtls",     -- Java
                    "astro",     -- Astro
                    "pyright",   -- Python
                    "marksman",  -- Markdown
                },
                automatic_installation = true,
            })
        end,
    },

    -- Configuración de LSP Servers
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Servidor Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            })

            -- TypeScript/JavaScript
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
                settings = {
                    TypeScript = {
                        validate = true,
                    },
                    JavaScript = {
                        validate = true,
                    },
                }
            })

            -- C/C++
            lspconfig.clangd.setup({ capabilities = capabilities })

            -- HTML
            lspconfig.html.setup({ capabilities = capabilities })

            -- CSS
            lspconfig.cssls.setup({ capabilities = capabilities })

            -- Tailwind CSS
            lspconfig.tailwindcss.setup({ capabilities = capabilities })

            -- Java
            lspconfig.jdtls.setup({ capabilities = capabilities })

            -- Astro
            lspconfig.astro.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json", ".git"),
            })

            -- Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- Markdown
            lspconfig.marksman.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern(".git"),
            })
        end,
    },

    -- Autocompletado con nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",   -- Soporte LSP
            "hrsh7th/cmp-buffer",     -- Autocompletado de palabras del buffer
            "hrsh7th/cmp-path",       -- Autocompletado de rutas
            "hrsh7th/cmp-cmdline",    -- Autocompletado para comandos
            "L3MON4D3/LuaSnip",       -- Snippets
            "saadparwaiz1/cmp_luasnip", -- Integración de LuaSnip
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })

            -- Configuración específica para ciertos tipos de archivos
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" }, -- Fuente de completado para Git
                }, {
                        { name = "buffer" },
                    }),
            })

            -- Configuración para completado en el modo de búsqueda (`/` y `?`)
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Configuración para completado en el modo de comandos (`:`)
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                        { name = "cmdline" },
                    }),
            })
        end,
    },

    -- Snippets con LuaSnip
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
