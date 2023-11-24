-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

return { {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        -- enable inlay hints on attach if the LSP supports them
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(args.buf, true)
                end
            end,
        })
    end,
}, }
