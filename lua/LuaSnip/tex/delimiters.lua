local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')
local vn = require('LuaSnip.util').visual_node

local autosnippets = {
   -- autopairing
   -- tex.ms(
   --    '(',
   --    { t'(', vn(), i(1), t')' }
   -- ),
   -- tex.ms(
   --    '[',
   --    { t'[', vn(), i(1), t']' }
   -- ),
   -- tex.ms(
   --    '{',
   --    { t'{', vn(), i(1), t'}' }
   -- ),
   -- s(
   --    {
   --       trig = '\\{',
   --       priority = 10000, -- to override `{`
   --    },
   --    { t'\\{', vn(), i(1), t'\\}' }
   -- ),
   -- dynamic delimiters
   tex.ms(
      'ddp',
      { t'\\left(', vn(), i(1), t'\\right)' }
   ),
   tex.ms(
      'ddb',
      { t'\\left[', vn(), i(1), t'\\right]' }
   ),
   tex.ms(
      'ddc',
      { t'\\left\\{', vn(), i(1), t'\\right\\}' }
   ),
   -- novel delimiters
   tex.ms(
      '<<',
      fmta('\\angled{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      '||',
      fmta('\\norm{<><>}', { vn(), i(1) })
   ),
   tex.ms(
      'md',
      t('\\mid')
   ),
}

return {}, autosnippets
