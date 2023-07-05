local ls = require('luasnip')
local t = ls.text_node

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   -- high priority inverse trigonometric functions
   tex.ms(
      {
         trig = 'acos',
         name = '\\arccos',
         dscr = 'arccos',
         priority = 10000,
      },
      { t('\\arccos') }
   ),
   tex.ms(
      {
         trig = 'asin',
         name = '\\arcsin',
         dscr = 'arcsin',
         priority = 10000,
      },
      { t('\\arcsin') }
   ),
   tex.ms(
      {
         trig = 'atan',
         name = '\\arctan',
         dscr = 'arctan',
         priority = 10000,
      },
      { t('\\arctan') }
   ),
   -- regular priority trigonometric functions
   tex.ms(
      {
         trig = 'cos',
         name = '\\cos',
         dscr = 'cos',
      },
      { t('\\cos') }
   ),
   tex.ms(
      {
         trig = 'sin',
         name = '\\sin',
         dscr = 'sin',
      },
      { t('\\sin') }
   ),
   tex.ms(
      {
         trig = 'tan',
         name = '\\tan',
         dscr = 'tan',
      },
      { t('\\tan') }
   ),
   tex.ms(
      {
         trig = 'sec',
         name = '\\sec',
         dscr = 'sec',
      },
      { t('\\sec') }
   ),
   tex.ms(
      {
         trig = 'csc',
         name = '\\csc',
         dscr = 'csc',
      },
      { t('\\csc') }
   ),
   tex.ms(
      {
         trig = 'cot',
         name = '\\cot',
         dscr = 'cot',
      },
      { t('\\cot') }
   ),
}

return {}, autosnippets
