return {
  setup = function()
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
