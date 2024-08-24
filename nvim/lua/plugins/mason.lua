-- for reference
-- https://github.com/Integralist/dotfiles/blob/a77a154b245e092084e4e1b9e06f365482c30e62/.config/nvim/lua/plugin-manager.lua#L169
-- see config options at https://github.com/williamboman/mason.nvim#configuration

return {
    {
        "williamboman/mason.nvim",
        enabled = false, -- trial this off, as packages have been moved to nix
        event = "VeryLazy",
        opts = {
            -- Note: names here will not match names in mason-lspconfig.lua
            -- Mapping from mason package names to lspconfig server names:
            -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
            ensure_installed = { -- nix replacements listed as pkgs.<name>
                -- "basedpyright", -- pkgs.basedpyright
                -- "clangd", -- pkgs.clang-tools
                -- "codelldb", -- pkgs.vscode-extensions.vadimcn.vscode-lldb (rust debugger, configure via nvim-dap)
                -- "css-lsp", -- pkgs.vscode-langservers-extracted
                -- "html-lsp", -- pkgs.vscode-langservers-extracted
                -- "lua-language-server", -- pkgs.lua-language-server
                -- "rust-analyzer", -- for now, using RA as a rustup component
                -- "svelte-language-server", -- pkgs.svelte-language-server
                -- "tailwindcss-language-server", -- pkgs.tailwindcss-language-server
                -- "taplo", -- pkgs.taplo
                -- "typst-lsp", -- pkgs.typst-lsp
                -- "vtsls", -- installed via pnpm global for now - will provide tsserver on first activation
            },
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
}
