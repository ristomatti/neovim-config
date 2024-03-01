vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Continuousoly save session
  use 'tpope/vim-obsession'

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  use({
    'ggandor/leap.nvim',
    requires =  {
      {'tpope/vim-repeat'}
    }
  })

  -- Editing
  use({
      'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup({
        i = { '' },
      })
    end
  })

  -- Training wheels
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup { }
    end
  }

  -- Colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use 'antonk52/lake.nvim'
  use 'atelierbram/Base4Tone-nvim'
  use 'davidosomething/vim-colors-meh'
  use 'DeviusVim/deviuspro.nvim'
  use 'fenetikm/falcon'
  use 'RaphaeleL/my_vivid'
  use 'water-sucks/darkrose.nvim'

  use({
    'zaldih/themery.nvim',
    config = function()
      require('themery').setup({
        themes = {
          'base4tone_classic_a_dark',
          'base4tone_classic_b_dark',
          'base4tone_classic_c_dark',
          'base4tone_classic_d_dark',
          'base4tone_classic_e_dark',
          'base4tone_classic_f_dark',
          'base4tone_classic_i_dark',
          'base4tone_classic_l_dark',
          'base4tone_classic_o_dark',
          'base4tone_classic_p_dark',
          'base4tone_classic_q_dark',
          'base4tone_classic_r_dark',
          'base4tone_classic_s_dark',
          'base4tone_classic_s_dark',
          'base4tone_classic_t_dark',
          'base4tone_classic_u_dark',
          'base4tone_classic_w_dark',
          'base4tone_modern_e_dark',
          'base4tone_modern_n_dark',
          'base4tone_modern_w_dark',
          'darkrose',
          'deviuspro',
          'falcon',
          'lake',
          'meh',
          'my_vivid',
          'rose-pine-moon',
        }
      })
    end
  })

  -- Git
  use 'tpope/vim-fugitive'
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
    end
  })

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Tabline
  use 'nvim-tree/nvim-web-devicons'
  use 'romgrk/barbar.nvim'

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use 'nvim-treesitter/playground'
  use({'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  })
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Comments
  use {
    'b3nj5m1n/kommentary',
    config = function()
        local config = require('kommentary.config')
        config.use_extended_mappings()
        config.configure_language('default', {
          prefer_single_line_comments = true
        })
    end
  }

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      --{'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Comments
      { 'JoosepAlviste/nvim-ts-context-commentstring',
      requires =  { 'b3nj5m1n/kommentary' },
      config = function()
          require('ts_context_commentstring').setup {
              enable_autocmd = false,
          }
          require('kommentary.config').configure_language('default', {
              single_line_comment_string = 'auto',
              multi_line_comment_strings = 'auto',
              hook_function = function()
                  require('ts_context_commentstring').update_commentstring()
              end,
          })
      end
    },

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    require('cmp').setup({
      sources = {
        --{ name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
      }
    })
  end})

  -- Codeium autocompletion
  use {
    'Exafunction/codeium.vim',
    config = function ()
      vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set({ 'n', 'i' }, '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }

  -- Syntax
  use 'potatoesmaster/i3-vim-syntax'
  use 'sngn/vim-i3blocks-syntax'

  -- Syntax (enable if still needed)
  -- use 'maxmellon/vim-jsx-pretty'
  -- use 'pangloss/vim-javascript'
  -- use 'mxw/vim-jsx'
  -- use 'groenewege/vim-less'
  -- use 'othree/html5.vim'
  -- use 'elzr/vim-json'
  -- use 'cakebaker/scss-syntax.vim'
  -- use 'leafgarland/typescript-vim'
  -- use 'othree/javascript-libraries-syntax.vim'
  -- use 'ekalinin/Dockerfile.vim'
  -- use 'StanAngeloff/php.vim'
  -- use 'gutenye/json5.vim'
  -- use 'moll/vim-node'
  -- use 'isobit/vim-caddyfile'

  -- Editing (enable if still needed)
  -- use 'mattn/emmet-vim'
  -- use 'tpope/vim-surround'
  -- use 'docunext/closetag.vim'
  -- use 'myhere/vim-nodejs-complete'

  use 'eandrju/cellular-automaton.nvim'
end)

