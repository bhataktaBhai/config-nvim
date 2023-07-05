local ls = require("luasnip")
local s = ls.snippet
local ms = ls.multi_snippet
local conditions = require('luasnip.extras.conditions')
local make_condition = conditions.make_condition

local M = {}

M.in_mathzone = make_condition(function()
   return vim.fn['vimtex#syntax#in_mathzone']() == 1
end)
M.in_comment = make_condition(function()
   return vim.fn['vimtex#syntax#in_comment']() == 1
end)

M.in_command = make_condition(function (line_to_cursor)
   return line_to_cursor:find('\\%a+$') ~= nil
end)

M.in_env = function(name)
   local location = vim.fn['vimtex#syntax#in_env'](name)
   return location[1] > 0 and location[2] > 0
end
M.in_align = make_condition(function()
   return M.in_env('align')
end)
M.in_tikz = make_condition(function()
   return M.in_env('tikzpicture')
end)

M.math_snippet = function(context, nodes, opts)
   if type(context) == 'string' then
      context = { trig = context }
   end
   context = vim.tbl_extend('force', {
         condition = M.in_mathzone * -M.in_command,
         wordTrig = false,
      }, context or {})
   return s(context, nodes, opts)
end

M.text_snippet = function(context, nodes, opts)
   if type(context) == 'string' then
      context = { trig = context }
   end
   context = vim.tbl_extend('force', {
      condition = -M.in_mathzone * -M.in_command,
   }, context or {})
   return s(context, nodes, opts)
end

M.math_multi_snippet = function(contexts, nodes, opts)
   local common = contexts.common or {}
   common = vim.tbl_extend('force', {
      condition = M.in_mathzone * -M.in_command,
      wordTrig = false,
   }, common)
   contexts.common = common
   return ms(contexts, nodes, opts)
end

M.ms = M.math_snippet
M.ts = M.text_snippet
M.mms = M.math_multi_snippet

return M
