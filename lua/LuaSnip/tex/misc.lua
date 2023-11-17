local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')
local util = require('LuaSnip.util')

local function open(args)
   if #args[1][1] > 1 then return '{' end
   return ''
end
local function close(args)
   if #args[1][1] > 1 then return '}' end
   return ''
end

local autosnippets = {
   tex.ms('==', t('&=')),
   tex.ms('//',
      fmta('\\frac{<>}{<>}', {
         i(1),
         i(2),
      })
   ),
   tex.ms('1/',
      fmta('\\frac1<><><>', {
         f(open, {1}),
         d(1, util.dynamic_visual),
         f(close, {1}),
      })
   ),
}

return {}, autosnippets
