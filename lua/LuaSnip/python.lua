local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local ms = ls.multi_snippet
local extras = require("luasnip.extras")
local l = extras.lambda
local n = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmt
local k = require('luasnip.nodes.key_indexer').new_key

local line_begin = require('luasnip.extras.conditions.expand').line_begin
local util = require('LuaSnip.util')
local vn = util.visual_node
local ivn = util.indent_visual_node

---@param line string
local function args_from_line (line)
   if line == nil then return {} end
   print(line)
   line = line:gsub('%s+', '')
   local eq_index = line:find('[^=]=[^=]')
   if eq_index == nil then
      return {}
   end
   line = line:sub(1, eq_index)
   local args = {}
   for arg in line:gmatch('[^,]+') do
      args[#args + 1] = arg
   end
   return args
end

local function args_from_input (input)
   local args = {}
   -- for _, arg in ipairs(args_from_line(input[1])) do
   --    args[#args + 1] = arg
   -- end
   for _, line in ipairs(input) do
      -- for some reason, each line (except the first) contains the full indentation
      -- so extra indented lines are precisely the ones that start with >= 5 spaces
      if line:sub(1, 5) ~= '     ' then for _, arg in ipairs(args_from_line(line)) do
         args[#args + 1] = arg
      end end
   end
   return table.concat(args, ', ')
end

return {}, {
   s(
      { trig = 'cdfs', dscr = 'codeforces' },
      fmt(
         [[
            from sys import stdin, stdout
            input = lambda: stdin.readline().rstrip()
            ints = lambda: [int(x) for x in input().split()]
            println = lambda x: stdout.write(str(x) + '\n')

            def solve({args}) -> {type}:
                {body}

            for _ in range(int(input())):
                {input}
                println({ans})
         ]],
         {
            input = i(1, '', { key = 'input' }),
            type = i(2, 'int', { key = 'type' }),
            args = d(3, function (input_text)
               return sn(1, { i(1, args_from_input(input_text[1]), { key = 'args' }) })
               end, { k'input' }),
            body = i(0, 'pass'),
            ans = f(function (argnode_text)
               local args = argnode_text[1][1]
               local type = argnode_text[2][1]
               if type == 'bool' then
                  return "'YES' if solve(" .. args .. ") else 'NO'"
               elseif type:sub(1, 4) == 'list' then
                  return "' '.join(map(str, solve(" .. args .. ")))"
               else
                  return "solve(" .. args .. ")"
               end
            end, { k'args', k'type' }),
         }
      )
   ),
}
