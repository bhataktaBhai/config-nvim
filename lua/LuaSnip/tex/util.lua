local ls = require('luasnip')
local s = ls.snippet
local ms = ls.multi_snippet
local conditions = require('luasnip.extras.conditions')
local make_condition = conditions.make_condition

local ts_utils = require('nvim-treesitter.ts_utils')

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

M.in_label = make_condition(function()
   local current_node = ts_utils.get_node_at_cursor()
   if not current_node then
      error('No node at cursor')
   end
   local expr = current_node
   while expr do
      if expr:type():sub(1, #'label') == 'label' then
         return true
      end
      expr = expr:parent()
   end
   return false
end)

M.in_env = function(name)
   return make_condition(function()
      -- local location = vim.fn['vimtex#syntax#in_env'](name)
      local location = vim.fn['vimtex#env#is_inside'](name)
      return location[1] > 0 and location[2] > 0
      -- return vim.fn['vimtex#syntax#in'](name) == 1
   end)
end
M.in_align = M.in_env('align')
M.in_tikz = M.in_env('tikzpicture')

M.math_snippet = function(context, nodes, opts)
   if type(context) == 'string' then
      context = { trig = context }
   end

   if context.condition ~= nil then
      context.condition = context.condition * (M.in_mathzone - M.in_command)
   else
      context.condition = M.in_mathzone - M.in_command
   end

   if context.wordTrig == nil then
      context.wordTrig = false
   end
   -- context = vim.tbl_extend('force', {
   --       condition = M.in_mathzone - M.in_command,
   --       wordTrig = false,
   --    }, context or {})
   return s(context, nodes, opts)
end

M.text_snippet = function(context, nodes, opts)
   if type(context) == 'string' then
      context = { trig = context }
   end

   if context.condition ~= nil then
      context.condition = context.condition - M.in_mathzone - M.in_command
   else
      context.condition = -M.in_mathzone - M.in_command
   end
   -- context = vim.tbl_extend('force', {
   --    condition = -M.in_mathzone - M.in_command,
   -- }, context or {})
   return s(context, nodes, opts)
end

M.math_multi_snippet = function(contexts, nodes, opts)
   local common = contexts.common or {}
   common = vim.tbl_extend('force', {
      condition = M.in_mathzone - M.in_command,
      -- wordTrig = false,
   }, common)
   contexts.common = common
   return ms(contexts, nodes, opts)
end

M.text_multi_snippet = function(contexts, nodes, opts)
   local common = contexts.common or {}
   common = vim.tbl_extend('force', {
      condition = -M.in_mathzone - M.in_command,
      wordTrig = false,
   }, common)
   contexts.common = common
   return ms(contexts, nodes, opts)
end

M.ms = M.math_snippet
M.ts = M.text_snippet
M.mms = M.math_multi_snippet
M.tms = M.text_multi_snippet

function M.current_section_node ()
   local current_node = ts_utils.get_node_at_cursor()
   if not current_node then
      error('No node at cursor')
   end
   local expr = current_node
   while expr do
      if expr:type():sub(-#'section') == 'section' then
         return expr
      end
      expr = expr:parent()
   end
   return nil
end

function M.current_section_name ()
   local section_node = M.current_section_node ()
   if section_node == nil then
      return nil
   end
   local curly_group = section_node:named_child(0)
   local text = curly_group:named_child(0)
   return vim.treesitter.get_node_text(text, 0)
   -- local start_row, start_col, _, end_col = text:range()
   -- return vim.fn.getline(start_row + 1):sub(start_col + 1, end_col)
end

function M.get_label (node)
   if node == nil then
      return nil
   end
   for child in node:iter_children() do
      if child:type() == 'label_definition' then
         local curly_group_text = child:named_child(0)
         local text = curly_group_text:named_child(0)
         local bufnr = vim.api.nvim_get_current_buf()
         return vim.treesitter.get_node_text(text, bufnr)
         -- local start_row, start_col, _, end_col = text:range()
         -- return vim.fn.getline(start_row + 1):sub(start_col + 1, end_col)
      end
   end
   return nil
end

function M.current_section_label ()
   return M.get_label(M.current_section_node())
end

function M.prev_theorem_node ()
   local current_node = ts_utils.get_node_at_cursor()
   if not current_node then
      error('No node at cursor')
   end
   local expr = current_node
   while expr do
      if expr:type() == 'generic environment' then
         local env = expr:named_child(0):named_child(0):named_child(0)
         local start_row, start_col, _, end_col = env:range()
         local env_name = vim.fn.getline(start_row + 1):sub(start_col + 1, end_col)
         if env_name == 'theorem' then
            return expr
         end
      end
   end
   return nil
end

function M.prev_theorem_label ()
   return M.get_label(M.prev_theorem_node())
end

return M
