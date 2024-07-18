local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

return {}, {
   s(
      { trig = 'blr', dscr = 'boilerplate' },
      fmta(
         [[
            #include <<stdio.h>>

            int main() {
                <>
                return 0;
            }
         ]],
         { i(0) }
      )
   ),
}
