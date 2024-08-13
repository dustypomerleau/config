-- a full list of vim options in lua can be found in the generated file:
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_meta/options.lua

local let = vim.g
local set = vim.opt

-- leaders must be declared before lazy.nvim does any mappings
vim.api.nvim_set_keymap("n", " ", "", { noremap = true, })
let.mapleader = ","
let.maplocalleader = " "

let.lsp_semantic_enabled = 1
-- "non-modifiable, not-modified, numbers, nowrap, read-only, not-buflisted"
let.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

set.breakindent = true -- keep indent when lines break
set.completeopt = { "menuone", "noselect", "noinsert", }
set.splitbelow = true
set.splitright = true
set.breakindentopt = "shift:2" -- but shift by 2 spaces
set.cursorline = true -- highlight the cursor line
set.expandtab = true -- tabs are spaces
set.ignorecase = true -- lowercase search is case insensitive
set.iskeyword:remove("_") -- move by word in snake_case
set.linebreak = true
set.matchpairs:append("<:>")
set.number = true -- line numbers
set.shiftwidth = 4 -- number of spaces used for autoindent
set.shortmess = vim.opt.shortmess + { c = true, } -- don't give completion messages (:h shortmess)
set.signcolumn = "yes"
set.smartcase = true -- uppercase search is case sensitive
set.softtabstop = 4 -- number of spaces in a tab when editing
set.swapfile = false
set.synmaxcol = 0 -- highlight lines of any length
set.tabstop = 4 -- number of visual spaces per tab
set.termguicolors = true
set.updatetime = 300
set.undofile = true
set.wrap = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { checker = { enabled = true, }, })

require("keys")

-- Commented out, as Conform is calling this as a fallback automatically.
-- vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]])

-- -- highlight playground
-- local t = require("tol.colors")
-- vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = t.diff_emph_plus, })
