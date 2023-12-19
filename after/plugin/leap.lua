local leap = require('leap')
local opts = leap.opts

leap.add_default_mappings()

opts.case_sensitive = true

vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red' })
