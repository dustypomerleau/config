-- see a full list of cmp sources at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
-- note: passing nvim-cmp's default capabilities to LSP servers has been moved to lspconfig.lua

return {
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = { "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" }, -- icons
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    -- snippet engine is required
                    expand = function(args) require("luasnip").lsp_expand(args.body) end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<c-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<c-c>"] = cmp.mapping.complete(),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<c-f>"] = cmp.mapping.scroll_docs(4),
                    ["<c-n>"] = cmp.mapping.select_next_item(),
                    ["<c-p>"] = cmp.mapping.select_prev_item(),
                    ["<c-y"] = cmp.mapping.confirm({ select = false }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
                    ["<cr>"] = cmp.mapping.confirm({ select = false }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
                    ["<c-l>"] = cmp.mapping(
                        function()
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-expand-or-jump",
                                    true,
                                    true,
                                    true
                                ),
                                ""
                            )
                        end,
                        { "c", "i", "s" }
                    ), -- perhaps these have no effect as you are only mapping for insert here
                    ["<c-h>"] = cmp.mapping(
                        function()
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-jump-prev",
                                    true,
                                    true,
                                    true
                                ),
                                ""
                            )
                        end,
                        { "c", "i", "s" }
                    ),
                }),
                -- do not automatically select the first item (allows enter for newline without
                -- confirming a one-item list)
                preselect = cmp.PreselectMode.None,
                -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
                sources = cmp.config.sources(
                    -- sources for insert in buffer
                    -- order determines display order
                    { { name = "nvim_lsp_signature_help" } },

                    {
                        {
                            name = "nvim_lsp",
                            option = {
                                markdown_oxide = {
                                    keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
                                },
                            },
                        },
                    },

                    { { name = "luasnip" } },
                    { { name = "crates" } },
                    { { name = "buffer", keyword_length = 3, max_item_count = 10 } },
                    { { name = "path" } }
                ),
                -- icons
                formatting = {
                    fields = {
                        cmp.ItemField.Abbr,
                        cmp.ItemField.Kind,
                        cmp.ItemField.Menu,
                    },
                    format = function(entry, vim_item)
                        if vim.tbl_contains({ "path" }, entry.source.name) then
                            local icon, hl_group = require("nvim-web-devicons").get_icon(
                                entry:get_completion_item().label
                            )
                            if icon then
                                vim_item.kind = icon
                                vim_item.kind_hl_group = hl_group
                                return vim_item
                            end
                        end
                        return require("lspkind").cmp_format({
                            with_text = true,
                            maxwidth = 50,
                        })(entry, vim_item)
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
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })
        end,
    },
}
