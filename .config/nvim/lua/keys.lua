local map = vim.keymap.set

local nvim_tree = require('nvim-tree.api')
map('n', '<leader>n', nvim_tree.tree.toggle)
