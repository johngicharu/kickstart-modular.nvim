-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them.
-- `vim.fs.dir()` iteration order is unspecified and must not be relied upon.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

---@module 'lazy'
---@type LazySpec
vim.o.relativenumber = true
vim.g.have_nerd_font = true
vim.o.tabstop = 2
vim.o.wrap = true
vim.o.shiftwidth = 2

vim.lsp.enable 'marksman'
vim.lsp.config('tailwindcss', {})
vim.lsp.enable 'tailwindcss'

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic' })
vim.keymap.set('n', '<bs>', '"_', { desc = 'Blackhole delete' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })

return {}
