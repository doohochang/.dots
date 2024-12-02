local map = vim.keymap.set

-- Tree
map('n', '<leader>n', function() require('nvim-tree.api').tree.toggle() end)

-- Telescope
map('n', '<leader>ff', function() require('telescope.builtin').find_files { hidden = true } end)
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
map('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)

-- LSP
map('n', 'gD', vim.lsp.buf.definition)
map("n", "gtD", vim.lsp.buf.type_definition)
map('n', 'K', vim.lsp.buf.hover)
map("v", "K", function() require("metals").type_of_range() end)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'gds', function() require('telescope.builtin').lsp_document_symbols() end)
map('n', 'gws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end)
map('n', '<leader>cl', vim.lsp.codelens.run)
map('n', '<leader>sh', vim.lsp.buf.signature_help)
map({ 'n', 'i' }, '<c-s>', vim.lsp.buf.signature_help)
map('n', '<leader>rn', vim.lsp.buf.rename)
map(
  'n',
  '<leader>f',
  function()
    local ft = vim.bo.filetype
    if ft == "javascript"
        or ft == "javascriptreact"
        or ft == "javascript.jsx"
        or ft == "typescript"
        or ft == "typescriptreact"
        or ft == "typescript.tsx"
        or ft == "vue"
        or ft == "svelte"
        or ft == "astro" then
      vim.cmd("EslintFixAll")
    else
      vim.lsp.buf.format()
    end
  end
)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>aa', vim.diagnostic.setqflist)                                   -- all workspace diagnostics
map('n', '<leader>ae', function() vim.diagnostic.setqflist { severity = vim.diagnostic.severity.E } end) -- all workspace errors
map('n', '<leader>aw', function() vim.diagnostic.setqflist { severity = vim.diagnostic.severity.W } end) -- all workspace warnings
map('n', '<leader>d', vim.diagnostic.setloclist)                                   -- buffer diagnostics only
map('n', '[c', function() vim.diagnostic.goto_prev { wrap = false } end)
map('n', ']c', function() vim.diagnostic.goto_next { wrap = false } end)

-- Build server
map('n', '<leader>mc', function() require('telescope').extensions.metals.commands() end)
map('n', '<leader>ws', function() require('metals').hover_worksheet() end)
map('n', '<leader>tt', function() require('metals.tvp').toggle_tree_view() end)

-- DAP
map('n', '<leader>dc', function() require('dap').continue() end)
map('n', '<leader>dr', function() require('dap').repl.toggle() end)
map('n', '<leader>dK', function() require('dap.ui.widgets').hover() end)
map('n', '<leader>dt', function() require('dap').toggle_breakpoint() end)
map('n', '<leader>dso', function() require('dap').step_over() end)
map('n', '<leader>dsi', function() require('dap').step_into() end)
map('n', '<leader>dl', function() require('dap').run_last() end)

-- Clear the existing search highlights
map('n', '<c-c>', function() vim.cmd('noh') end)

-- Markdown Preview
map('n', '<leader>mp', function() vim.cmd('MarkdownPreview') end)
