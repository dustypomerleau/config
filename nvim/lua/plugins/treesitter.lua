-- see https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/treesitter.lua#L7

return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        -- note: explicitly setting a branch breaks install at present
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "css",
                    "dockerfile",
                    "editorconfig",
                    "fish",
                    "git_config",
                    "gitignore",
                    "hjson",
                    "html",
                    "javascript",
                    "json",
                    "jsonc",
                    "latex",
                    "lua",
                    "markdown",
                    "nix",
                    "python",
                    "rust",
                    "sql",
                    "svelte",
                    "terraform",
                    "tmux",
                    "toml",
                    "typescript",
                    "typst",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                    -- "markdown-inline", -- works if you :TSInstall
                },
            })

            vim.treesitter.language.register("xml", "plist")
            vim.treesitter.language.register("xml", "tmTheme")
        end,
    },
}
