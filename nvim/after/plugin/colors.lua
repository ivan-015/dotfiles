function ApplyColorScheme(color)
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)
end

function LineNumberColors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'gray', bold = true })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = false })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'gray', bold = true })
end

LineNumberColors()
