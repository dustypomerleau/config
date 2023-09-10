" Look in github.com/vim-scripts for mirrors if needed
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'andymass/vim-matchup'
    Plug 'arsham/arshlib.nvim',
    Plug 'arsham/indent-tools.nvim',
    Plug 'bkad/CamelCaseMotion'
    Plug 'christoomey/vim-sort-motion'
    Plug 'dustypomerleau/tol.nvim', {'branch': 'dev'}
    " Plug 'dustypomerleau/tol.nvim'
    Plug 'edgedb/edgedb-vim'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'ggandor/leap.nvim'
    Plug 'hiphish/rainbow-delimiters.nvim'
    Plug 'inkarkat/vim-ReplaceWithRegister'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " change to fzf.lua
    Plug 'junegunn/fzf.vim' " remove
    Plug 'lervag/vimtex'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'lukas-reineke/headlines.nvim' " remove
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'luochen1990/rainbow' " remove
    Plug 'MunifTanjim/nui.nvim' " dep?
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'nvim-lua/plenary.nvim' " dep?
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'othree/html5.vim' " defer
    Plug 'pangloss/vim-javascript' " defer
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive' " remove
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'windwp/nvim-autopairs'
call plug#end()

syntax on
let g:lsp_semantic_enabled=1

nnoremap <space> <nop>
let maplocalleader = "\<space>"
let mapleader = ","

set breakindent " keep indentation when lines break
set breakindentopt=shift:2 " but shift it by 2 spaces
set cursorline " highlight the cursor line
set ignorecase smartcase " search is only case sensitive when it starts with a capital
set iskeyword-=_ " allows jumping by word inside snake case
set matchpairs+=<:> " add angle brackets to matching pairs
set nu " show line numbers
set rtp+=/usr/local/opt/fzf " to use fzf in Vim (you may not need this if you have the vim plug installed also)
set synmaxcol=0 " syntax highlight lines of any length - turn this off if perf suffers
set termguicolors " use gui colors for terminal vim
set wrap linebreak nolist " linebreak softwraps at certain characters rather than in the middle of the word, nolist hides whitespace characters

" spaces and tabs
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaces to use for autoindent
set softtabstop=4   " number of spaces in tab when editing
set tabstop=4       " number of visual spaces per tab

" use \ for moving backward in fF and tT movements
noremap \ ,

" bang versions of FZF bindings open in fullscreen
" in general try to avoid binding <leader>a or <leader>i because you need these to start off text objects
" many keybindings for neotree here: https://github.com/nvim-neo-tree/neo-tree.nvim or you can hit ? in the neotree view for defaults

nnoremap <leader><leader>g :Gitsigns toggle_signs<CR>
nnoremap <leader>b :Buffers!<CR>
nnoremap <leader>d :CocDiagnostics<CR>
nnoremap <leader>f :Rg!<CR>
nnoremap <leader>g :GFiles!<CR>
nnoremap <leader>h :History!<CR>
nnoremap <leader>l :BLines!<CR>
nnoremap <leader>p :Files!<CR>
nnoremap <leader>o :so $MYVIMRC<CR>
" nnoremap <leader>p :FZF!<CR>
nnoremap <leader>v :CocCommand markdown-preview-enhanced.openPreview<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader>W :qa<CR>
nnoremap <leader>x :bd<CR>
" nnoremap <localleader>b :Neotree<CR>
nnoremap <localleader>c :ColorizerToggle<CR>
nnoremap <localleader>p :pwd<cr>

" camelcasemotion
" default:
" let g:camelcasemotion_key = '<leader>'
" overrides:
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
" use default text objects, as these play better with vim-surround, but allow overrides with leader
" in practice, this means for snake_case word alterations you will use the default, but for CamelCase alterations you will use leader
omap <silent> <leader>ib <Plug>CamelCaseMotion_ib
omap <silent> <leader>ie <Plug>CamelCaseMotion_ie
omap <silent> <leader>iw <Plug>CamelCaseMotion_iw
xmap <silent> <leader>ib <Plug>CamelCaseMotion_ib
xmap <silent> <leader>ie <Plug>CamelCaseMotion_ie
xmap <silent> <leader>iw <Plug>CamelCaseMotion_iw

" easymotion
" there is basically no reason to use f in easymotion, because easymotion-s == easymotion-bd-f
" Keep in mind that you still need <leader>s for visual and operator pending
" modes
" rather than rebinding leader for everything, comment this out and only
" rebind it for the easymotion bindings you really use - that frees up leader
" for other purposes

" map <leader> <Plug>(easymotion-prefix)
" map <leader>; <Plug>(easymotion-next)
" map <leader>\ <Plug>(easymotion-previous)
" map <leader>E <Plug>(easymotion-bd-E)
" map <leader>e <Plug>(easymotion-bd-e)
" map <leader>N <Plug>(easymotion-bd-N)
" map <leader>n <Plug>(easymotion-bd-n)
" map <leader>T <Plug>(easymotion-bd-T)
" map <leader>t <Plug>(easymotion-bd-t)
" map <leader>w <Plug>(easymotion-bd-w) " note: this has been remapped to :bd
" map <leader>W <Plug>(easymotion-bd-W) " note: this has been remapped to :bd!

" " used easymotion, commented out to try leap
" let g:EasyMotion_smartcase = 1
" map <leader>k <Plug>(easymotion-bd-jk)
" map <leader>s <Plug>(easymotion-s)
" nmap s <Plug>(easymotion-s)


