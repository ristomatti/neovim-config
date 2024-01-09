local builtin = require('telescope.builtin')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, opts)
vim.keymap.set('n', '<leader>fd', builtin.lsp_dynamic_workspace_symbols, opts)

