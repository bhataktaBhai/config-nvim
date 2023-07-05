local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local ms = ls.multi_snippet
local extras = require('luasnip.extras')
local n = extras.nonempty
local fmta = require('luasnip.extras.fmt').fmta
local k = require('luasnip.nodes.key_indexer').new_key

local line_begin = require('luasnip.extras.conditions.expand').line_begin

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
   return surround_if_nonempty(nil, ' \\label{' .. label_header, '}', node)
end

local sin = surround_if_nonempty

local autosnippets = {
   s(
      {
         trig = 'mm',
         dscr = 'autotriggerred inline math environment',
      },
      { t"$", vn(), i(1), t"$", i(0) }
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
            \]<>
         ]],
         { vn(), i(1), i(0) }
      )
   ),
   ms(
      {
         common = {
            trig = 'bg',
            dscr = 'begin environment',
         },
         {
            dscr = 'auto triggerred begin environment',
            snippetType = 'autosnippet',
            condition = line_begin,
         },
         {
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
         trig = 'aln',
         dscr = 'autotriggerred align* environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{align*}
                <><>
            \end{align*}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'tm',
         dscr = 'autotriggerred theorem environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{theorem}<><>
                <><>
            \end{theorem}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'thm:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'lm',
         dscr = 'autotriggerred lemma environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{lemma}<><>
                <><>
            \end{lemma}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'thm:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'prp',
         dscr = 'autotriggerred proposition environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proposition}<><>
                <><>
            \end{proposition}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'thm:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'crl',
         dscr = 'autotriggerred corollary environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{corollary}<><>
                <><>
            \end{corollary}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'thm:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'pf',
         dscr = 'autotriggerred proof environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proof}
                <><>
            \end{proof}
         ]],
         { ivn(), i(0) }
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
         trig = 'df',
         dscr = 'autotriggerred definition environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{definition}<><>
                <><>
            \end{definition}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'def:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'ax',
         dscr = 'autotriggerred axiom environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{axiom}<><>
                <><>
            \end{axiom}
         ]],
         {
            sin(1, '[', ']', i(1, '', { key = 'name' })),
            d(2, label_text, k('name'), { user_args = { 'def:' } }),
            ivn(), i(0),
         }
      )
   ),
   s(
      {
         trig = 'xm',
         dscr = 'autotriggerred example environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{example}
                <><>
            \end{example}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'xl',
         dscr = 'autotriggerred examplelist environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{examplelist}
                \item <><>
            \end{examplelist}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'rm',
         dscr = 'autotriggerred remark environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{remark}
                <><>
            \end{remark}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'pb',
         dscr = 'autotriggerred problem environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{problem}
                <><>
            \end{problem}
         ]],
         { ivn(), i(0) }
      )
   ),
   s(
      {
         trig = 'sl',
         dscr = 'autotriggerred solution environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{solution}
                <><>
            \end{solution}
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
   -- sections
   s(
      {
         trig = '# ',
         name = '\\section{}',
         dscr = 'new section',
         condition = line_begin,
      },
      fmta(
         [[
            \section{<>}<>

            <>
         ]],
         {
            i(1),
            d(2, label_text, 1, { user_args = { 'sec:' } }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = '## ',
         name = '\\subsection{}',
         dscr = 'new subsection',
         condition = line_begin,
      },
      fmta(
         [[
            \subsection{<>}<>

            <>
         ]],
         {
            i(1),
            d(2, label_text, 1, { user_args = { 'sec:' } }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = '### ',
         name = '\\subsubsection{}',
         dscr = 'new subsubsection',
         condition = line_begin,
      },
      fmta(
         [[
            \subsubsection{<>}<>

            <>
         ]],
         {
            i(1),
            d(2, label_text, 1, { user_args = { 'sec:' } }),
            i(0),
         }
      )
   ),
}

return {}, autosnippets
