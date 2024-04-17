return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    lualine.setup()
  end
}
