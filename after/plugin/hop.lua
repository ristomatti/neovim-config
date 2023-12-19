local hop = require('hop')

local opts =  { remap = true }
vim.keymap.set('', 'f', function()
  hop.hint_char1()
end)

--vim.keymap.set('n', '/', '<Cmd>HopPattern<CR>', opts)

opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>s', '<Cmd>HopPattern<CR>', opts)

