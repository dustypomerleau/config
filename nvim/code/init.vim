" This file is mostly deprecated, but provides limited vim bindings in VS Code
" I haven't had time to update this to match my Lua config, and rarely use it.

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'andymass/vim-matchup'
    Plug 'arsham/arshlib.nvim',
    Plug 'arsham/indent-tools.nvim',
    Plug 'bkad/CamelCaseMotion'
    Plug 'christoomey/vim-sort-motion'
    Plug 'easymotion/vim-easymotion'
    Plug 'inkarkat/vim-ReplaceWithRegister'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
call plug#end()

nnoremap <space> <nop>
let maplocalleader = "\<space>"
let mapleader = ","
set ignorecase smartcase
set iskeyword-=_
set matchpairs+=<:>
set synmaxcol=0 " turn this off if perf suffers

" use \ for moving backward in fF and tT movements
noremap \ ,

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
let g:EasyMotion_smartcase = 1
" map <leader> <Plug>(easymotion-prefix)
" map <leader>; <Plug>(easymotion-next)
" map <leader>E <Plug>(easymotion-bd-E)
" map <leader>N <Plug>(easymotion-bd-N)
" map <leader>T <Plug>(easymotion-bd-T)
" map <leader>W <Plug>(easymotion-bd-W)
" map <leader>\ <Plug>(easymotion-previous)
" map <leader>e <Plug>(easymotion-bd-e)
map <leader>k <Plug>(easymotion-bd-jk)
map <leader>n <Plug>(easymotion-bd-n)
map <leader>s <Plug>(easymotion-s)
" map <leader>t <Plug>(easymotion-bd-t)
" map <leader>w <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s)

" sortmotion
let g:sort_motion_flags = 'i'

" easier window splits and navigation between split buffers
" we only remap horizontal moves, because, you already remapped <C-K> and you
" don't really use horizontal splits much.
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END

" vim-commentary
autocmd FileType edgeql setlocal commentstring=#\ %s
autocmd FileType json setlocal commentstring=//\ %s
autocmd FileType latex setlocal commentstring=%\ %s
autocmd FileType svelte setlocal commentstring=\<!--\ %s\ --\>

" dismiss search highlight with ctrl-K
nnoremap <silent> <C-K> :noh<CR>

lua << END
require("indent-tools").config({})
END
