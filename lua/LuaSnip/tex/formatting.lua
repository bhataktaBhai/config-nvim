local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   tex.ts(
      {
         trig = 'bb',
         name = 'boldface',
         dscr = 'boldface text mode',
         -- condition = -tex.in_mathzone,
      },
      fmta('\\textbf{<>}<>', { i(1), i(0) })
   ),
   tex.ts(
      {
         trig = 'ii',
         name = 'italic',
         dscr = 'italic text mode',
      },
      fmta('\\textit{<>}<>', { i(1), i(0) })
   ),
   tex.ts(
      {
         trig = 'ee',
         name = 'emphasis',
         dscr = 'emphasis text mode',
      },
      fmta('\\emph{<>}<>', { i(1), i(0) })
   ),
   tex.ts(
      {
         trig = 'tt',
         name = 'typewriter',
         dscr = 'typewriter text mode',
      },
      fmta('\\texttt{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'bb',
         name = 'blackboard bold',
         dscr = 'blackboard bold math mode',
      },
      fmta('\\mathbb{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'mcl',
         name = 'mathcal',
         dscr = 'mathcal',
      },
      fmta('\\mathcal{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'mcr',
         name = 'mathscr',
         dscr = 'mathscr',
      },
      fmta('\\mathscr{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'mfk',
         name = 'mathfrak',
         dscr = 'mathfrak',
      },
      fmta('\\mathfrak{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'mrm',
         name = 'mathrm',
         dscr = 'mathrm',
      },
      fmta('\\mathrm{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'trm',
         name = 'textrm',
         dscr = 'textrm',
      },
      fmta('\\textrm{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = 'tt',
         name = 'text in math mode',
         dscr = 'text in math mode',
      },
      fmta('\\text{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '^',
         name = 'superscript',
         dscr = 'superscript',
      },
      fmta('^{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '_',
         name = 'subscript',
         dscr = 'subscript',
      },
      fmta('_{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '(%a)(%d)',
         name = 'auto numerical subscript',
         dscr = 'auto numerical subscript',
         trigEngine = 'pattern',
      },
      fmta('<>', { f(function(_, snip)
         return snip.captures[1] .. '_{' .. snip.captures[2] .. '}'
      end) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)hat',
         name = 'postfix hat',
         dscr = 'postfix hat',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta('\\hat{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = 'hat',
         name = 'prefix hat',
         dscr = 'prefix hat',
      },
      fmta('\\hat{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)%~',
         name = 'postfix tilde',
         dscr = 'postfix tilde',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta('\\tilde{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = '~',
         name = 'prefix tilde',
         dscr = 'prefix tilde',
      },
      fmta('\\tilde{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)bm',
         name = 'postfix bm',
         dscr = 'postfix bm',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta('\\bm{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = 'bm',
         name = 'prefix bm',
         dscr = 'prefix bm',
      },
      fmta('\\bm{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)bar',
         name = 'postfix overline',
         dscr = 'postfix overline',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta('\\overline{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = 'bar',
         name = 'prefix overline',
         dscr = 'prefix overline',
      },
      fmta('\\overline{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)ddot',
         name = 'postfix ddot',
         dscr = 'postfix ddot',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta('\\ddot{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = 'ddot',
         name = 'prefix ddot',
         dscr = 'prefix ddot',
         priority = 5000,
      },
      fmta('\\ddot{<>}<>', { i(1), i(0) })
   ),
   tex.ms(
      {
         trig = '([\\a-zA-Z]+)dot',
         name = 'postfix dot',
         dscr = 'postfix dot',
         trigEngine = 'pattern',
         priority = 2000,
      },
      fmta('\\dot{<>}', { f(function(_, snip)
         return snip.captures[1]
      end) })
   ),
   tex.ms(
      {
         trig = 'dot',
         name = 'prefix dot',
         dscr = 'prefix dot',
      },
      fmta('\\dot{<>}<>', { i(1), i(0) })
   ),
}

return {}, autosnippets
