require('rose-pine').setup({
  disable_background = true
})

function SetTheme(color, overrideBgColor)
  if (color == 'falcon') then
    vim.g.falcon_lightline = 1
    vim.g.airline_theme = 'falcon'
    vim.g.falcon_background = 0
    vim.g.falcon_inactive = 0
  end

  vim.cmd.colorscheme(color)

  if (overrideBgColor) then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

vim.cmd.colorscheme('meh')
