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
local kanagawa_opts = {
   -- statementStyle = { bold = false },
   overrides = function (colors)
      local math_mode = { fg = colors.palette.lotusBlue2, bold = false }
      local nonbold   = { fg = colors.palette.oniViolet,  bold = false }
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
require('kanagawa').setup(kanagawa_opts)
vim.cmd[[colorscheme kanagawa]]
-- vim.cmd[[
--    set bg=light
--    augroup toast
--       autocmd colorscheme toast hi clear texMathZone | hi link texMathZone texMathOper
--       autocmd colorscheme toast hi clear Conceal | hi link Conceal texMathOper
--       autocmd colorscheme toast :hi normal guibg=#ffffff
--    augroup END
--    colorscheme toast
-- ]]

require('lualine').setup({
   options = {
      theme = 'auto',
   },
   -- sections = {
   --    lualine_x = {'encoding', 'fileformat', function()
   --       return ''
   --    end},
   -- },
})
