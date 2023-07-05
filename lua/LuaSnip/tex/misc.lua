local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')
local util = require('LuaSnip.util')

local autosnippets = {
   tex.ms('==', t('&=')),
   tex.ms('//',
      fmta('\\frac{<>}{<>}', { i(1), i(2) })
   ),
   tex.ms('1/',
      fmta('\\frac{1}{<>}',
         d(1, util.dynamic_visual)
      )
   ),
}

return {}, autosnippets
