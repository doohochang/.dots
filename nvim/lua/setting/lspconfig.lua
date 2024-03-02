return {
  setup = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

    lspconfig.jsonls.setup {
      capabilities = capabilities,
    }

    lspconfig.eslint.setup {
      capabilities = capabilities,
    }

    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- E.g.: For using `vim.*` functions, add vim.env.VIMRUNTIME/lua.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })
        end
        return true
      end,
    }
  end,
}
