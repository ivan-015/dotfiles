local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
end

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    require("nvim-tree").setup({
      on_attach = nvimtree_on_attach,
      diagnostics = {
        enable = true
      }
    })

    vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
  end
}
