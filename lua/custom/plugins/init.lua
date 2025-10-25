-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.relativenumber = true
vim.g.have_nerd_font = true
vim.o.tabstop = 2
vim.o.wrap = true
vim.o.shiftwidth = 2

require 'custom.plugins.toggleterm'
require 'custom.plugins.move'
require 'custom.plugins.tailwind-tools'
require 'custom.plugins.theme'
require 'custom.plugins.markdown'
require 'custom.plugins.auto-dark-mode'

vim.lsp.enable 'marksman'

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic' })
vim.keymap.set('n', '<bs>', '"_', { desc = 'Blackhole delete' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })

return {}
