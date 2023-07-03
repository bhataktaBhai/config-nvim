local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   -- dynamic delimiters
   tex.ms(
      {
         trig = 'ddp',
         name = '\\parentheses{}',
         dscr = 'dynamic parentheses',
      },
      fmta('\\paren{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'ddb',
         name = '\\brackets{}',
         dscr = 'dynamic brackets',
      },
      fmta('\\brack{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'ddc',
         name = '\\curly{}',
         dscr = 'dynamic curly braces',
      },
      fmta('\\curly{<>}', { i(1) })
   ),
   -- novel delimiters
   tex.ms(
      {
         trig = '<<',
         name = '\\angled{}',
         dscr = 'angled brackets (dynamic)',
      },
      fmta('\\angled{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = '|',
         name = '\\abs{}',
         dscr = 'absolute value (dynamic)',
      },
      fmta('\\abs{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = '\\abs{|',
         name = '\\norm{}',
         dscr = 'norm (dynamic)',
         priority = 10000, -- to override `|`
      },
      { t('\\norm{') }
   ),
   s(
      {
         trig = '\\{',
         name = '\\{\\}',
         dscr = 'escaped curly braces',
      },
      fmta('\\{<>\\}', { i(1) })
   ),
}

return {}, autosnippets
