require('rose-pine').setup({
    disable_background = true
})

function SetColor(color)
	--vim.g.falcon_lightline = 1
	--vim.g.airline_theme = 'falcon'
	--vim.g.falcon_background = 0
	--vim.g.falcon_inactive = 0

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

--setColor('rose-pine-moon')
--setColor('falcon')
--setColor('sierra')
SetColor('my_vivid')
SetColor('meh')

