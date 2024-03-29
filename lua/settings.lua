local function set_opts(opts)
  for k, v in pairs(opts) do
    vim.opt[k] = v
  end
end

set_opts {
  clipboard = 'unnamedplus',      -- use system clipboard
  guicursor = '',                 -- hide the cursor
  title = true,                   -- set window title
  mouse = 'a',                    -- enable mouse support
  number = true,                  -- enable line numbers
  relativenumber = true,          -- enable relative line numbers
  tabstop = 4,                    -- number of spaces a tab counts for
  softtabstop = 4,                -- number of spaces a tab counts for while performing editing operations
  shiftwidth = 4,                 -- number of spaces used for each step of (auto)indent
  expandtab = true,               -- convert tabs to spaces
  smartindent = true,             -- smarter autoindenting for programming languages
  wrap = false,                   -- disable line wrapping
  swapfile = false,               -- disable swap file creation
  backup = false,                 -- disable backup file creation
  undofile = true,                -- enable persistent undo
  hlsearch = false,               -- don't highlight all matches of last search pattern
  incsearch = true,               -- show where a pattern matches as you type
  termguicolors = true,           -- enable true color support
  scrolloff = 6,                  -- keep at least 8 lines above/below the cursor
  splitbelow = true,              -- create horizontal split below
  splitright = true,              -- create vertical split on the right
  signcolumn = 'yes',             -- always show signcolumn
  updatetime = 50,                -- time to wait in milliseconds before swap file is written to disk
  colorcolumn = '120',            -- highlight column position
  cursorline = true,              -- highlight current line
  pastetoggle = 'auto',           -- enable paste mode
  gdefault = true,                -- enable global default
  ttyfast = true,                 -- enable fast terminal connection
  backspace = 'indent,eol,start', -- backspace for dummies
}

-- The given line of code modifies the 'isfname' option in Vim, which determines what characters are
-- considered to be part of a filename. vim.opt.isfname:append("@-@") adds '@' and '-' to the set of
-- characters that are part of a filename.
-- This is especially useful when dealing with filenames that contain these characters, such as email
-- addresses or filenames with hyphens. It handles operations like word motion commands (w, b, e)
-- more appropriately for these filenames.
vim.opt.isfname:append("@-@")

