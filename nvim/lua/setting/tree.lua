return {
  setup = function()
    require('nvim-tree').setup {
      view = {
        width = 50,
      },
      renderer = {
        group_empty = true,
      },
      git = {
        ignore = false,
      }
    }
  end,
}
