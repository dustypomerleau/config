-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

return { {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- rust_analyzer setup is called by rust-tools
        -- tsserver setup is called by typescript-tools
        lsp.clangd.setup({ capabilities = capabilities, })
        lsp.lua_ls.setup({ capabilities = capabilities, })
        lsp.marksman.setup({ capabilities = capabilities, })
        lsp.pyright.setup({ capabilities = capabilities, })
        lsp.svelte.setup({ capabilities = capabilities, })
        lsp.tailwindcss.setup({ capabilities = capabilities, })

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
                    vim.lsp.inlay_hint.enable(args.buf, true)
                    -- toggle this line to help debug inlay hint problems
                    -- vim.notify(string.format("LSP inlay hints are enabled for %s", client.name), "info")
                end
            end,
        })
    end,
}, }
