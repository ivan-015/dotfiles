return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git', '--glob', '*.env' }
        }
      }
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

    vim.keymap.set('n', '<leader>fr', function()
      builtin.lsp_references()
    end)
  end
}
