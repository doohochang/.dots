return {
  setup = function()
    vim.opt.termguicolors = true

    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_style = 'default'
    vim.g.sonokai_transparent_background = 2
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_colors_override = {
      ['blue'] = { '#b39df3', '176' },
      ['purple'] = {'#76cce0', '110' },
    }

    vim.cmd('colorscheme sonokai')
  end
}
