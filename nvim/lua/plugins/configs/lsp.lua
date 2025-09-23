return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "ts_ls", "clangd", "html", "cssls",
                    "tailwindcss", "jdtls", "astro", "pyright", "marksman"
                },
                automatic_installation = true,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local common_capabilities = cmp_nvim_lsp.default_capabilities()

            -- Helper seguro para root_dir
            local function get_root(patterns, fname)
                if type(fname) ~= "string" or fname == "" then
                    return vim.loop.cwd() -- fallback seguro
                end
                local root_files = vim.fs.find(patterns, { upward = true, path = fname })
                if root_files and root_files[1] and type(root_files[1]) == "string" then
                    return vim.fs.dirname(root_files[1])
                end
                return vim.fs.dirname(fname)
            end

            -- Configuración global
            vim.lsp.config("*", {
                capabilities = common_capabilities,
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = common_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            })

            -- TypeScript / JavaScript
            vim.lsp.config("ts_ls", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "tsconfig.json", "jsconfig.json", "package.json", ".git" }, fname)
                end,
                settings = {
                    typescript = { validate = true },
                    javascript = { validate = true },
                },
            })

            -- C/C++
            vim.lsp.config("clangd", {
                capabilities = common_capabilities,
                cmd = { "clangd", "--background-index", "--clang-tidy" },
            })

            -- HTML
            vim.lsp.config("html", {
                capabilities = common_capabilities,
                filetypes = { "html", "htmldjango" },
            })

            -- CSS
            vim.lsp.config("cssls", {
                capabilities = common_capabilities,
                settings = {
                    css = { validate = true },
                    less = { validate = true },
                    scss = { validate = true },
                },
            })

            -- Tailwind CSS
            vim.lsp.config("tailwindcss", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root(
                        { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts", "package.json", ".git" },
                        fname
                    )
                end,
            })

            -- Java
            vim.lsp.config("jdtls", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "pom.xml", "gradlew", ".git" }, fname)
                end,
            })

            -- Astro
            vim.lsp.config("astro", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "package.json", ".git" }, fname)
                end,
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }, fname)
                end,
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
            vim.lsp.config("marksman", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ ".git" }, fname)
                end,
            })

            -- Activa los servidores
            vim.lsp.enable({
                "lua_ls", "ts_ls", "clangd", "html", "cssls",
                "tailwindcss", "jdtls", "astro", "pyright", "marksman"
            })
        end,
    },

    -- CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
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

            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({ { name = "cmp_git" } }, { { name = "buffer" } }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })
        end,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
