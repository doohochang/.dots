-- Disables Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader keys
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Initializes lazy.nvim
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

local plugins = require('plugins')
require('lazy').setup(plugins)

-- Vim options
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

local opt = vim.opt

local indent = 2
opt.number = true
opt.shiftwidth = indent
opt.expandtab = true
opt.tabstop = indent
opt.splitright = true
opt.splitbelow = true

require('keys')

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd('set nofoldenable')
