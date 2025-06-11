-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

-- You can paste icons directly from nerd fonts:
-- https://www.nerdfonts.com/cheat-sheet

return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        opts = {
            -- rust_analyzer is set up by rustaceanvim, these opts supposedly avoid duplication,
            -- see :h rustaceanvim.mason
            servers = { rust_analyzer = {} },
            setup = { rust_analyzer = function() return true end },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- configure error icons and formatting of diagnostics
            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,

                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                },

                severity_sort = true,

                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                    },
                },
            })

            -- rust analyzer config is in rustaceanvim.lua
            -- vtsls config is in vtsls.lua

            vim.lsp.enable("basedpyright")
            vim.lsp.config("basedpyright", { capabilities = capabilities })

            vim.lsp.enable("clangd")
            vim.lsp.config("clangd", { capabilities = capabilities })

            vim.lsp.enable("cssls")
            vim.lsp.config("cssls", { capabilities = capabilities })

            vim.lsp.enable("html")
            vim.lsp.config("html", { capabilities = capabilities })

            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", { capabilities = capabilities })

            vim.lsp.enable("markdown_oxide")
            vim.lsp.config("markdown_oxide", {
                capabilities = vim.tbl_deep_extend("force", capabilities, {
                    workspace = {
                        didChangeWatchedFiles = { dynamicRegistration = true },
                    },
                }),
            })

            -- LS for Nix, by Oxalica
            vim.lsp.enable("nil_ls")
            vim.lsp.config("nil_ls", { capabilities = capabilities })

            vim.lsp.enable("oxlint")
            vim.lsp.config("oxlint", {
                capabilities = capabilities,

                filetypes = {
                    "javascript",
                    "javascript.jsx",
                    "javascriptreact",
                    "svelte",
                    "typescript",
                    "typescript.tsx",
                    "typescriptreact",
                },
            })

            vim.lsp.enable("svelte")
            vim.lsp.config("svelte", { capabilities = capabilities })

            vim.lsp.enable("tofu_ls")
            vim.lsp.config("tofu_ls", { capabilities = capabilities })

            -- todo: troubleshoot, as these settings are not being applied
            vim.lsp.enable("texlab")
            vim.lsp.config("texlab", {
                capabilities = capabilities,
                settings = {
                    texlab = {
                        build = {
                            args = {
                                "--shell-escape",
                                "-file-line-error",
                                "-interaction=nonstopmode",
                                "-lualatex",
                                "-pdf",
                                "-synctex=1",
                                "-verbose",
                                "%f",
                            },
                            onSave = false,
                        },
                        formatterLineLength = 100,
                        chktex = { onOpenAndSave = true },
                        diagnostics = {
                            ignoredPatterns = { "(Over|Under)full \\[hv]box" },
                        },
                    },
                },
            })

            -- LS for Typst
            vim.lsp.enable("tinymist")
            vim.lsp.config("tinymist", {
                capabilities = capabilities,
                settings = { exportPdf = "onSave" },
            })

            local util = require("lspconfig.util")
            vim.lsp.enable("taplo")
            vim.lsp.config("taplo", {
                capabilities = capabilities,
                cmd = { "taplo", "lsp", "stdio" },
                filetypes = { "toml" },
                root_dir = function(fname)
                    return util.root_pattern("*.toml")(fname) or util.find_git_ancestor(fname)
                end,
                single_file_support = true,
            })

            -- enable inlay hints on attach if the LSP supports them
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client:supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                        -- toggle this line to help debug inlay hint problems
                        -- vim.notify(string.format("LSP inlay hints are enabled for %s", client.name), "info")
                    end
                end,
            })
        end,
    },
}
