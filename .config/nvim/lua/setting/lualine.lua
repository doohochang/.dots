local function metals_status()
  return vim.g["metals_status"] or ""
end

return {
  setup = function()
    require('lualine').setup {
      options = {
        theme = 'kanagawa'
      },
      sections = {
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
