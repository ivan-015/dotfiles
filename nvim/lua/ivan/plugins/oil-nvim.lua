return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require('oil').setup({
      cleanup_delay_ms = 5000,
    })
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent directory' })
  end
}
