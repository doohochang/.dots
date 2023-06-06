return {
  setup = function()
    vim.opt.termguicolors = true

    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_style = 'default'
    vim.g.sonokai_transparent_background = 2
    vim.g.sonokai_enable_italic = 1

    vim.cmd('colorscheme sonokai')
  end
}
