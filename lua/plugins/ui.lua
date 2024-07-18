return {
   -- colorscheme
   {
      'EdenEast/nightfox.nvim',
      lazy = true,
      -- priority = 1000,
      opts = {
         palettes = {
            carbonfox = {
               bg1 = '#001510',
               -- magenta = { base = "#BB88BB", bright = "#EE00EE", dim = "#882288", },
               comment = '#998888',
            },
         },
      },
      config = function(_, opts)
         require('nightfox').setup(opts)
         vim.cmd[[colorscheme carbonfox]]
      end,
   },
   {
      'rebelot/kanagawa.nvim',
      lazy = false,
      priority = 999,
      opts = {
         colors = { theme = { all = { ui = { bg_gutter = 'none' } } } },
      },
      config = function(_, opts)
         require('kanagawa').setup(opts)
         vim.cmd[[colorscheme kanagawa]]
      end,
   },
   {
      'folke/tokyonight.nvim',
      lazy = true,
      priority = 1000,
      opts = {
         on_colors = function(colors)
            colors.fg_gutter = '#3e4667' --line numbers and indent lines
            -- default: colors.fg_gutter = '#3e4667'
            colors.blue1 = '#8bcfff' --'#2ac3ee'
            colors.dark5 = colors.blue1
            -- conceal = math mode
         end,
      },
      config = function(_, opts)
         require('tokyonight').setup(opts)
         vim.cmd[[colorscheme tokyonight]]
      end,
   },
   { 'rose-pine/neovim', lazy=true },
   { 'catppuccin/nvim', lazy=true },
   { 'savq/melange-nvim', lazy=true },
   { 'sainnhe/gruvbox-material', lazy=true,
      config = function()
         vim.cmd[[
            " Important!!
            if has('termguicolors')
              set termguicolors
            endif

            " For dark version.
            set background=dark

            " For light version.
            set background=light

            " Set contrast.
            " This configuration option should be placed before `colorscheme gruvbox-material`.
            " Available values: 'hard', 'medium'(default), 'soft'
            let g:gruvbox_material_background = 'soft'

            " For better performance
            let g:gruvbox_material_better_performance = 1

            colorscheme gruvbox-material
        ]]
      end,
   },
   -- papercolor
   { 'NLKNguyen/papercolor-theme', lazy=true },
   { 'jsit/toast.vim', lazy=true },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      -- event = 'BufReadPre',
      event = 'VeryLazy',
      opts = {
         options = {
            theme = 'kanagawa',
         },
      },
   },
   {
      'lukas-reineke/indent-blankline.nvim',
      enabled = false,
      main = 'ibl',
      opts = {
         indent = { highlight = { 'Comment' } },
      },
   },
   { 'junegunn/vim-easy-align', }
   -- {
   --    'folke/noice.nvim',
   --    dependencies = {
   --       'MunifTanjim/nui.nvim',
   --       'rcarriga/nvim-notify',
   --    },
   --    event = 'VeryLazy',
   --    opts = {
   --       presets = {
   --          command_palette = true,
   --       },
   --       -- views = {
   --       --    cmdline_popup = {
   --       --    },
   --       -- },
   --    },
   -- },

   -- {
   --    'HiPhish/rainbow-delimiters.nvim',
   --    ft = { 'tex' },
   --    config = function()
   --       local rd = require('rainbow-delimiters')
   --       vim.g.rainbow_delimiters = {
   --          strategy = {
   --             latex = rd.strategy['local'],
   --          },
   --          query = {
   --             ['']  = 'rainbow-delimiters',
   --          },
   --          highlight = {
   --             'RainbowDelimiterRed',
   --             'RainbowDelimiterYellow',
   --             'RainbowDelimiterBlue',
   --             'RainbowDelimiterOrange',
   --             'RainbowDelimiterGreen',
   --             'RainbowDelimiterViolet',
   --             'RainbowDelimiterCyan',
   --          },
   --       }
   --    end,
   -- }
}
