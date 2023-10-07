-- see a full list of cmp sources at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
-- in future consider adding https://github.com/hrsh7th/cmp-nvim-lsp but leave as-is for now

return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = { "onsails/lspkind.nvim", }, -- icons
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
                ["<c-b>"] = cmp.mapping.scroll_docs(-4),
                ["<c-f>"] = cmp.mapping.scroll_docs(4),
                ["<c-c>"] = cmp.mapping.complete(),
                ["<c-e>"] = cmp.mapping.abort(),
                ["<cr>"] = cmp.mapping.confirm({ select = false, }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
            }),
            -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
            sources = cmp.config.sources(
            -- order determines display order
                { { name = "luasnip", }, },
                { { name = "nvim_lsp_signature_help", }, },
                { { name = "nvim_lsp", }, },
                { { name = "buffer", }, },
                { { name = "cmdline", }, },
                { { name = "path", }, }
            ),
            -- icons
            formatting = {
                fields = {
                    cmp.ItemField.Abbr,
                    cmp.ItemField.Kind,
                    cmp.ItemField.Menu,
                },
                format = function(entry, vim_item)
                    if vim.tbl_contains({ "path", }, entry.source.name) then
                        local icon, hl_group = require("nvim-web-devicons").get_icon(entry
                            :get_completion_item().label)
                        if icon then
                            vim_item.kind = icon
                            vim_item.kind_hl_group = hl_group
                            return vim_item
                        end
                    end
                    return require("lspkind").cmp_format(
                        {
                            with_text = true,
                            maxwidth = 50,
                        }
                    )(entry, vim_item)
                end,
            },
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

        -- rust_analyzer setup is called by rust-tools
        -- tsserver setup is called by typescript-tools
        lsp.clangd.setup({ capabilities = capabilities, })
        lsp.lua_ls.setup({ capabilities = capabilities, })
        lsp.marksman.setup({ capabilities = capabilities, })
        lsp.pyright.setup({ capabilities = capabilities, })
        lsp.svelte.setup({ capabilities = capabilities, })
        lsp.tailwindcss.setup({ capabilities = capabilities, })
    end,
}
