local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local isn = ls.indent_snippet_node
local fmta = require('luasnip.extras.fmt').fmta

local function visual_selection(_, parent)
   return parent.snippet.env.LS_SELECT_DEDENT or {}
end

return {}, {
   s(
      { trig = 'ef', dscr = 'empty function' },
      fmta(
         [[
            function(<>)
               <><>
            end
         ]],
         {
            i(1),
            isn(2, { f(visual_selection) }, '$PARENT_INDENT\t'),
            i(2),
         }
      )
   ),
}
