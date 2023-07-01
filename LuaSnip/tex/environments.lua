local line_begin = require('luasnip.extras.conditions.expand').line_begin

local ne = extras.nonempty

local autosnippets = {
   s(
      {
         trig = 'mm',
         name = 'inline math environment',
         dscr = 'autotriggerred inline math environment',
      },
      { t"$", i(1), t"$", i(0) }
   ),
   s(
      {
         trig = 'dm',
         name = 'displaymath environment',
         dscr = 'autotriggerred displaymath environment',
      },
      fmta(
         [[
            \[
                <>
            \]<>
         ]],
         { i(1), i(0) }
      )
   ),
   ms(
      {
         common = {
            trig = 'bg',
            name = 'begin environment',
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
                <>
            \end{<>}
         ]],
         { i(1), i(0), rep(1) }
      )
   ),
   s(
      {
         trig = 'aln',
         name = 'align* environment',
         dscr = 'autotriggerred align* environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{align*}
                <>
            \end{align*}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'tm',
         name = 'theorem environment',
         dscr = 'autotriggerred theorem environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{theorem}<><>
                <>
            \end{theorem}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{thm:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'lm',
         name = 'lemma environment',
         dscr = 'autotriggerred lemma environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{lemma}<><>
                <>
            \end{lemma}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{thm:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'prp',
         name = 'proposition environment',
         dscr = 'autotriggerred proposition environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proposition}<><>
                <>
            \end{proposition}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{thm:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'crl',
         name = 'corollary environment',
         dscr = 'autotriggerred corollary environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{corollary}<><>
                <>
            \end{corollary}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{thm:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'pf',
         name = 'proof environment',
         dscr = 'autotriggerred proof environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proof}
                <>
            \end{proof}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'spf',
         name = 'self proof environment',
         dscr = 'autotriggerred self proof environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{proof}[Proof \textcolor{<>}{(self)}]
                <>
            \end{proof}
         ]],
         { i(1, 'self-proof'), i(0) }
      )
   ),
   s(
      {
         trig = 'df',
         name = 'definition environment',
         dscr = 'autotriggerred definition environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{definition}<><>
                <>
            \end{definition}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{def:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'ax',
         name = 'axiom environment',
         dscr = 'autotriggerred axiom environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{axiom}<><>
                <>
            \end{axiom}
         ]],
         {
            sn(1, { ne(1, '[', ''), i(1), ne(1, ']', ''), }),
            sn(2, { ne(1, ' \\label{def:', ''), i(1), ne(1, '}', '') }),
            i(0),
         }
      )
   ),
   s(
      {
         trig = 'xm',
         name = 'example environment',
         dscr = 'autotriggerred example environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{example}
                <>
            \end{example}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'xl',
         name = 'examplelist environment',
         dscr = 'autotriggerred examplelist environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{examplelist}
                <>
            \end{examplelist}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'rm',
         name = 'remark environment',
         dscr = 'autotriggerred remark environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{remark}
                <>
            \end{remark}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'pb',
         name = 'problem environment',
         dscr = 'autotriggerred problem environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{problem}
                <>
            \end{problem}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'sl',
         name = 'solution environment',
         dscr = 'autotriggerred solution environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{solution}
                <>
            \end{solution}
         ]],
         { i(0) }
      )
   ),
   
   s(
      {
         trig = 'enm',
         name = 'enumerate environment',
         dscr = 'autotriggerred enumerate environment',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{enumerate}
                \item <>
            \end{enumerate}
         ]],
         { i(0) }
      )
   ),
   s(
      {
         trig = 'tz',
         name = 'tikzpicture environment',
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
         name = 'centered tikzpicture environment',
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
}

return {}, autosnippets
