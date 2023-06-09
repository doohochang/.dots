return {
  setup = function()
    local metals_config = require('metals').bare_config()

    metals_config.init_options.statusBarProvider = "on"

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      enableSemanticHighlighting = true,
      serverVersion = 'latest.snapshot',
      bloopVersion = '1.5.8',
      ammoniteJvmProperties = {
        "-Xmx4G",
        "-Xms500M",
      },
      serverProperties = {
        "-Xmx4G",
        "-Xms500M",
      },
      -- For selecting test suites & cases properly.
      testUserInterface = "Test Explorer",
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
  end,
}
