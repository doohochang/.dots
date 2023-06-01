-- Disables Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader keys
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Vim options
local opt = vim.opt

local indent = 2
opt.number = true
opt.shiftwidth = indent
opt.expandtab = true
opt.tabstop = indent

require('plugins')
require('keys')
