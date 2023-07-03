local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local line_begin = require('luasnip.extras.conditions.expand').line_begin

return {}, {
   s(
      {
         trig = 'uuaa',
         name = 'up, up, and away!',
         dscr = 'setup for a new document',
         condition = line_begin,
      },
      fmta(
         [[
            documentclass[12pt]{article}
            \input{<>}

            \title{<>}
            \author{Naman Mishra}
            \date{<>}

            \begin{document}
            \maketitle
            
            <>

            \end{document}
         ]],
         {
            i(1, 'preamble'),
            i(2),
            i(3, os.date('%d %B, %Y')),
            i(0),
         }
      )
   ),
}
