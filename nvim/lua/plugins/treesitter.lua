-- see https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/treesitter.lua#L7

return {
    {
        "nvim-treesitter/nvim-treesitter",

        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                -- main branch is incompatible with indent-tools due to a changed function name
                branch = "main",
                event = "VeryLazy",
            },
        },

        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").install({
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
                -- "jsonc", -- ?unsupported by update
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "nix",
                "python",
                "rust",
                "sql",
                "svelte",
                "terraform",
                -- "tmux", -- ?unsupported by update
                "toml",
                "typescript",
                "typst",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            })

            vim.treesitter.language.register("xml", "plist")
            vim.treesitter.language.register("xml", "tmTheme")
        end,
    },
}
