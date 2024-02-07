local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local line_begin = require('luasnip.extras.conditions.expand').line_begin

local tex = require('LuaSnip.tex.util')
local in_algo_rithm = tex.in_env('algorithmic') + tex.in_env('algo')
                        + tex.in_env('algox')

local autosnippets = {
   s(
      {
         trig = 'alm',
         name = 'algorithm algorithmic',
         condition = line_begin,
      },
      fmta(
         [[
            \begin{algorithm}
            \caption{<>}
            \label{alg:<>}
            \begin{algorithmic}[1]
                <>
            \end{algorithmic}
            \end{algorithm}
         ]],
         { i(1), i(2), i(0) }
      )
   ),
   s(
      {
         trig = 'st',
         name = '\\State',
         condition = in_algo_rithm * line_begin,
      },
      t'\\State'
   ),
   s(
      {
         trig = 'if',
         name = '\\If{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \If{<>}
                <>
            \EndIf
         ]],
         { i(1), i(0) }
      )
   ),
   s(
      {
         trig = 'elf',
         name = '\\ElsIf{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \ElsIf{<>}
                <>
         ]],
         { i(1), i(0) }
      )
   ),
   s(
      {
         trig = 'els',
         name = '\\Else',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \Else
                <>
         ]],
         { i(0) })
   ),
   s(
      {
         trig = 'for',
         name = '\\For{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \For{<>}
                <>
            \EndFor
         ]],
         { i(1), i(0) }
      )
   ),
   s(
      {
         trig = 'while',
         name = '\\While{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \While{<>}
                <>
            \EndWhile
         ]],
         { i(1), i(0) }
      )
   ),
   s(
      {
         trig = 'ret',
         name = '\\Return',
         condition = in_algo_rithm * line_begin,
      },
      t'\\State \\Return'
   ),
   s(
      {
         trig = 'fn',
         name = '\\Function{}{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta(
         [[
            \Function{<>}{<>}
                <>
            \EndFunction
         ]],
         { i(1), i(2), i(0) }
      )
   ),
   s(
      {
         trig = 'call',
         name = '\\Call{}{}',
         condition = in_algo_rithm * line_begin,
      },
      fmta('\\Call{<>}{<>}',
         { i(1), i(2) }
      )
   ),

   -- operators
   tex.ms(
      {
         trig = '=',
         name = 'assignment',
         condition = in_algo_rithm,
      },
      t'\\gets'
   ),
   tex.ms(
      {
         trig = '\\gets=',
         name = 'equal',
         condition = in_algo_rithm,
         priority = 10000,
      },
      t'='
   ),
}

return {}, autosnippets
