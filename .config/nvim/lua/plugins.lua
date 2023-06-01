require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 40,
	      },
	      renderer = {
          group_empty = true,
        },
      }
    end,
  }

  use {
    "Pocco81/auto-save.nvim",
    config = function()
       require("auto-save").setup {}
    end
  }

  use 'jiangmiao/auto-pairs'

  use {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'kanagawa'
        }
      }
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    config = function()
      require('telescope').load_extension('fzy_native')
    end,
  }

  use 'jremmen/vim-ripgrep'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update { with_sync = true }
      ts_update()
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "vim", "scala", "kotlin" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end,
  }
end)
