-- Disables Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable markdown recommended style (which sets tab width to 4)
vim.g.markdown_recommended_style = 0

-- Leader keys
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Options
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

local opt = vim.opt

local indent = 2
opt.number = true
opt.relativenumber = true
opt.shiftwidth = indent
opt.expandtab = true
opt.tabstop = indent
opt.splitright = true
opt.splitbelow = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.cmd('filetype indent off')

-- Auto-reloading when the file is modified externally.
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Google Apps Script support: treat .gs files as JavaScript
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.gs" },
  command = "set filetype=javascript",
})

require('keys')
require('commands')
