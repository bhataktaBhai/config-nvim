local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   tex.ts(
      {
         trig = 'bb',
         name = '\\textbf{}',
         dscr = 'boldface text mode',
      },
      fmta('\\textbf{<>}', i(1))
   ),
   tex.ts(
      {
         trig = 'ii',
         name = '\\textit{}',
         dscr = 'italic text mode',
      },
      fmta('\\textit{<>}', i(1))
   ),
   tex.ts(
      {
         trig = 'ee',
         name = '\\emph{}',
         dscr = 'emphasis text mode',
      },
      fmta('\\emph{<>}', i(1))
   ),
   tex.ts(
      {
         trig = 'tt',
         name = '\\texttt{}',
         dscr = 'typewriter text mode',
      },
      fmta('\\texttt{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'bb',
         name = '\\mathbb{}',
         dscr = 'blackboard bold math mode',
      },
      fmta('\\mathbb{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'mcl',
         name = '\\mathcal{}',
         dscr = 'mathcal',
      },
      fmta('\\mathcal{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'mcr',
         name = '\\mathscr{}',
         dscr = 'mathscr',
      },
      fmta('\\mathscr{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'mfk',
         name = '\\mathfrak{}',
         dscr = 'mathfrak',
      },
      fmta('\\mathfrak{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'mrm',
         name = '\\mathrm{}',
         dscr = 'mathrm',
      },
      fmta('\\mathrm{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'trm',
         name = '\\textrm{}',
         dscr = 'textrm',
      },
      fmta('\\textrm{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'tt',
         name = '\\text{}',
         dscr = 'text in math mode',
      },
      fmta('\\text{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '^',
         name = '^{}',
         dscr = 'superscript',
      },
      fmta('^{<>}', i(1))
   ),
   tex.ms(
      {
         trig = 'nv',
         name = '^{-1}',
         dscr = 'inverse (superscript -1)',
      },
      t'^{-1}'
   ),
   tex.ms(
      {
         trig = '_',
         name = '_{}',
         dscr = 'subscript',
      },
      fmta('_{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '(%a)(%d)',
         name = 'numerical subscript',
         dscr = 'auto numerical subscript',
         trigEngine = 'pattern',
      },
      f(function(_, snip)
         return snip.captures[1] .. '_{' .. snip.captures[2] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)hat',
         name = 'postfix hat',
         dscr = 'postfix hat',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
            -- tex.ms default is tex.in_mathzone * -tex.in_command
            -- but \alphahat should trigger
      },
      f(function(_, snip)
         return '\\hat{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'hat',
         name = 'prefix hat',
         dscr = 'prefix hat',
      },
      fmta('\\hat{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)%~',
         name = 'postfix tilde',
         dscr = 'postfix tilde',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\tilde{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = '~',
         name = 'prefix tilde',
         dscr = 'prefix tilde',
      },
      fmta('\\tilde{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)bm',
         name = 'postfix bm',
         dscr = 'postfix bm',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\bm{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'bm',
         name = 'prefix bm',
         dscr = 'prefix bm',
      },
      fmta('\\bm{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)bar',
         name = 'postfix overline',
         dscr = 'postfix overline',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\overline{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'bar',
         name = 'prefix overline',
         dscr = 'prefix overline',
      },
      fmta('\\overline{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)ddot',
         name = 'postfix ddot',
         dscr = 'postfix ddot',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\ddot{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'ddot',
         name = 'prefix ddot',
         dscr = 'prefix ddot',
         priority = 5000,
      },
      fmta('\\ddot{<>}', i(1))
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)dot',
         name = 'postfix dot',
         dscr = 'postfix dot',
         trigEngine = 'pattern',
         priority = 2000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\dot{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'dot',
         name = 'prefix dot',
         dscr = 'prefix dot',
      },
      fmta('\\dot{<>}', i(1))
   ),
}

return {}, autosnippets
