local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local l = extras.lambda
local dl = extras.dynamic_lambda
local fmta = require("luasnip.extras.fmt").fmta

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   -- sums
   tex.ms(
      {
         trig = 'sum',
         name = '\\sum_{}^{}',
         dscr = 'sum',
      },
      fmta('\\sum_{<>}^{<>} ', {
         i(1, 'j = 1'),
         i(2, 'n'),
      })
   ),
   tex.ms(
      {
         trig = 'sti',
         name = '\\sum_{}^{\\infty}',
         dscr = 'sum to infinity',
      },
      fmta('\\sum_{<>}^{\\infty} ', {
         i(1, 'j = 1'),
      })
   ),
   -- logarithms and exponentials
   tex.ms(
      {
         trig = 'ln',
         name = '\\ln',
         dscr = 'ln',
      },
      { t('\\ln') }
   ),
   tex.ms(
      {
         trig = 'log',
         name = '\\log',
         dscr = 'log',
      },
      { t('\\log') }
   ),
   tex.ms(
      {
         trig = 'exp',
         name = '\\exp',
         dscr = 'exp',
      },
      { t('\\exp') }
   ),
   tex.ms(
      {
         trig = 'ee',
         name = 'e^{}',
         dscr = 'e to the power of',
      },
      fmta('e^{<>}', { i(1) })
   ),
   -- limits
   tex.ms(
      {
         trig = 'lim',
         name = '\\limit_{ \\to }',
         dscr = 'limit',
      },
      fmta('\\lim_{<> \\to <>} <>', {
         i(1, 'x'),
         i(2, 'a'),
         -- d(3, function (args)
         --    return sn(1, { i(1, 'f(' .. args[1][1] .. ')') })
         -- end, 1),
         dl(3, 'f(' .. l._1 .. ')', 1)
      })
   ),
   tex.ms( -- should I just have a choice node?
      {
         trig = 'lti',
         name = '\\limit_{ \\to \\infty}',
         dscr = 'limit to infinity',
      },
      fmta('\\lim_{<> \\to \\infty} <>', {
         i(1, 'x'),
         i(2, 'f(x)'),
      })
   ),
   tex.ms(
      {
         trig = 'lto',
         name = '\\limit_{ \\to 0}',
         dscr = 'limit to 0',
      },
      fmta('\\lim_{<> \\to 0} <>', {
         i(1, 'x'),
         i(2, 'f(x)'),
      })
   ),
   -- derivatives
   tex.ms(
      {
         trig = '(%d*)pdv',
         name = 'partial derivative',
         dscr = 'partial derivative',
         trigEngine = 'pattern',
         priority = 10000, -- over `dv`
      },
      fmta('\\pdv<>{<>}{<>}', {
         f(function (_, snip)
            if snip.captures[1] == '' then
               return ''
            else
               return '[' .. snip.captures[1] .. ']'
            end
         end),
         i(1),
         i(2),
      })
   ),
   tex.ms(
      {
         trig = '(%d*)dv',
         name = 'derivative',
         dscr = 'derivative',
         trigEngine = 'pattern',
      },
      fmta('\\dv<>{<>}{<>}', {
         f(function (_, snip)
            if snip.captures[1] == '' then
               return ''
            else
               return '[' .. snip.captures[1] .. ']'
            end
         end),
         i(1),
         i(2),
      })
   ),
   -- integrals
   tex.ms(
      {
         trig = 'dnt',
         name = 'definite integral',
         dscr = 'definite integral',
      },
      fmta('\\int_{<>}^{<>} <> \\dd <>', {
         i(1, 'a'),
         i(2, 'b'),
         i(3, 'f(x)'),
         i(4, 'x'),
      })
   ),
   tex.ms(
      {
         trig = 'int',
         name = 'indefinite integral',
         dscr = 'indefinite integral',
      },
      fmta('\\int <> \\dd <>', {
         i(1, 'f(x)'),
         i(2, 'x'),
      })
   ),
   tex.ms(
      {
         trig = 'tnt',
         name = 'indefinite integral in t',
         dscr = 'indefinite integral in t',
      },
      fmta('\\int <> \\dd t', {
         i(1, 'f(t)'),
      })
   ),
}

return {}, autosnippets
