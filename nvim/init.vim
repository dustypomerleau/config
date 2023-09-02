" Look in github.com/vim-scripts for mirrors if needed
call plug#begin('~/.local/share/nvim/plugged')
    " Plug 'folke/tokyonight.nvim'
    " Plug 'hzchirs/vim-material'
    " Plug 'nvim-neo-tree/neo-tree.nvim'
    " Plug 'shaunsingh/nord.nvim'
    Plug 'andymass/vim-matchup'
    Plug 'arsham/arshlib.nvim',
    Plug 'arsham/indent-tools.nvim',
    Plug 'bkad/CamelCaseMotion'
    Plug 'christoomey/vim-sort-motion'
    " Plug 'dustypomerleau/nord.nvim', {'branch': 'tol'}
    Plug 'dustypomerleau/nord.nvim'
    " Plug 'easymotion/vim-easymotion'
    Plug 'edgedb/edgedb-vim'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'ggandor/leap.nvim'
    Plug 'inkarkat/vim-ReplaceWithRegister'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'lukas-reineke/headlines.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'luochen1990/rainbow'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'othree/html5.vim'
    " Plug 'p00f/nvim-ts-rainbow'
    Plug 'hiphish/rainbow-delimiters.nvim'
    Plug 'pangloss/vim-javascript'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
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
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
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

let g:nord_bold = v:false
let g:nord_italic = v:false
let g:nord_uniform_diff_background = v:true

set background=dark
colorscheme nord

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
        theme = 'nord',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
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
    strategy = { [''] = rainbow_delimiters.strategy['global'] },
    query = { [''] = 'rainbow-delimiters' },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
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

hi rainbowcol1 guifg=#ff4ee0
hi rainbowcol2 guifg=#f4dd64
hi rainbowcol3 guifg=#01edf0
hi rainbowcol4 guifg=#ff4ee0
hi rainbowcol5 guifg=#f4dd64
hi rainbowcol6 guifg=#01edf0
hi rainbowcol7 guifg=#ff4ee0

hi RainbowDelimiterRed guifg=#ff4ee0
hi RainbowDelimiterYellow guifg=#f4dd64
hi RainbowDelimiterBlue guifg=#01edf0

hi link EasyMotionShade Comment

hi CursorLine guifg=none guibg=#242837
hi Normal guifg=#cac0a9 guibg=#292d3e
hi CommandMode guifg=red

