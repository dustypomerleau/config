-- see https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/treesitter.lua#L7

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        version = false, -- last release is very old
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "css",
                    "dockerfile",
                    "fish",
                    "gitignore",
                    "html",
                    "javascript",
                    "json",
                    "jsonc",
                    "latex",
                    "lua",
                    "markdown",
                    "python",
                    "rust",
                    "sql",
                    "svelte",
                    "toml",
                    "typescript",
                    "vim",
                    "yaml",
                    -- "markdown-inline", -- works if you :TSInstall
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = true,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                -- List of parsers to ignore installing (for "all")
                ignore_install = {},

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    disable = {},
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    -- disable = function(lang, buf)
                    --     local max_filesize = 100 * 1024 -- 100 KB
                    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    --     if ok and stats and stats.size > max_filesize then
                    --         return true
                    --     end
                    -- end,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
