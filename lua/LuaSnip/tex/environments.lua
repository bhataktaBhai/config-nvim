local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local ms = ls.multi_snippet
local extras = require('luasnip.extras')
local n = extras.nonempty
local fmta = require('luasnip.extras.fmt').fmta
local k = require('luasnip.nodes.key_indexer').new_key

local line_begin = require('luasnip.extras.conditions.expand').line_begin

local tex = require('LuaSnip.tex.util')
local util = require('LuaSnip.util')
local vn = util.visual_node
local ivn = util.indent_visual_node

local function surround_if_nonempty (jump_index, left, right, node, node_reference)
   node_reference = node_reference or 1
   return sn(jump_index, {
      n(node_reference, left),
      node,
      n(node_reference, right),
   })
end
local sin = surround_if_nonempty

local function label_subheader ()
   -- local prev_thm_label = tex.prev_theorem_label()
   -- if prev_thm_label then
   --    return prev_thm_label:match(':.*:') .. ':'
   -- end
   local current_sec_label = tex.current_section_label()
   if current_sec_label then
      return current_sec_label:match(':.*'):sub(2) .. ':'
   end
   return ''
end

local function label_text (argnodes, _, _, label_header)
   local node
   if argnodes[1][1] ~= '' then
      node = sn(1, { -- jump_index = 1 for surround_if_nonempty
         i(1),
         i(2, argnodes[1][1]:gsub(' ', '_'):lower()),
      })
   else
      node = i(1)
   end
   local subheader = label_header:match('sec') and '' or label_subheader()
   return surround_if_nonempty(nil, ' \\label{' .. label_header .. subheader, '}', node)
end

local theorem_environments = {
   theorem = {
      trig = 'tm',
      label_header = 'thm:',
   },
   lemma = {
      trig = 'lm',
      label_header = 'thm:',
   },
   proposition = {
      trig = 'prp',
      label_header = 'thm:',
   },
   corollary = {
      trig = 'crl',
      label_header = 'thm:',
   },
   definition = {
      trig = 'df',
      label_header = 'def:',
   },
   axiom = {
      trig = 'ax',
      label_header = 'def:',
   },
   problem = {
      trig = 'pb',
      label_header = 'prb:',
   },
}

local visual_enviroments = {
   proof = 'pf',
   remark = 'rm',
   example = 'xm',
   solution = 'sl',
}

local autosnippets = {}
for name, info in pairs(theorem_environments) do
   autosnippets[#autosnippets + 1] = s(
      {
         trig = info.trig,
         dscr = 'autotriggerred ' .. name .. ' environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{<>}<><>
                <><>
            \end{<>}
         ]],
         {
            t(name),
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { info.label_header } }),
               ivn(), i(0),
            t(name),
         }
      )
   )
end

for name, trig in pairs(visual_enviroments) do
   autosnippets[#autosnippets + 1] = s(
      {
         trig = trig,
         dscr = 'autotriggerred ' .. name .. ' environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{<>}
                <><>
            \end{<>}
         ]],
         { t(name), ivn(), i(0), t(name) }
      )
   )
end

autosnippets = util.extend(autosnippets, {
   s(
      {
         trig = 'aln',
         dscr = 'autotriggerred align* environment',
      },
      fmta(
         [[
            \begin{align*}
                <><>
            \end{align*}
         ]], { ivn(), i(0), }
      )
   ),
   s(
      {
         trig = 'mm',
         dscr = 'autotriggerred inline math environment',
      },
      -- { t'$', vn(), i(1), t'$', i(0) }
      fmta(
         [[
            $<><>$<>
         ]],
         { vn(), i(1), i(0) }
      )
   ),
   tex.ts(
      {
         trig = "([^\\(%a'$%.])([b-zB-HJ-Z])([^%a)'$])",
         dscr = 'auto mathmode for one-letter variables',
         trigEngine = 'pattern',
         wordTrig = false,
         condition = -tex.in_label,
      },
      f(function (_, snip)
         return snip.captures[1] .. '$' .. snip.captures[2] .. '$' .. snip.captures[3]
      end)
   ),
   s(
      {
         trig = 'dm',
         dscr = 'autotriggerred displaymath environment',
      },
      fmta(
         [[
            \[
                <><>
            \]
         ]],
         { vn(), i(0) }
      )
   ),
   ms(
      {
         common = {
            trig = 'bg',
            dscr = 'begin environment',
         }, {
            dscr = 'auto triggerred begin environment',
            snippetType = 'autosnippet',
            condition = line_begin,
         }, {
            dscr = 'manually triggerred begin environment',
            snippetType = 'snippet',
         },
      },
      fmta(
         [[
            \begin{<>}
                <><>
            \end{<>}
         ]],
         {
            i(1),
            ivn(), i(0),
            extras.rep(1),
         }
      )
   ),
   s(
      {
         trig = 'spf',
         dscr = 'autotriggerred self proof environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proof}[Proof \textcolor{<>}{(self)}]
                <><>
            \end{proof}
         ]],
         { i(1, 'self-proof'), ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'xs',
         dscr = 'autotriggerred examples environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{examples}
                \item <><>
            \end{examples}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'itm',
         dscr = 'autotriggerred itemize environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{itemize}
                \item <><>
            \end{itemize}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'enm',
         dscr = 'autotriggerred enumerate environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{enumerate}
                \item <><>
            \end{enumerate}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'tz',
         dscr = 'autotriggerred tikzpicture environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{tikzpicture}
                <>
            \end{tikzpicture}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'ctz',
         dscr = 'autotriggerred centered tikzpicture environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{center}
                \begin{tikzpicture}
                    <>
                \end{tikzpicture}
            \end{center}
         ]],
         { i(0) }
      )
   ),
   -- cases moved to matrix.lua
   -- sections
   s(
      {
         trig = '(#+) ',
         name = '\\[sub]section{}',
         dscr = 'new [sub]section',
         condition = line_begin,
         trigEngine = 'pattern',
      },
      fmta(
         [[
            \<>section{<>}<>
            <>
         ]],
         {
            f(function (_, snip)
               return string.rep('sub', #snip.captures[1] - 1)
            end),
            i(1),
            d(2, label_text, 1, { user_args = { 'sec:' } }),
            i(0),
         }
      )
   ),
})

return {}, autosnippets
