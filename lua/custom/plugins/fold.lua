return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost', -- Lazy load after buffer read
  opts = {
    -- Setup provider for LSP, treesitter, or indent
    provider_selector = function(bufnr, filetype, buftype) return { 'lsp', 'indent' } end,
  },
  init = function()
    -- Fold options
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  keys = {
    -- Keymaps for folding
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
  },
}
