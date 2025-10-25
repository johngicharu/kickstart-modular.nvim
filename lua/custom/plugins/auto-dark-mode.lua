return {
  'f-person/auto-dark-mode.nvim',
  config = function()
    local auto_dark_mode = require 'auto-dark-mode'
    auto_dark_mode.setup {
      update_interval = 1000, -- check every second
      set_dark_mode = function()
        vim.opt.background = 'dark'
        vim.cmd 'colorscheme tokyonight-moon'
      end,
      set_light_mode = function()
        vim.opt.background = 'light'
        vim.cmd 'colorscheme tokyonight-day'
      end,
    }
    auto_dark_mode.init()
  end,
}
