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

require('lazy').setup(require('plugins'))

-- Options
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

local opt = vim.opt

local indent = 2
opt.relativenumber = true
opt.shiftwidth = indent
opt.expandtab = true
opt.tabstop = indent
opt.splitright = true
opt.splitbelow = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Auto-reloading when the file is modified externally.
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

require('keys')
require('commands')