hi @boolean guifg=#ffaabb
hi @character.special guifg=#99ddff
hi @comment guifg=#7e818b
hi @conditional guifg=#ee8866
hi @constant guifg=#dddddd
hi @constant.builtin guifg=#dddddd
hi @constant.builtin.lua guifg=#ffaabb
hi @constructor guifg=#44bb99
" hi link @error Error
hi @error guifg=#f46a80
hi @exception guifg=#ee8866
hi @field guifg=#dddddd
hi @function guifg=#44bb99
hi @function.builtin guifg=#44bb99
hi @function.call guifg=#44bb99
hi @function.macro.rust guifg=#dddddd
" hi link @function.macro Macro
hi @include guifg=#ee8866
hi @keyword guifg=#ee8866
hi @keyword.function guifg=#ee8866
hi @keyword.operator guifg=#ee8866
hi @keyword.return guifg=#ee8866
hi @label guifg=#dddddd
hi @method guifg=#44bb99
hi @namespace guifg=#cac0a9
hi @number guifg=#ffaabb
hi @operator guifg=#ee8866
hi @parameter guifg=#cac0a9
hi @preproc guifg=#ee8866
hi @property guifg=#dddddd
hi @punctuation guifg=#99ddff
" hi @punctuation.bracket guifg=#99ddff
hi @punctuation.bracket guifg=#ff4ee0 " try making this match rainbow1 as a stopgap until rainbow works - certainly makes your toml look nicer
hi @punctuation.delimiter guifg=#99ddff
hi @punctuation.special guifg=#99ddff
hi @repeat guifg=#ee8866
hi @storageclass.lifetime.rust guifg=#ffaabb
hi @string guifg=#bbcc33
hi @string.escape guifg=#44bb99
hi @string.regex guifg=#ffaabb
hi @string.special guifg=#bbcc33
hi @symbol guifg=#dddddd
hi @tag guifg=#ffaabb
hi @tag.attribute guifg=#dddddd
hi Search guifg=#f8f6f1 guibg=#5e81ac " just keep nord for this
hi @tag.delimiter guifg=#99ddff
hi @text guifg=#cac0a9
hi @text.title guifg=#ee8866
hi Todo guibg=none guifg=#dddddd
hi @text.uri guifg=#bbcc33
hi @type guifg=#70b2f3
hi @type.builtin guifg=#eedd88
hi @type.qualifier guifg=#ee8866
hi @variable guifg=#cac0a9
hi @variable.builtin guifg=#cac0a9
hi @variable.builtin.rust guifg=#dddddd
hi @variable.builtin.typescript guifg=#eedd88
hi Boolean guifg=#ffaabb " done
hi CocFadeOut guibg=none guifg=none " unused code
hi CocInlayHint guibg=none guifg=#7e818b
hi CocSemClass guifg=#70b2f3
hi CocSemDecorator guifg=#dddddd
hi CocSemEnum guifg=#dddddd
hi CocSemFunction guifg=#44bb99
hi CocSemFunctionDeclaration guifg=#ffff00
hi CocSemInterface guifg=#ffaabb
hi CocSemKeyword guifg=#ee8866
hi CocSemMacro guifg=#eedd88
hi CocSemMethod guifg=#44bb99
hi CocSemNamespace guifg=#cac0a9
hi CocSemParameter guifg=#cac0a9
hi CocSemProperty guifg=#dddddd
hi CocSemStruct guifg=#70b2f3
hi CocSemType guifg=#70b2f3
hi CocSemTypeParameter guifg=#70b2f3
hi CocSemVariable guifg=#cac0a9
hi Comment guifg=#7e818b
hi Conditional guifg=#ee8866
hi CursorLineNr guifg=#ff4ee0 guibg=#202431
hi LineNr guifg=#616e88
hi NormalFloat guibg=#616e88
hi Define guifg=#ee8866 " done
hi Function guifg=#44bb99
hi Identifier guifg=#70b2f3
hi Keyword guifg=#ee8866
hi link @namespace.vim @constant
hi link @type.qualifier.rust @keyword
hi link tmuxOptions @field
hi link zshOperator Operator
hi link zshParentheses Punctuation
hi link zshPrecommand Keyword
hi link zshShortDeref zshDeref
hi link zshSubstDelim Punctuation
hi link zshSubstQuoted Macro
hi Macro guifg=#eedd88
hi MatchParen guibg=#474e6c guifg=#ff218c gui=bold
hi Number guifg=#ffaabb " done
hi Operator guifg=#ee8866 " done
hi Punctuation guifg=#99ddff
hi SignColumn guibg=#292d3e " i.e. GitSigns and the like
hi Special guifg=#cac0a9 " done: chosen due to zshPrecommand, but influences tmux config"
hi SpecialChar guifg=#44bb99 " done
hi StatusLine guifg=#242837 guibg=#242837 " the active status line (lualine styles this)
hi StatusLineNC guifg=#242837 guibg=#242837 " this bg is the one that makes that square between the active and inactive status bars! It stands for "status line, not current"
hi StatusLineTermNC guifg=#242837 guibg=#242837
hi StorageClass guifg=#ee8866 " done
hi String guifg=#bbcc33
hi Title guifg=#ee8866
hi Type guifg=#70b2f3 " done
hi VertSplit guifg=#292d3e guibg=#292d3e " the line between windows
hi zshBrackets guifg=#ee8866
hi zshDeref guifg=#ffaabb

" hi (Added) guifg=#96c065 " added
hi link CocInfoSign Info
hi CocFloating guibg=#33384d
hi CocHintFloat guifg=#cac0a9
hi link CocWarningFloat Warning
hi link CocErrorFloat Error
hi link CocInfoVirtualText Info
hi Error guifg=#f46a80 " deleted, error
hi Hint guifg=#616e88
hi Info guifg=#5ebdea " info
hi link @text.warning Warning
hi link CocErrorSign Error
hi link CocErrorVirtualText Error
hi link CocWarningSign Warning
hi link CocWarningVirtualText Warning
hi link healthWarning Warning
hi link healthError Error
hi link LspDiagnosticsDefaultInformation Info
hi link LspDiagnosticsDefaultWarning Warning
hi link LspDiagnosticsFloatingInformation Info
hi link LspDiagnosticsFloatingWarning Warning
hi link LspDiagnosticsHint Hint
hi link LspDiagnosticsInformation Info
hi link LspDiagnosticsSignHint Info
hi link LspDiagnosticsSignError Error
hi link LspDiagnosticsSignInformation Info
hi link LspDiagnosticsSignWarning Warning
hi link LspDiagnosticsUnderlineInformation Info
hi link LspDiagnosticsVirtualTextInformation Info
hi link LspDiagnosticsVirtualTextWarning Warning
hi link LspDiagnosticsWarning Warning
hi link WarningMsg Warning
hi link Warnings Warning
hi Warning guifg=#f5c68f " warning
hi link DiagnosticWarn Warning
hi link DiagnosticError Error
hi link DiagnosticInfo Info
hi link DiagnosticHint Hint
hi link healthWarning Warning

" hi GitSignsChange guifg=#616e88 " modified
hi GitSignsChange guifg=#5ebdea " modified
hi GitSignsAdd guifg=#96c065
hi GitSignsDelete guifg=#f46a80

