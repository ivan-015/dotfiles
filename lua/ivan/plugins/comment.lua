return {
  'numToStr/Comment.nvim',
  config = function()
    local comment = require('Comment')
    comment.setup({
      toggler = {
        line = '<C-_>',
      },
      opleader = {
        line = '<C-_>',
      }
    })
  end
}
