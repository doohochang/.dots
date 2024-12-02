return {
  setup = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Json
    lspconfig.jsonls.setup {
      capabilities = capabilities,
    }

    -- Yaml
    lspconfig.yamlls.setup {
      capabilities = capabilities,
    }

    -- Go
    lspconfig.gopls.setup {
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
      on_init = function()
        autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            -- buf_request_sync defaults to a 1000ms timeout. Depending on your
            -- machine and codebase, you may want longer. Add an additional
            -- argument after params if you find that you have to write the file
            -- twice for changes to be saved.
            -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
            for cid, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                  vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    }

    -- Python
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

    -- VSCode language servers extracted
    lspconfig.html.setup {
      capabilities = capabilities,
    }

    lspconfig.cssls.setup {
      capabilities = capabilities,
    }

    lspconfig.eslint.setup {
      capabilities = capabilities,
    }

    -- MDX
    lspconfig.mdx_analyzer.setup {
      capabilities = capabilities,
    }

    -- Biome
    lspconfig.biome.setup {
      capabilities = capabilities,
    }

    -- Remark
    lspconfig.remark_ls.setup {
      capabilities = capabilities,
    }

    -- Unocss
    lspconfig.unocss.setup {
      capabilities = capabilities,
    }

    -- Lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}
