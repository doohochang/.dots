return {
  setup = function()
    local conform = require("conform")

    conform.setup {
      formatters_by_ft = {
        markdown = { "prettier" },
      },
    }

    -- vim.lsp.buf.format 호출 시 conform을 사용하도록 설정
    local orig_format = vim.lsp.buf.format
    vim.lsp.buf.format = function(opts)
      opts = opts or {}
      local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

      -- Markdown 파일인 경우 conform 사용
      if vim.bo[bufnr].filetype == "markdown" then
        conform.format {
          bufnr = bufnr,
          lsp_fallback = false, -- LSP fallback 사용 안 함 (conform만 사용)
          async = opts.async,
        }
      else
        -- 다른 파일 타입은 기존 LSP 포맷터 사용
        orig_format(opts)
      end
    end
  end,
}
