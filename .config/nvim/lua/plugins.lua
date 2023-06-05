require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-startify'

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
    'Pocco81/auto-save.nvim',
    config = function()
       require('auto-save').setup {}
    end
  }

  use {
    'windwp/nvim-autopairs',
     config = function()
       require('nvim-autopairs').setup {}
     end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {}
    end
  }

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
      'nvim-telescope/telescope-fzy-native.nvim',
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
        ensure_installed = 'all',
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        additional_vim_regex_highlighting = false,
      }
    end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup {
        sources = {
          { name = 'nvim_lsp', priority = 10 },
          { name = 'buffer' },
          { name = 'vsnip' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        },
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        },
      }
    end,
  }

  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      local metals_config = require('metals').bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        serverVersion = "latest.snapshot",
      }

      metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

      local dap = require('dap')

      dap.configurations.scala = {
        {
          type = 'scala',
          request = 'launch',
          name = 'RunOrTest',
          metals = {
            runType = 'runOrTestFile',
          },
        },
        {
          type = 'scala',
          request = 'launch',
          name = 'Test Target',
          metals = {
            runType = 'testTarget',
          },
        },
      }

      metals_config.on_attach = function(client, bufnr)
        require('metals').setup_dap()
      end

      local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
      vim.api.nvim_create_autocmd(
        'FileType',
        {
          pattern = { 'scala', 'sbt', 'java' },
          callback = function()
            require('metals').initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        }
      )
    end
  }
end)
