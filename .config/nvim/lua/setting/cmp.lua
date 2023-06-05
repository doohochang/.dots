local cmp = require('cmp')

return {
  setup = function()
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
