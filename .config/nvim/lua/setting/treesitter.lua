return {
  setup = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = 'all',
      highlight = {
        enable = true,
        -- disable = { 'scala' },
      },
      indent = {
        enable = true,
      },
      additional_vim_regex_highlighting = false,
    }

    -- Code folding
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.cmd('set nofoldenable')
  end,
}