hi IndentBlanklineChar guifg=#616e88

" leap
hi LeapMatch guifg=yellow guibg=#5e81ac
hi LeapLabelPrimary guifg=yellow guibg=#474e6c
hi LeapLabelSecondary guifg=cyan guibg=#474e6c
hi LeapLabelSelected guifg=yellow guibg=#ff218c
hi LeapBackdrop guifg=#7e818b
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
"
"
" set the diagnostics floats to have the darker background like lualine
" try errors without underline and compare helpfulness
" update lualine colors to show icons in the same colors
" 
" coc highlights: https://github.com/neoclide/coc.nvim/blob/fab97c7db68f24e5cc3c1cf753d3bd1819beef8f/doc/coc.txt#L3139
"
" The best place to override highlight groups is a file named
" after/colors/<colorschemename> .vim in your 'runtimepath' (e.g.,
" ~/.config/nvim/after/colors/solarized.vim). Example declaration:
" >
" 	" make error texts have a red color
" 	highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" <
" Use |:highlight| with group name to check current highlight.

" Note: don't use `:hi default` for overwriting the highlights.

" Note: user defined highlight commands should appear after the |:colorscheme|
" command and use |ColorScheme| autocmd to make sure customized highlights works
" after color scheme change.

" Markdown related~

" *CocBold* for bold text.
" *CocItalic* for italic text.
" *CocUnderline* for underlined text.
" *CocStrikeThrough* for strikethrough text, like usage of deprecated API.
" *CocMarkdownCode* for inline code in markdown content.
" *CocMarkdownHeader* for markdown header in floating window/popup.
" *CocMarkdownLink* for markdown link text in floating window/popup.

" Diagnostics related~
" 							*coc-highlights-diagnostics*

" *CocFadeOut* for faded out text, such as for highlighting unnecessary code.
" *CocErrorSign* for error signs.
" *CocWarningSign* for warning signs.
" *CocInfoSign* for information signs.
" *CocHintSign* for hint signs.
" *CocErrorVirtualText* for error virtual text.
" *CocWarningVirtualText* for warning virtual text.
" *CocInfoVirtualText* for information virtual text.
" *CocHintVirtualText* for hint virtual text.
" *CocErrorHighlight* for error code range.
" *CocWarningHighlight* for warning code range.
" *CocInfoHighlight* for information code range.
" *CocHintHighlight* for hint code range.
" *CocDeprecatedHighlight* for deprecated code range, links to
" |CocStrikeThrough| by default.
" *CocUnusedHighlight* for unnecessary code range, links to |CocFadeOut| by
" default.
" *CocErrorLine* line highlight of sign which contains error.
" *CocWarningLine* line highlight of sign which contains warning.
" *CocInfoLine* line highlight of sign which information.
" *CocHintLine* line highlight of sign which contains hint.

" Highlight with higher priority would overwrite highlight with lower priority.
" The priority order:

" 	|CocUnusedHighlight| > |CocDeprecatedHighlight| > |CocErrorHighlight|
" 	> |CocWarningHighlight| > |CocInfoHighlight| > |CocHintHighlight|

" Document highlight related~
" 							*coc-highlights-document*

" Highlights used for highlighting same symbols in the buffer at the current
" cursor position.

" *CocHighlightText* default symbol highlight.
" *CocHighlightRead* for `Read` kind of document symbol.
" *CocHighlightWrite* for `Write` kind of document symbol.

" Float window/popup related~
" 							*coc-highlights-float*

" *CocFloating* default highlight group of floating windows/popups.
" Default links to |NormalFloat| on neovim and |Pmenu| on vim.
" *CocFloatThumb* thumb highlight of scrollbar.
" *CocFloatSbar* Scrollbar highlight of floating window/popups.
" *CocFloatDividingLine* for dividing lines, links to |NonText| by default.
" *CocFloatActive* for activated text, links to |CocSearch| by default.
" *CocErrorFloat* for error text in floating windows/popups.
" *CocHintFloat* for hint text in floating windows/popups.

" Inlay hint related~
" 							*coc-highlights-inlayHint*

" *CocInlayHint* for highlight inlay hint virtual text block, default uses
" foreground from |CocHintSign| and background from |SignColumn|
" *CocInlayHintParameter* for parameter kind of inlay hint.
" *CocInlayHintType* for type kind of inlay hint.

" Notification window/popup related~

" CocNotification 					*CocNotification*

" *CocNotificationProgress* for progress line in progress notification.
" *CocNotificationButton* for action buttons in notification window.
" *CocNotificationError* for highlight border of error notification.
" *CocNotificationWarning* for highlight border of warning notification.
" *CocNotificationInfo* for highlight border of info notification.

" List related~
" 							*CocList*

