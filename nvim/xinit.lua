local let = vim.g
local set = vim.opt

vim.api.nvim_set_keymap("n", " ", "", { noremap = true, })
let.mapleader = ","
let.maplocalleader = " "

let.lsp_semantic_enabled = 1

set.breakindent = true -- keep indent when lines break
set.breakindentopt = "shift:2" -- but shift by 2 spaces
set.cursorline = true -- highlight the cursor line
set.expandtab = true -- tabs are spaces
set.ignorecase = true -- lowercase search is case insensitive
set.iskeyword:remove("_") -- move by word in snake_case
set.linebreak = true -- soft wrap at certain chars, not in the middle of words
set.matchpairs:append("<:>")
set.nolist = true -- hide whitespace characters
set.number = true -- line numbers
set.shiftwidth = 4 -- number of spaces used for autoindent
set.smartcase = true -- uppercase search is case sensitive
set.softtabstop = 4 -- number of spaces in a tab when editing
set.synmaxcol = 0 -- highlight lines of any length
set.tabstop = 4 -- number of visual spaces per tab
set.termguicolors = true
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

require("lazy").setup("plugins")
require("keys")
