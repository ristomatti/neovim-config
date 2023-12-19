local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

-- Remap standard functions
map('n', '<Leader>w', '<Cmd>w<CR>', opts)
map('n', '<Leader>x', '<Cmd>x<CR>', opts)
map('n', '<Leader>q', '<Cmd>q<CR>', opts)
map('n', '<Leader>Q', '<Cmd>q!<CR>', opts)

--map('n', '<Leader>e', ':edit<Space>', { noremap = true})

-- Remap fugitive git commands
map('n', '<Leader>gs', '<Cmd>Git<CR>', opts)
map('n', '<Leader>gb', '<Cmd>Gblame<CR>', opts)
map('n', '<Leader>gc', '<Cmd>Gcommit<CR>', opts)
map('n', '<Leader>gl', '<Cmd>log<CR>', opts)
map('n', '<Leader>gp', '<Cmd>push', opts)

-- Move to previous/next
map('n', '<M-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<M-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<M-i>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<M-k>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<M-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<M-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<M-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<M-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<M-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<M-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<M-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<M-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<M-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<M-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<M-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<M-w>', '<Cmd>BufferClose<CR>', opts)
map('n', '<Leader>d', '<Cmd>BufferClose<CR>', opts)

-- Window management
map('n', '<C-M-i>', '<C-W>k', { noremap = true })   -- move up
map('n', '<C-M-j>', '<C-W>h', { noremap = true })   -- move left
map('n', '<C-M-k>', '<C-W>j', { noremap = true })   -- move down
map('n', '<C-M-l>', '<C-W>l', { noremap = true })   -- move right

map('n', '<M-s>', '<C-W>x', { noremap = true })   -- swap
map('n', '<M-q>', '<C-W>q', { noremap = true })   -- close
map('n', '<M-S-i>', '<C-W>q', { noremap = true }) -- close
map('n', '<M-S-j>', '<C-W>q', { noremap = true }) -- close
map('n', '<M-S-k>', '<C-W>s', { noremap = true }) -- split horizontally
map('n', '<M-S-l>', '<C-W>v', { noremap = true }) -- split vertically

