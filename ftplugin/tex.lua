local palettes = {
   carbonfox = {
      comment = '#998888',
      bg1 = '#111111',
      -- skim
      -- bg1 = '#2D2D2D',
      fg1 = '#E0E0E0',
      -- vimtex conceal uses bg4
      bg4 = '#2B96D9' -- default cyan base
   },
}

require('nightfox').setup({
   palettes = palettes,
})

vim.cmd([[colorscheme carbonfox]])

require('lualine').setup({
   options = {
      theme = 'carbonfox',
   },
   sections = {
      lualine_x = {'encoding', 'fileformat', function()
         return ''
      end},
   },
})
