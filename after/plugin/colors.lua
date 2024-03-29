function ApplyColorScheme(color)
	color = color or 'catppuccin'
	vim.cmd.colorscheme(color)
end

ApplyColorScheme()
