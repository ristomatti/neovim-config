local leap = require('leap')
local opts = leap.opts

leap.add_default_mappings()
opts.case_sensitive = true

-- Tweak colors
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red' })

-- Disable default keymaps
vim.keymap.del({ 'x', 'o' }, 'x')
vim.keymap.del({ 'x', 'o' }, 'X')
vim.keymap.del({ 'v' }, 's')
vim.keymap.del({ 'v' }, 'S')

-- Prefix mappings with C-
vim.keymap.set({ 'v' }, '<C-s>', '<Plug>(leap-forward)')
vim.keymap.set({ 'v' }, '<C-S>', '<Plug>(leap-backward)')
vim.keymap.set({ 'o', 'x' }, '<C-x', '<Plug>(leap-forward-till)')
vim.keymap.set({ 'o', 'x' }, '<C-X', '<Plug>(leap-backward-till)')

