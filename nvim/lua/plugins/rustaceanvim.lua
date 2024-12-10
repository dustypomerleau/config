local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.rustaceanvim = {
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- for a list of all possible config, see:
                -- https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/config.rs
                cargo = { features = "all" },
                check = {
                    allTargets = true,
                    features = "all",
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
                -- toggle below if needed, see: https://book.leptos.dev/getting_started/leptos_dx.html#2-editor-autocompletion-inside-component-and-server
                -- procMacro = { ignored = { leptos_macro = { "server", }, }, },
                workspace = { symbol = { search = { kind = "all_symbols" } } },
            },
            capabilities = capabilities,
        },
    },
}

return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- pin to release to avoid breaking changes
        lazy = false, -- the plugin handles its own lazy loading
        keys = {
            {
                "<localleader>sj",
                ":RustLsp moveItem down<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sk",
                ":RustLsp moveItem up<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sm",
                ":RustLsp expandMacro<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sw",
                ":RustLsp reloadWorkspace<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}

-- for future reference, here is the full Rust config for LazyVim:
--
-- return {
--
--     -- Extend auto completion
--     {
--         "hrsh7th/nvim-cmp",
--         dependencies = {
--             {
--                 "Saecki/crates.nvim",
--                 event = { "BufRead Cargo.toml", },
--                 opts = {
--                     src = {
--                         cmp = { enabled = true, },
--                     },
--                 },
--             },
--         },
--         ---@param opts cmp.ConfigSchema
--         opts = function(_, opts)
--             local cmp = require("cmp")
--             opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
--                 { name = "crates", },
--             }))
--         end,
--     },
--
--     -- Add Rust & related to treesitter
--     {
--         "nvim-treesitter/nvim-treesitter",
--         opts = function(_, opts)
--             if type(opts.ensure_installed) == "table" then
--                 vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml", })
--             end
--         end,
--     },
--
--     -- Ensure Rust debugger is installed
--     {
--         "williamboman/mason.nvim",
--         optional = true,
--         opts = function(_, opts)
--             if type(opts.ensure_installed) == "table" then
--                 vim.list_extend(opts.ensure_installed, { "codelldb", })
--             end
--         end,
--     },
--
--     {
--         "mrcjkb/rustaceanvim",
--         version = "^3", -- Recommended
--         ft = { "rust", },
--         opts = {
--             server = {
--                 on_attach = function(client, bufnr)
--                     -- register which-key mappings
--                     local wk = require("which-key")
--                     wk.register({
--                         ["<leader>cR"] = { function() vim.cmd.RustLsp("codeAction") end, "Code Action", },
--                         ["<leader>dr"] = { function() vim.cmd.RustLsp("debuggables") end, "Rust debuggables", },
--                     }, { mode = "n", buffer = bufnr, })
--                 end,
--                 settings = {
--                     -- rust-analyzer language server configuration
--                     ["rust-analyzer"] = {
--                         cargo = {
--                             allFeatures = true,
--                             loadOutDirsFromCheck = true,
--                             runBuildScripts = true,
--                         },
--                         -- Add clippy lints for Rust.
--                         checkOnSave = {
--                             allFeatures = true,
--                             command = "clippy",
--                             extraArgs = { "--no-deps", },
--                         },
--                         procMacro = {
--                             enable = true,
--                             ignored = {
--                                 ["async-trait"] = { "async_trait", },
--                                 ["napi-derive"] = { "napi", },
--                                 ["async-recursion"] = { "async_recursion", },
--                             },
--                         },
--                     },
--                 },
--             },
--         },
--         config = function(_, opts)
--             vim.g.rustaceanvim = vim.tbl_deep_extend("force",
--                 {},
--                 opts or {})
--         end,
--     },
--
--     -- Correctly setup lspconfig for Rust 🚀
--     {
--         "neovim/nvim-lspconfig",
--         opts = {
--             servers = {
--                 rust_analyzer = {},
--                 taplo = {
--                     keys = {
--                         {
--                             "K",
--                             function()
--                                 if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
--                                     require("crates").show_popup()
--                                 else
--                                     vim.lsp.buf.hover()
--                                 end
--                             end,
--                             desc = "Show Crate Documentation",
--                         },
--                     },
--                 },
--             },
--             setup = {
--                 rust_analyzer = function()
--                     return true
--                 end,
--             },
--         },
--     },
--
--     {
--         "nvim-neotest/neotest",
--         optional = true,
--         dependencies = {
--             "rouge8/neotest-rust",
--         },
--         opts = {
--             adapters = {
--                 ["neotest-rust"] = {},
--             },
--         },
--     },
--
-- }
