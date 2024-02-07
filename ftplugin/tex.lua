-- local palettes = {
--    carbonfox = {
--       comment = '#998888',
--       -- bg1 = '#11140D',
--       -- skim
--       -- bg1 = '#2D2D2D',
--       fg1 = '#CACACA',
--       -- vimtex conceal uses bg4
--       bg4 = '#81B2D9' -- default cyan base
--    },
-- }
--
-- require('nightfox').setup({
--    palettes = palettes,
-- })
--
-- vim.cmd[[colorscheme tokyonight-moon]]
local opts = {
   -- statementStyle = { bold = false },
   overrides = function (colors)
      local math_mode = { fg = colors.palette.lotusBlue2, bold = false }
      local nonbold   = { fg = colors.palette.oniViolet, bold = false }
      return {
         texMathZone = math_mode,
         texMathDelimZone = math_mode,
         texMathDelim = math_mode,
         Conceal = math_mode,
         texTabularChar = math_mode, -- for ampersand
         texMathOper = math_mode,
         texCmd = nonbold,
      }
   end,
}
require('kanagawa').setup(opts)
vim.cmd[[colorscheme kanagawa]]

require('lualine').setup({
   options = {
      theme = 'kanagawa',
   },
   -- sections = {
   --    lualine_x = {'encoding', 'fileformat', function()
   --       return ''
   --    end},
   -- },
})
