return {
  setup = function()
    local function metals_status()
      return vim.g["metals_status"] or ""
    end

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed
        }
      end
    end

    require('lualine').setup {
      options = {
        theme = 'sonokai'
      },
      sections = {
        lualine_b = {
          'branch',
          {
            'diff',
            source = diff_source,
          },
          'diagnostics',
        },
        lualine_x = {
          metals_status,
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    }
  end
}
