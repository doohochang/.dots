return {
  setup = function()
    local metals_config = require('metals').bare_config()

    metals_config.init_options.statusBarProvider = "on"

    metals_config.find_root_dir_max_project_nesting = 2

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      enableSemanticHighlighting = true,
      serverVersion = 'latest.snapshot',
      -- For selecting test suites & cases properly.
      testUserInterface = "Test Explorer",
    }

    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    metals_config.tvp = {
      icons = {
        enabled = true,
      },
    }

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
  end,
}
