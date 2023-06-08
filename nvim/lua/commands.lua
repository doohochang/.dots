-- Grep using Telescope in files that match the given glob
vim.api.nvim_create_user_command(
  'Fg',
  function(opts)
    local glob = opts.fargs[1]
    require('telescope.builtin').live_grep {
      glob_pattern = glob
    }
  end,
  { nargs = 1 }
)
