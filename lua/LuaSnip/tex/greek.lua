local ls = require('luasnip')
local t = ls.text_node
local ms = ls.multi_snippet

local tex = require('LuaSnip.tex.util')

local english_to_greek = {
   a = 'alpha',
   b = 'beta',
   c = 'chi',
   d = 'delta',
   e = 'varepsilon',
   f = 'phi',
   g = 'gamma',
   h = 'eta',
   i = 'iota',
   j =  nil,
   k = 'kappa',
   l = 'lambda',
   m = 'mu',
   n = 'nu',
   o = 'omega', -- w goes to psi
   p = 'rho', -- looks like a p
   q = 'theta', -- uppercase Q sorta theta?
   r = 'rho',
   s = 'sigma',
   t = 'tau',
   u = 'mu',
   v = 'nu',
   w = 'psi', -- looks like a w
   x = 'xi',
   y = 'upsilon',
   z = 'zeta',
}

local autosnippets = {}

for english, greek in pairs(english_to_greek) do
   autosnippets[#autosnippets+1] = tex.ms(
      {
         trig = ';' .. english,
         name = '\\' .. greek,
         dscr = 'lowercase ' .. greek,
      },
      t('\\' .. greek)
   )
   autosnippets[#autosnippets+1] = tex.ts(
      {
         trig = ';' .. english,
         name = '\\' .. greek,
         dscr = 'lowercase ' .. greek,
      },
      t('$\\' .. greek .. '$')
   )
   local upper_english = english:upper()
   local upper_greek = greek:gsub('^%l', string.upper)
   autosnippets[#autosnippets+1] = tex.mms(
      {
         common = {
            name = '\\' .. upper_greek,
            dscr = 'uppercase ' .. greek,
         },
         { trig = ';' .. upper_english },
         { trig = ':' .. upper_english },
         { trig = ':' .. english },
      },
      t('\\' .. upper_greek)
   )
   autosnippets[#autosnippets+1] = ms(
      {
         common = {
            name = '\\' .. upper_greek,
            dscr = 'uppercase ' .. greek,
            cond = -tex.in_label,
         },
         { trig = ';' .. upper_english },
         { trig = ':' .. upper_english },
         { trig = ':' .. english },
      },
      t('$\\' .. upper_greek .. '$')
   )
end

return {}, autosnippets
