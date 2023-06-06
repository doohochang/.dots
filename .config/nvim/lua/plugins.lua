return {
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd('colorscheme kanagawa')
  --   end,
  -- },
  {
    'sainnhe/sonokai',
    priority = 1000,
    config = require('setting.sonokai').setup,
  },
  { 'mhinz/vim-startify' },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('setting.tree').setup,
  },
  {
    'Pocco81/auto-save.nvim',
    event = 'InsertEnter',
    config = function()
       require('auto-save').setup {}
    end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = require('setting.autopairs').setup,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require("indent_blankline").setup {}
    end
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function()
      require('Comment').setup {}
    end,
  },
  {
    'RRethy/vim-illuminate',
    event = 'BufRead',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('setting.lualine').setup,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = require('setting.telescope').setup,
  },
  {
    'jremmen/vim-ripgrep',
    cmd = "Rg",
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground'
    },
    build = ':TSUpdate',
    config = require('setting.treesitter').setup,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function() vim.fn['mkdp#util#install']() end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = require('setting.cmp').setup,
  },
  {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'hrsh7th/nvim-cmp',
    },
    config = require('setting.metals').setup,
  }
}
