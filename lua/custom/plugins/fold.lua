return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = { 'BufReadPost', 'BufNewFile' }, -- Reliable trigger for new and existing files
  init = function()
    -- These MUST be global options set BEFORE the plugin loads
    vim.o.foldcolumn = '0' -- Change to '1' if you want a visible folding column
    vim.o.foldlevel = 99   -- UFO requires a high global fold level
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    -- Tell UFO to pull folding details from LSP or fall back to indentation
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
    })

    -- Explicitly bind keymaps using standard Neovim API inside the config blocks
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
  end,
}
