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
    end
  }

  use {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  }
end)
