local ls = require('luasnip')
local t = ls.text_node

local tex = require('LuaSnip.tex.util')

local trig_functions = {
   -- trigger = function name
   cos  = 'cos',    sin  = 'sin',    tan  = 'tan',
   sec  = 'sec',    csc  = 'csc',    cot  = 'cot',
   acos = 'arccos', asin = 'arcsin', atan = 'arctan',
}

local autosnippets = {}
for trig, fn in pairs(trig_functions) do
   autosnippets[#autosnippets + 1] = tex.ms(
      {
         trig = trig,
         name = '\\' .. fn,
         dscr = fn,
      },
      { t('\\' .. fn) }
   )
end

return {}, autosnippets
