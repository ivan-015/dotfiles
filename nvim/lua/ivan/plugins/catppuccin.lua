return {
  {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      ---@type CatppuccinOptions
      require('catppuccin').setup()
    end
  }
}
