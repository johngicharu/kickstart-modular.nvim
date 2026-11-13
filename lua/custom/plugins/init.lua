-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them.
-- `vim.fs.dir()` iteration order is unspecified and must not be relied upon.
--local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
--for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
--  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
--    local module = file_name:gsub('%.lua$', '')
--    require('custom.plugins.' .. module)
--  end
--end

---@module 'lazy'
-- ---@type LazySpec
vim.o.relativenumber = true
vim.g.have_nerd_font = true
vim.o.tabstop = 2
vim.o.wrap = true
vim.o.shiftwidth = 2

vim.lsp.enable 'marksman'
vim.lsp.config('tailwindcss', {})
vim.lsp.enable 'tailwindcss'

--  folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldcolumn = '0' -- Change to '1' if you want a visible folding column
vim.o.foldlevel = 99 -- UFO requires a high global fold level
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic' })
vim.keymap.set('n', '<bs>', '"_', { desc = 'Blackhole delete' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })

--vim.filetype.add {
--  extension = {
--    mq4 = 'mql5',
--    mq5 = 'mql5',
--    mqh = 'mql5',
--  },
--}
--vim.treesitter.language.register('cpp', 'mql5')
-- nvim 0.11 and above
--vim.lsp.config('mql5_lsp', {
--  cmd = { '/Users/gicharu/dev/mql5-language-server/target/release/mql5-lsp' },
--  filetypes = { 'mql5' },
--  root_markers = { 'MQL5', '.git' },
-- })

--vim.lsp.enable 'mql5_lsp'
-- 2. Start and attach mql5-lsp whenever an mql5 buffer opens
-- vim.api.nvim_create_autocmd("FileType", {
-- pattern = "mql5",
-- callback = function(args)
-- Look upward for an "MQL5" or ".git" folder; fall back to the current file's folder
-- local root_match = vim.fs.find({ "MQL5", ".git" }, {
--   upward = true,
--  path = vim.fs.dirname(args.file),
-- })[1]

-- local root_dir = root_match and vim.fs.dirname(root_match) or vim.fs.dirname(args.file)

-- vim.lsp.start({
-- name = "mql5-lsp",
-- cmd = { "/Users/gicharu/dev/mql5-language-server/target/release/mql5-lsp" }, -- Update with your compiled binary path
-- root_dir = root_dir,
-- capabilities = vim.lsp.protocol.make_client_capabilities(),
-- })
-- end,
-- })

return {}