" *CocSearch* for matched characters.
" *CocListLine* for current cursor line.
" *CocListSearch* for matched characters.
" *CocListMode* for mode text in the statusline.
" *CocListPath* for cwd text in the statusline.
" *CocSelectedText* for sign text of selected lines (multiple selection only).
" *CocSelectedLine* for line highlight of selected lines (multiple selection only).

" Tree view related~

" CocTree 						*CocTree*

" *CocTreeTitle* for title in tree view.
" *CocTreeDescription* for description beside label.
" *CocTreeOpenClose* for open and close icon in tree view.
" *CocTreeSelected* for highlight lines contains selected node.

" Popup menu related~
" 							*CocPum*
" *CocPumSearch* for matched input characters, linked to |CocSearch| by default.
" *CocPumDetail* for highlight label details that follows label (including
" possible detail and description).
" *CocPumMenu* for menu of complete item.
" *CocPumShortcut* for shortcut text of source.
" *CocPumDeprecated* for deprecated label.
" *CocPumVirtualText* for virtual text which enabled by
" |coc-config-suggest-virtualText|

" Symbol icons~

" CocSymbol 						*CocSymbol*

" Highlight groups for symbol icons, including `CompletionItemKind` and
" `SymbolKind` of LSP.  The highlight groups link to related |nvim-treesitter|
" highlight groups when possible and fallback to builtin highlight groups.

" *CocSymbolDefault* linked to |hl-MoreMsg| by default.
" *CocSymbolText*
" *CocSymbolUnit*
" *CocSymbolValue*
" *CocSymbolKeyword*
" *CocSymbolSnippet*
" *CocSymbolColor*
" *CocSymbolReference*
" *CocSymbolFolder*
" *CocSymbolFile*
" *CocSymbolModule*
" *CocSymbolNamespace*
" *CocSymbolPackage*
" *CocSymbolClass*
" *CocSymbolMethod*
" *CocSymbolProperty*
" *CocSymbolField*
" *CocSymbolConstructor*
" *CocSymbolEnum*
" *CocSymbolInterface*
" *CocSymbolFunction*
" *CocSymbolVariable*
" *CocSymbolConstant*
" *CocSymbolString*
" *CocSymbolNumber*
" *CocSymbolBoolean*
" *CocSymbolArray*
" *CocSymbolObject*
" *CocSymbolKey*
" *CocSymbolNull*
" *CocSymbolEnumMember*
" *CocSymbolStruct*
" *CocSymbolEvent*
" *CocSymbolOperator*
" *CocSymbolTypeParameter*

" Note: Use configuration |coc-config-suggest-completionItemKindLabels| for customized icon
" characters.

" Semantic token highlight groups~
" 								*CocSem*

" Semantic highlight groups are starts with `CocSem` which link to related
" |nvim-treesitter| highlight groups when possible and fallback to builtin
" highlight groups, use variable |g:coc_default_semantic_highlight_groups| to
" disable creation of these highlight groups.

" Only semantic tokens types and `deprecated` modifier have default
" highlight groups.

" You need create highlight groups for highlight other modifiers and/or specific
" modifier with type, for example:
" >
" 	" Add highlights for defaultLibrary modifier
" 	hi link CocSemDefaultLibrary TSOtherDefaultLibrary
" 	hi link CocSemDefaultLibraryClass TSTypeDefaultLibrary
" 	hi link CocSemDefaultLibraryInterface TSTypeDefaultLibrary
" 	hi link CocSemDefaultLibraryEnum TSTypeDefaultLibrary
" 	hi link CocSemDefaultLibraryType TSTypeDefaultLibrary
" 	hi link CocSemDefaultLibraryNamespace TSTypeDefaultLibrary

" 	" Add highlights for declaration modifier
" 	hi link CocSemDeclaration TSOtherDeclaration
" 	hi link CocSemDeclarationClass TSTypeDeclaration
" 	hi link CocSemDeclarationInterface TSTypeDeclaration
" 	hi link CocSemDeclarationEnum TSTypeDeclaration
" 	hi link CocSemDeclarationType TSTypeDeclaration
" 	hi link CocSemDeclarationNamespace TSTypeDeclaration
" <
" The modifier highlight groups have higher priority.

" Others~

" *CocDisabled* highlight for disabled items, eg: menu item.
" *CocCodeLens* for virtual text of codeLens.
" *CocCursorRange* for highlight of activated cursors ranges.
" *CocLinkedEditing* for highlight of activated linked editing ranges.
" *CocHoverRange* for range of current hovered symbol.
" *CocMenuSel* for current menu item in menu dialog (should only provide
" background color).
" *CocSelectedRange* for highlight ranges of outgoing calls.
" *CocSnippetVisual* for highlight snippet placeholders.
" *CocLink* for highlight document links.
" *CocInputBoxVirtualText* for highlight placeholder of input box.
