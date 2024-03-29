local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')

-- Manually trigger autocompletion
-- cmp.setup({
-- 	completion = {
-- 		autocomplete = false
-- 	},
-- 	mapping = {
-- 		['C-Space'] = cmp.mapping.complete(),
-- 		['M-Space'] = cmp.mapping.complete()
-- 	}
-- })
-- cmp.setup.buffer {
-- 	completion = {
-- 		autocomplete = false
-- 	}
-- }

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<M-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = vim.NIL
cmp_mappings['<S-Tab>'] = vim.NIL

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "Q", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>ve", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>ee", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>eE", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  opts = { silent = true, noremap = true }
  vim.keymap.set("n", "<leader>vs", '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
  vim.keymap.set("n", "<A-s>", '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