" easier window splits and navigation between split buffers
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-w>h <c-w>H 
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L
set splitbelow
set splitright

" move lines/selections up or down
nnoremap <silent> ∆ :<C-u> m+<CR>==
nnoremap <silent> ˚ :<C-u> m-2<CR>==
xnoremap <silent> ∆ :<C-u> '<,'>move'>+<CR>gv=gv
xnoremap <silent> ˚ :<C-u> '<,'>m-2<CR>gv=gv

" highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="CurSearch", timeout=200}
augroup END

" " show syntax scopes under the cursor in the status bar
" function! SyntaxItem()
"   return synIDattr(synID(line("."),col("."),1),"name")
" endfunction
" set statusline+=%{SyntaxItem()}

" vim-commentary
autocmd FileType edgeql setlocal commentstring=#\ %s
autocmd FileType json setlocal commentstring=//\ %s
autocmd FileType latex setlocal commentstring=%\ %s
autocmd FileType svelte setlocal commentstring=<!--\ %s\ -->

" dismiss search highlight
nnoremap <silent> <leader>c :noh<CR>

" leader s saves only in normal mode, otherwise it triggers easymotion
nnoremap <silent> <leader>s :w<CR>

nnoremap <localleader>i :Inspect<CR>

" ----- coc settings

set updatetime=300
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-float-jump)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Symbol renaming.
nmap <localleader>r <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" -----

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#ff4ee0', '#f4dd64', '#01edf0'],
\   'operators': '',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'],
\   'separately': {}
\}

augroup rainbow
	au BufEnter *     hi      TSPunctBracket NONE
	au BufEnter *     hi link TSPunctBracket nonexistenthl
	au BufEnter *.lua hi      TSConstructor  NONE
	au BufEnter *.lua hi link TSConstructor  nonexistenthl
augroup END

" rust
let g:rustfmt_autosave = 1

" neotree
let g:neo_tree_remove_legacy_commands = 1

" vimtex detailed info here: https://www.ejmastnak.com/tutorials/vim-latex/intro.html
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
        \ '--shell-escape',
        \ '-file-line-error',
        \ '-interaction=nonstopmode',
        \ '-pdf',
        \ '-synctex=1',
        \ '-verbose',
    \ ],
\}
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk_engines = { '_' : '-lualatex' }
let g:vimtex_quickfix_ignore_filters = ['Underfull',  'Overfull']
nmap <localleader>v <plug>(vimtex-view)
nmap <localleader>k <plug>(vimtex-compile)

" vim-vinegar
" noma = non-modifiable
" nomod = not-modified
" nu = numbers
" nowrap
" ro = read-only
" nobl = not-buflisted
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
" autocmd filetype netrw nunmap s
" autocmd filetype netrw nunmap S
" autocmd filetype netrw nmap <silent> s <Plug>(leap-forward-to)
" autocmd filetype netrw nmap <silent> S <Plug>(leap-backward-to)
" autocmd filetype netrw nmap <silent> go <Plug>(leap-from-window)

set background=dark
colorscheme tol

lua << END
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
npairs.setup({})
npairs.add_rules({
    Rule("<", ">", { "edgeql", "rust" }),
    Rule("\"", "\"", { "-vim" })
})

require("colorizer").setup {
    user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        tailwind = true
    }
}

require("gitsigns").setup()

-- require("headlines").setup({
--     markdown = {
--         headline_highlights = {
--             "Headline1",
--             "Headline2",
--             "Headline3",
--             "Headline4",
--             "Headline5",
--             "Headline6",
--         },
--         codeblock_highlight = "CodeBlock",
--         dash_highlight = "Dash",
--         quote_highlight = "Quote",
--     },
-- })

require("indent-tools").config({})

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ff4ee0 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f4dd64 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#01edf0 gui=nocombine]]

require("indent_blankline").setup({
    show_current_context = true,
--    char_highlight_list = {
--        "IndentBlanklineIndent1",
--        "IndentBlanklineIndent2",
--        "IndentBlanklineIndent3",
--    },
})

require('leap').add_default_mappings()

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = 'tol',
        component_separators = '', section_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1, shorting_target = 60}},
        -- lualine_x = {'SyntaxItem','encoding', 'fileformat', 'filetype'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 1, shorting_target = 60}},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
    always_divide_middle = false,
}

-- require("neo-tree").setup({
--     sort_case_insensitive = true
-- })

local rainbow_delimiters = require("rainbow-delimiters")
vim.g.rainbow_delimiters = {
    strategy = { [""] = rainbow_delimiters.strategy["global"] },
    query = { [""] = "rainbow-delimiters" },
    highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
    }
}

require("nvim-treesitter.configs").setup {
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
        "yaml"
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

    -- rainbow = {
    --     enable = true,
    --     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --     max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- },
}
END

" hi RainbowDelimiterRed guifg=#ffff00

onoremap <silent> o <Plug>(leap-forward-to)
xnoremap <silent> o <Plug>(leap-forward-to)
onoremap <silent> O <Plug>(leap-backward-to)
xnoremap <silent> O <Plug>(leap-backward-to)
nnoremap <silent> go <Plug>(leap-from-window)
" you have a redundancy because you left xmap s in place as leap - you could
" consider using it for <Plug>VSurround, which saves you needing shift there.

" sortmotion
let g:sort_motion_flags = 'i'
unmap gs
nnoremap <silent> gs <Plug>SortMotion
xnoremap <silent> gs <Plug>SortMotionVisual

" check for conflicts in maps on:
" s, o, gs, go, S, O, gS, gO
