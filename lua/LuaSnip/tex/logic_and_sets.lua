local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local tex = require("LuaSnip.tex.util")

local autosnippets = {
   -- true and false
   tex.ms(
      {
         trig = 'TT',
         name = '\\true',
         dscr = 'logical constant true',
      },
      { t('\\true') }
   ),
   tex.ms(
      {
         trig = 'FF',
         name = '\\false',
         dscr = 'logical constant false',
      },
      { t('\\false') }
   ),
   -- propositional logic
   tex.mms(
      {
         common = { name = '\\neg', dscr = 'logical not' },
         { trig = 'neg' },
         { trig = 'not' },
      },
      { t('\\neg') }
   ),
   tex.ms(
      {
         trig = 'and',
         name = '\\land',
         dscr = 'logical and',
         wordTrig = true,
      },
      { t('\\land') }
   ),
   tex.ms(
      {
         trig = 'or',
         name = '\\lor',
         dscr = 'logical or',
         wordTrig = true,
      },
      { t('\\lor') }
   ),
   tex.ms(
      {
         trig = 'xor',
         name = '\\lxor',
         dscr = 'logical xor',
      },
      { t('\\lxor') }
   ),
   tex.mms(
      {
         common = { name = '\\implies', dscr = 'logical implication' },
         { trig = 'imp' },
         { trig = '=>' },
      },
      { t('\\implies') }
   ),
   tex.ms(
      {
         trig = 'iff',
         name = '\\iff',
         dscr = 'iff',
      },
      { t('\\iff') }
   ),
   tex.ms(
      {
         trig = '=-',
         name = '\\equiv',
         dscr = 'equivalence',
      },
      { t('\\equiv') }
   ),
   -- first order logic
   tex.ms(
      {
         trig = 'all',
         name = '\\forall',
         dscr = 'universal quantifier',
      },
      { t('\\forall') }
   ),
   tex.ms(
      {
         trig = 'ee',
         name = '\\exists',
         dscr = 'existential quantifier',
      },
      { t('\\exists') }
   ),
   -- set theory
   tex.ms(
      {
         trig = 'set',
         name = '\\set{}',
         dscr = 'set',
      },
      fmta('\\set{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'nin',
         name = '\\notin',
         dscr = 'not element of',
         priority = 10000, -- to override `in`
      },
      { t('\\notin') }
   ),
   tex.ms(
      {
         trig = 'in',
         name = '\\in',
         dscr = 'element of',
      },
      { t('\\in') }
   ),
   tex.ms(
      {
         trig = 'cc',
         name = '\\subseteq',
         dscr = '(improper) subset',
      },
      { t('\\subseteq') }
   ),
   tex.ms(
      {
         trig = 'cnc',
         name = '\\subsetneq',
         dscr = 'proper subset',
      },
      { t('\\subsetneq') }
   ),
   tex.ms(
      {
         trig = 'nn',
         name = '\\cap',
         dscr = 'intersection',
      },
      { t('\\cap') }
   ),
   tex.ms(
      {
         trig = 'uu',
         name = '\\cup',
         dscr = 'union',
      },
      { t('\\cup') }
   ),
   tex.ms(
      {
         trig = 'sm',
         name = '\\setminus',
         dscr = 'set difference',
      },
      { t('\\setminus') }
   ),
   -- some common functions on sets
   tex.ms(
      {
         trig = 'mx',
         name = '\\max\\set{}',
         dscr = 'maximum',
      },
      fmta('\\max\\set{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'mn',
         name = '\\min\\set{}',
         dscr = 'minimum',
      },
      fmta('\\min\\set{<>}', { i(1) })
   ),
   tex.ms(
      {
         trig = 'sup',
         name = '\\sup',
         dscr = 'supremum',
      },
      { t('\\sup') }
   ),
   tex.ms(
      {
         trig = 'inf',
         name = '\\inf',
         dscr = 'infimum',
      },
      { t('\\inf') }
   ),

   -- function declaration
   tex.ms(
      {
         trig = 'fn',
         name = 'f : A \\to B',
         dscr = 'function declaration',
      },
      fmta('<> : <> \\to <>', {
         i(1, 'f'),
         i(2, '\\R'),
         i(3, '\\R'),
      })
   ),
   tex.ms(
      {
         trig = 'fmap',
         name = 'f : x \\in A \\mapsto y \\in B',
         dscr = 'function declaration + definition',
      },
      fmta('<> : <> \\in <> \\mapsto <> \\in <>', {
         i(1, 'f'),
         i(2, 'x'),
         i(3, '\\R'),
         i(4),
         i(5, '\\R'),
      })
   ),
}

return {}, autosnippets
