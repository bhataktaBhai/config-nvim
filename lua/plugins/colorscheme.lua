return {
   {
      'EdenEast/nightfox.nvim',
      lazy = false,
      priority = 1000,
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
         vim.cmd([[colorscheme carbonfox]])
      end,
   },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
         options = {
            theme = 'auto',
         },
      },
   },
}
