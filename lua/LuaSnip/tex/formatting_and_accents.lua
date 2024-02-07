local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')
local util = require('LuaSnip.util')
local vn = util.visual_node

local autosnippets = {
   tex.ts(
      {
         trig = 'bb',
         name = '\\textbf{}',
         dscr = 'boldface text mode',
      },
      fmta('\\textbf{<><>}', { vn(), i(1) })
   ),
   tex.ts(
      {
         trig = 'ii',
         name = '\\textit{}',
         dscr = 'italic text mode',
      },
      fmta('\\textit{<><>}', { vn(), i(1) })
   ),
   tex.ts(
      {
         trig = 'tsl',
         name = '\\textsl{}',
         dscr = 'slanted text mode',
      },
      fmta('\\textsl{<><>}', { vn(), i(1) })
   ),
   tex.ts(
      {
         trig = 'ee',
         name = '\\emph{}',
         dscr = 'emphasis text mode',
      },
      fmta('\\emph{<><>}', { vn(), i(1) })
   ),
   tex.ts(
      {
         trig = 'tt',
         name = '\\texttt{}',
         dscr = 'typewriter text mode',
      },
      fmta('\\texttt{<><>}', { vn(), i(1) })
   ),
   -- tex.ms(
   --    {
   --       trig = 'bb',
   --       name = '\\mathbb{}',
   --       dscr = 'blackboard bold math mode',
   --    },
   --    fmta('\\mathbb{<><>}', { vn(), i(1) })
   -- ),
   tex.ms(
      {
         trig = 'mcl',
         name = '\\mathcal{}',
         dscr = 'mathcal',
      },
      fmta('\\mathcal{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'mcr',
         name = '\\mathscr{}',
         dscr = 'mathscr',
      },
      fmta('\\mathscr{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'mfk',
         name = '\\mathfrak{}',
         dscr = 'mathfrak',
      },
      fmta('\\mathfrak{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'mrm',
         name = '\\mathrm{}',
         dscr = 'mathrm',
      },
      fmta('\\mathrm{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'trm',
         name = '\\textrm{}',
         dscr = 'textrm',
      },
      fmta('\\textrm{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'tt',
         name = '\\text{}',
         dscr = 'text in math mode',
      },
      fmta('\\text{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = 'sp',
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
         trig = 'sb',
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
         return snip.captures[1] .. '_' .. snip.captures[2]
      end)
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)hat',
         name = 'postfix widehat',
         dscr = 'postfix widehat',
         trigEngine = 'pattern',
         priority = 10000,
         condition = tex.in_mathzone,
            -- tex.ms default is tex.in_mathzone * -tex.in_command
            -- but \alphahat should trigger
      },
      f(function(_, snip)
         return '\\what{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'hat',
         name = 'prefix widehat',
         dscr = 'prefix widehat',
      },
      fmta('\\what{<><>}', { vn(), i(1) })
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
      fmta('\\tilde{<><>}', { vn(), i(1) })
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
      fmta('\\bm{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)ubar',
         name = 'postfix underline',
         dscr = 'postfix underline',
         trigEngine = 'pattern',
         priority = 40000,
         condition = tex.in_mathzone,
      },
      f(function(_, snip)
         return '\\underline{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'ubar',
         name = 'prefix underline',
         dscr = 'prefix underline',
         priority = 20000,
      },
      fmta('\\underline{<><>}', { vn(), i(1) })
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
         return '\\wbar{' .. snip.captures[1] .. '}'
      end)
   ),
   tex.ms(
      {
         trig = 'bar',
         name = 'prefix overline',
         dscr = 'prefix overline',
      },
      fmta('\\wbar{<><>}', { vn(), i(1) })
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
      fmta('\\ddot{<><>}', { vn(), i(1) })
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
      fmta('\\dot{<><>}', { vn(), i(1) })
   ),
}

return {}, autosnippets
