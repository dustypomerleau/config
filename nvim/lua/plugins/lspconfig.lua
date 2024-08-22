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
            servers = { rust_analyzer = {}, },
            setup = { rust_analyzer = function() return true end, },
        },
        config = function()
            local lsp = require("lspconfig")
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
            lsp.basedpyright.setup({ capabilities = capabilities, })
            lsp.clangd.setup({ capabilities = capabilities, })
            lsp.cssls.setup({ capabilities = capabilities, })
            lsp.html.setup({ capabilities = capabilities, })
            lsp.lua_ls.setup({ capabilities = capabilities, })
            lsp.markdown_oxide.setup({ capabilities = capabilities, })
            lsp.nil_ls.setup({ capabilities = capabilities, })
            lsp.svelte.setup({ capabilities = capabilities, })
            lsp.tailwindcss.setup({ capabilities = capabilities, })

            local util = require("lspconfig.util")
            lsp.taplo.setup({
                capabilities = capabilities,
                cmd = { "taplo", "lsp", "stdio", },
                filetypes = { "toml", },
                root_dir = function(fname)
                    return util.root_pattern("*.toml")(fname) or util.find_git_ancestor(fname)
                end,
                single_file_support = true,
            })

            lsp.typst_lsp.setup({
                capabilities = capabilities,
                -- This is a temporary hack to get typst-lsp working outside of a git repo.
                -- nvim-lspconfig docs explicitly recommend against adding CWD to root_dir` like this, but they haven't yet
                -- implemented a single-file mode (this is not part of the LSP spec, but it is planned
                -- for nvim-lspconfig specifically), and the recommended solution is still git-dependent.
                -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONTRIBUTING.md#adding-a-server-to-lspconfig
                root_dir = function() return vim.uv.cwd() end,
                -- `exportPdf` can be `onType`, `onSave`, or `never`
                settings = { exportPdf = "onSave", },
            })

            -- enable inlay hints on attach if the LSP supports them
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf, })
                        -- toggle this line to help debug inlay hint problems
                        -- vim.notify(string.format("LSP inlay hints are enabled for %s", client.name), "info")
                    end
                end,
            })
        end,
    },
}
