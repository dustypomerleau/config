-- see a full list of cmp sources at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
-- in future consider adding https://github.com/hrsh7th/cmp-nvim-lsp but leave as-is for now

return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                -- snippet engine is required
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false, }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
            sources = cmp.config.sources(
                { { name = "buffer", keyword_length = 3, }, },
                { { name = "cmdline", keyword_length = 3, }, },
                { { name = "luasnip", keyword_length = 2, }, },
                { { name = "nvim_lsp", keyword_length = 3, }, },
                { { name = "nvim_lsp_signature_help", }, },
                { { name = "path", }, }
            ),
        })

        -- -- Set configuration for specific filetype.
        -- cmp.setup.filetype("gitcommit", {
        --     sources = cmp.config.sources({
        --         { name = "git", }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        --     }, {
        --         { name = "buffer", },
        --     }),
        -- })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(
            { "/", "?", },
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer", }, },
            }
        )

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = "path", }, },
                { { name = "cmdline", }, }
            ),
        })

        -- Set up lspconfig.
        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lsp.clangd.setup({ capabilities = capabilities, })
        lsp.lua_ls.setup({ capabilities = capabilities, })
        lsp.marksman.setup({ capabilities = capabilities, })
        lsp.pyright.setup({ capabilities = capabilities, })
        lsp.rust_analyzer.setup({ capabilities = capabilities, }) -- seems that this call shouldn't be necessary with rust-tools.setup(), but for some reason the ls isn't attaching to the buffer without it
        lsp.svelte.setup({ capabilities = capabilities, })
        lsp.tailwindcss.setup({ capabilities = capabilities, })
        -- lsp.tsserver.setup({ capabilities = capabilities, })
    end,
}
