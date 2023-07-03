local M = {}

local ls = require('luasnip')
local i = ls.insert_node
local f = ls.function_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node

function M.raw_visual(_, parent)
   return parent.snippet.env.LS_SELECT_RAW
end
function M.dedent_visual(_, parent)
   return parent.snippet.env.LS_SELECT_DEDENT
end

function M.dynamic_visual(_, parent)
   return sn(nil, { i(1, parent.snippet.env.LS_SELECT_DEDENT) })
end

function M.visual_node()
   return f(M.raw_visual)
end

function M.indent_visual_node(num_tabs)
   num_tabs = num_tabs or 1
   return isn(nil, f(M.dedent_visual), '$PARENT_INDENT' .. string.rep('\t', num_tabs))
end

return M
