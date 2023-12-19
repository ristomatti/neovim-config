vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
      }
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
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
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
        yadm = {
          enable = false
        },
      }
    end
  })

	-- Statusline
	use 'nvim-lualine/lualine.nvim'

	-- Tabline
	use 'nvim-tree/nvim-web-devicons'
	use 'romgrk/barbar.nvim'

	-- Syntax highlighting
	use 'maxmellon/vim-jsx-pretty'
	use 'pangloss/vim-javascript'
	use 'mxw/vim-jsx'
	use 'groenewege/vim-less'
	use 'othree/html5.vim'
	use 'elzr/vim-json'
	use 'cakebaker/scss-syntax.vim'
	use 'leafgarland/typescript-vim'
	use 'othree/javascript-libraries-syntax.vim'
	use 'ekalinin/Dockerfile.vim'
	use 'StanAngeloff/php.vim'
	use 'gutenye/json5.vim'
	use 'moll/vim-node'
	use 'potatoesmaster/i3-vim-syntax'
	use 'sngn/vim-i3blocks-syntax'
	use 'isobit/vim-caddyfile'
	use 'kmonad/kmonad-vim'

	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use 'nvim-treesitter/playground'
  use 'mbbill/undotree'
	use 'nvim-treesitter/nvim-treesitter-context'

	-- Navigation
  use {
    'smoka7/hop.nvim',
    tag = '*',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup {
        keys = 'etovxqpdygfblzhckisuran',
        case_insensitive = false,
        uppercase_labels = false,
      }
    end
  }

  -- Comments
  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').use_extended_mappings()
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
			--{
			--	"Exafunction/codeium.nvim",
			--	requires = {
			--		{"nvim-lua/plenary.nvim"}
			--	},
			--	config = function()
			--		require("codeium").setup({
			--		})
			--	end
			--},

			-- Snippets
			{'mattn/emmet-vim'},
			{'tpope/vim-surround'},
			{'docunext/closetag.vim'},
			{'myhere/vim-nodejs-complete'},

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
    end
  })

  use {
    'Exafunction/codeium.vim',
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }

  use 'eandrju/cellular-automaton.nvim'

end)

