return {
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup {}
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
  -- {
  --   'Pocco81/auto-save.nvim',
  --   event = 'InsertEnter',
  --   config = function()
  --      require('auto-save').setup {}
  --   end
  -- },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = require('setting.autopairs').setup,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require("ibl").setup {}

      -- This plugin seems to hide line numbers during setup for now.
      -- Added the below code to show line numbers properly.
      vim.opt.number = true
      vim.opt.relativenumber = true
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
    'lewis6991/gitsigns.nvim',
    config = require('setting.gitsigns').setup,
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
    'j-hui/fidget.nvim',
    lazy = true,
    config = function()
      require('fidget').setup {
        notification = {
          window = {
            winblend = 0, -- Sets transparent background.
          },
        },
      }
      -- Sets highlight group to VirtualTextInfo in Sonokai.
      vim.cmd('highlight link FidgetTitle VirtualTextInfo')
      vim.cmd('highlight link FidgetTask VirtualTextInfo')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim',
      'hrsh7th/nvim-cmp',
    },
    lazy = true,
    config = require('setting.lspconfig').setup,
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
    -- keys = { "<leader>ml", "<cmd>LoadMetals<cr>", desc = "Load Metals" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'hrsh7th/nvim-cmp',
    },
    config = require('setting.metals').setup,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          quotePreference = 'single',
          importModuleSpecifierPreference = 'non-relative',
        },
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "gs" -- Google Apps Script files
      },
    },
  },
  {
    'stevearc/conform.nvim', -- It works only if Prettier is installed.
    cmd = { 'ConformInfo' },
    ft = { 'markdown' },
    config = require('setting.conform').setup,
  },
}
