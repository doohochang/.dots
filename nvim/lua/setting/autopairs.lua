return {
  setup = function()
    local autopairs = require('nvim-autopairs')
    local cond = require('nvim-autopairs.conds')

    autopairs.setup {
      fast_wrap = {},
    }

    -- Disables <CR> for round brackets in Scala.
    autopairs.get_rules('(')[1]:with_cr(cond.not_filetypes { 'scala', 'sbt' })
  end

}
