-- plugins.lua
return {
    -- Mason
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "clangd", "html", "cssls", "tailwindcss", "jdtls", "astro", "pyright", "marksman" },
                automatic_installation = true,
            })
        end
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            local cmp_nvim_lsp = require'cmp_nvim_lsp'
            local common_capabilities = cmp_nvim_lsp.default_capabilities()

            -- Función root_dir segura
            local function get_root(patterns, fname)
                if type(fname) == "number" then
                    fname = vim.api.nvim_buf_get_name(fname)
                end
                if type(fname) ~= "string" or fname == "" then
                    return vim.loop.cwd()
                end
                local root_files = vim.fs.find(patterns, { upward = true, path = fname })
                if root_files and root_files[1] then
                    return vim.fs.dirname(root_files[1])
                end
                return vim.fs.dirname(fname)
            end

            -- Diagnósticos
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
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
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "pyproject.toml", "setup.py", "requirements.txt", ".git" }, fname)
                end,
            })

            -- C/C++
            vim.lsp.config("clangd", { capabilities = common_capabilities })

            -- HTML
            vim.lsp.config("html", { capabilities = common_capabilities })

            -- CSS
            vim.lsp.config("cssls", { capabilities = common_capabilities })

            -- Tailwind
            vim.lsp.config("tailwindcss", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts", "package.json", ".git" }, fname)
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

            -- Markdown
            vim.lsp.config("marksman", {
                capabilities = common_capabilities,
                root_dir = function(fname)
                    return get_root({ ".git" }, fname)
                end,
            })
        end
    },

    -- CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup{
                snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
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
                sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } },
            }
        end
    },

    -- Snippets
    { "L3MON4D3/LuaSnip", config = function() require("luasnip.loaders.from_vscode").lazy_load() end },
}
