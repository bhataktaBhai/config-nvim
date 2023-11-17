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
      -- opts = {
      --    overrides = function (colors)
      --       local math_mode = { fg = colors.palette.lotusBlue2 }
      --       local nonbold   = { italic = false }
      --       return {
      --          texMathZone = math_mode,
      --          texMathDelimZone = math_mode,
      --          texMathDelim = math_mode,
      --          Conceal = math_mode,
      --          texTabularChar = math_mode, -- for ampersand
      --          texMathOper = math_mode,
      --          texCmd = nonbold,
      --       }
      --    end,
      -- },
      config = function(_, opts)
         require('kanagawa').setup(opts)
         vim.cmd[[colorscheme kanagawa]]
      end,
   },
   {
      'folke/tokyonight.nvim',
      lazy = false,
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
   { 'morhetz/gruvbox' },
   { 'rose-pine/neovim' },
   { 'catppuccin/nvim' },
   { 'savq/melange-nvim' },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      event = 'VeryLazy',
      opts = {
         options = {
            theme = 'auto',
         },
      },
   },
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
   {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      event = { 'BufReadPre', 'BufNewFile' },
   },

   {
      'HiPhish/rainbow-delimiters.nvim',
      ft = { 'tex' },
      config = function()
         local rd = require('rainbow-delimiters')
         vim.g.rainbow_delimiters = {
            strategy = {
               latex = rd.strategy['local'],
            },
            query = {
               ['']  = 'rainbow-delimiters',
            },
            highlight = {
               'RainbowDelimiterRed',
               'RainbowDelimiterYellow',
               'RainbowDelimiterBlue',
               'RainbowDelimiterOrange',
               'RainbowDelimiterGreen',
               'RainbowDelimiterViolet',
               'RainbowDelimiterCyan',
            },
         }
      end,
   }
}
