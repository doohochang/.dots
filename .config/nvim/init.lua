-- Disables Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader keys
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Vim options
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

local opt = vim.opt

local indent = 2
opt.number = true
opt.shiftwidth = indent
opt.expandtab = true
opt.tabstop = indent

require('plugins')
require('keys')

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd('set nofoldenable')
