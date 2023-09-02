local M = {}
    local plugins = {
        use { "wbthomason/packer.nvim", }

        use {
            "nvim-lualine/lualine.nvim",
            event = "BufReadPre",
            config = function()
                require("config.lualine").setup()
            end,
        }

        -- load only when required
        use { "nvim-lua/plenary.nvim", module = "plenary", }

        use {
            "nvchad/nvim-colorizer.lua",
            cmd = "ColorizerToggle",
            config = function()
                require("config.colorizer").setup()
            end,
        }

        use { "tpope/vim-vinegar", event = "BufReadPre", }

        use {
            "NeogitOrg/neogit",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("config.neogit").setup()
            end,
        }

        use {
            "lewis6991/gitsigns.nvim",
            event = "BufReadPre",
            requires = { "nvim-lua/plenary.nvim", },
            config = function()
                require("config.gitsigns").setup()
            end,
        }

        -- Better icons
        use {
            "nvim-tree/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({ default = true, })
            end,
        }

        ------- above has been vetted

        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        npairs.setup({})
        npairs.add_rules({
            Rule("<", ">", { "edgeql", "rust", }),
            Rule("\"", "\"", { "-vim", }),
        })

        require("gitsigns").setup()

        require("headlines").setup({
            markdown = {
                headline_highlights = {
                    "Headline1",
                    "Headline2",
                    "Headline3",
                    "Headline4",
                    "Headline5",
                    "Headline6",
                },
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash",
                quote_highlight = "Quote",
            },
        })

        require("indent-tools").config({})

        require("indent_blankline").setup({
            show_current_context = true,
        })

        require("neo-tree").setup({
            sort_case_insensitive = true,
        })

        require "nvim-treesitter.configs".setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "c",
                "css",
                "dockerfile",
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
                "typescript",
                "vim",
                "yaml",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
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

            rainbow = {
                enable = true,
                extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil,  -- Do not enable for files with more than n lines, int
            },
        })
    }

function M.setup() {
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

    vim.loader.enable()
    
    local lazy = require("lazy")
    lazy.setup(plugins, options)
end

return M
