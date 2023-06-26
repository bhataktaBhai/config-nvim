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
      init = function()
         vim.cmd([[colorscheme carbonfox]])
      end,
   },
   {
      'nvim-lualine/lualine.nvim',
      lazy = false,
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
         options = {
            theme = 'auto',
         },
      },
   },
}
