local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   s(
      {
         trig = 'SI',
         name = '\\SI{}{}',
         dscr = 'SI{}{}',
      },
      fmta('\\SI{<>}{<>}', { i(1), i(2) })
   ),
   tex.ms(
      {
         trig = 'sii', -- should not trigger before `sin`
         name = '\\si{} (SI unit)',
         dscr = 'si{} (SI unit)',
      },
      fmta('\\;\\si{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'hbar',
         name = '\\hslash',
         dscr = 'Dirac h',
         priority = 20000, -- to ovveride postfix overline
      },
      { t('\\hslash') }
   ),
}
return {}, autosnippets
