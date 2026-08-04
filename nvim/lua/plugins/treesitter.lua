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
            local langs = {
                "astro",
                "bash",
                "c",
                "c_sharp",
                "clojure",
                "cmake",
                "cooklang",
                "cpp",
                "css",
                "csv",
                "dart",
                "diff",
                "dockerfile",
                "editorconfig",
                "eex",
                "elixir",
                "erlang",
                "fennel",
                "fish",
                "git_config",
                "gitignore",
                "go",
                "graphql",
                "hack",
                "haskell",
                "heex",
                "hjson",
                "html",
                "idris",
                "java",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "jsx",
                "julia",
                "kdl",
                "kotlin",
                "latex",
                "lua",
                "luadoc",
                "luap",
                "luau",
                "markdown",
                "markdown_inline",
                "nix",
                "ocaml",
                "perl",
                "php",
                "pony",
                "python",
                "r",
                "racket",
                "regex",
                "rescript",
                "ruby",
                "rust",
                "scala",
                "scheme",
                "scss",
                "sql",
                "ssh_config",
                "svelte",
                "swift",
                "teal",
                "terraform",
                "toml",
                "tsx",
                "typescript",
                "typst",
                "vala",
                "vim",
                "vimdoc",
                "vue",
                "xml",
                "yaml",
                "zig",
                "zsh",
            }

            require("nvim-treesitter").install(langs)

            local remapped = { "jsonc", "plist", "tmTheme" }

            vim.treesitter.language.register("json", "jsonc")
            vim.treesitter.language.register("xml", "plist")
            vim.treesitter.language.register("xml", "tmTheme")

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("dn_treesitter", { clear = true }),

                callback = function(ev)
                    if
                        vim.tbl_contains(langs, ev.match) or vim.tbl_contains(remapped, ev.match)
                    then
                        vim.treesitter.start(ev.buf)
                    end
                end,
            })
        end,
    },
}
