-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

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

            -- vtsls config is in vtsls.lua
            lsp.clangd.setup({ capabilities = capabilities, })
            lsp.lua_ls.setup({ capabilities = capabilities, })
            lsp.marksman.setup({ capabilities = capabilities, })
            lsp.pyright.setup({ capabilities = capabilities, })
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
                settings = { exportPdf = "onType", },
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
