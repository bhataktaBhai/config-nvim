local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmta = require('luasnip.extras.fmt').fmta

local tex = require('LuaSnip.tex.util')

local function matrix_buggy (rows, columns)
   local nodes = {}
   local column_sep = t ' & '
   local line_sep = t {' \\\\', ''}
   for x = 0, rows-1 do
      nodes[#nodes+1] = i(x * columns + 1)
      for y = 1, columns-1 do
         nodes[#nodes+1] = column_sep
         nodes[#nodes+1] = i(x * columns + y + 1)
      end
      nodes[#nodes+1] = line_sep
   end
   nodes[#nodes] = nil -- remove last line_sep
   return sn(nil, nodes)
end

local function matrix (rows, columns, indent)
   local fmta_string = ('<> & '):rep(columns - 1) .. '<>'
   fmta_string = (fmta_string .. ' \\\\\n'):rep(rows - 1) .. fmta_string
   local nodes = {}
   for j = 1, rows * columns do
      nodes[#nodes+1] = i(j)
   end
   return isn(nil, fmta(fmta_string, nodes), indent or '$PARENT_INDENT\t')
end

local autosnippets = {
   tex.ms(
      {
         trig = '(%d+)%.(%d+)mt',
         name = '\\begin{pmatrix}…\\end{pmatrix}',
         dscr = 'matrix template',
         trigEngine = 'pattern',
         priority = 10000,
      },
      fmta(
         [[
            \begin{pmatrix}
                <>
            \end{pmatrix}
         ]],
         d(1, function (_, snip)
            return matrix(snip.captures[1], snip.captures[2])
         end)
      )
   ),
   tex.ms(
      {
         trig = 'mt',
         name = '\\begin{pmatrix}…\\end{pmatrix}',
         dscr = 'new matrix',
      },
      fmta(
         [[
            \begin{pmatrix}
                <>
            \end{pmatrix}
         ]],
         c(1, { matrix(2, 2), i(1), matrix(2, 2), matrix(3, 3) })
      )
   ),
}

return {}, autosnippets
