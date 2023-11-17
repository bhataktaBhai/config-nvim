return {
   -- { 'lervag/vimtex' },
   {
      -- 'bhataktaBhai/nvimtex',
      'lervag/vimtex',
      version = false,
      ft = 'tex',
      -- keys = {
      --    {'<localleader>e', ':VimtexErrors<CR>', mode = 'n',
      --       desc = 'vimtex errors', remap = false, silent = true},
      -- },
      config = function()
         require('vimtex')
         local let = vim.g
         let.tex_flavor = 'latex'
         let.vimtex_quickfix_mode = 0
         let.vimtex_compiler_progname = 'pdflatex'
         let.tex_conceal = 'abdmg'
         let.vimtex_syntax_conceal = {sections = 1}

         let.vimtex_view_method = 'skim'
         let.vimtex_view_skim_activate = 1
         let.vimtex_view_skim_sync = 1

         let.vimtex_imaps_enabled = 0

         let.vimtex_fold_enabled = 1
         let.vimtex_fold_types = {
            comments = { enabled = 1 },
         }

         local math_toggle = {}
         math_toggle['$'] = '\\['
         math_toggle['\\['] = 'align*'
         math_toggle['align*'] = 'equation'
         math_toggle['equation'] = '$'
         let.vimtex_env_toggle_math_map = math_toggle

         let.vimtex_syntax_custom_cmds = {
            { name = 'R',     concealchar = 'ℝ',  mathmode =  true                    },
            { name = 'N',     concealchar = 'ℕ',  mathmode =  true                    },
            { name = 'P',     concealchar = 'ℙ',  mathmode =  true                    },
            { name = 'Z',     concealchar = 'ℤ',  mathmode =  true                    },
            { name = 'Q',     concealchar = 'ℚ',  mathmode =  true                    },
            { name = 'C',     concealchar = 'ℂ',  mathmode =  true                    },
            { name = 'O',     concealchar = '∅',  mathmode =  true                    },
            { name = 'L',     concealchar = 'ℒ',  mathmode =  true                    },
            { name = 'lxor',  concealchar = '⊕',  mathmode =  true                    },
            { name = 'given', concealchar = '|',  mathmode =  true                    },
            { name = 'gcd',   conceal     = true, mathmode =  true                    },
            { name = 'bm',    conceal     = true, mathmode =  true, argstyle = 'bold' },
            { name = 'concat',concealchar = '⧺',  mathmode =  true,                   },
            { name = 'Var',   conceal     = true,                   argstyle = 'ital' },
            { name = 'Var',   conceal     = true, mathmode =  true, argstyle = 'ital' },
            -- { name = 'State', conceal     = true, mathmode = false                    },
         }
         let.vimtex_syntax_custom_cmds_with_concealed_delims = {
            { name = 'set',   mathmode = true, cchar_open = '{', cchar_close = '}' },
            { name = 'abs',   mathmode = true, cchar_open = '|', cchar_close = '|' },
            { name = 'norm',  mathmode = true, cchar_open = '‖', cchar_close = '‖' },
            { name = 'floor', mathmode = true, cchar_open = '⌊', cchar_close = '⌋' },
            { name = 'ceil',  mathmode = true, cchar_open = '⌈', cchar_close = '⌉' },
            { name = 'binom',    nargs = 2, mathmode =  true, cchar_open = '(',      cchar_mid = '|', cchar_close = ')' },
            { name = 'innerp',   nargs = 2, mathmode =  true, cchar_open = '⟨',      cchar_mid = ',', cchar_close = '⟩' },
            -- { name = 'frac',     nargs = 2, mathmode =  true, cchar_open = '(',      cchar_mid = '÷', cchar_close = ')' },
            { name = 'Function', nargs = 2, mathmode = false, argstyle = 'boldital', cchar_mid = '(', cchar_close = ')' },
            { name = 'Fn',       nargs = 2, mathmode = false, argstyle = 'under', cchar_mid = '(', cchar_close = ')' },
            { name = 'Call',     nargs = 2, mathmode = false, argstyle = 'ital',     cchar_mid = '(', cchar_close = ')' },
            { name = 'Call',     nargs = 2, mathmode =  true, argstyle = 'ital',     cchar_mid = '(', cchar_close = ')' },
         }

         local function texFocusVim()
           -- Replace `TERMINAL` with the name of your terminal application
           -- Example: execute "!open -a iTerm"  
           -- Example: execute "!open -a Alacritty"
           vim.cmd [[ silent execute "!open -a iTerm2" ]]
           vim.cmd [[ redraw ]]
         end
         local vimtex_event_focus_group = vim.api.nvim_create_augroup('vimtex_event_focus', { clear = true })
         vim.api.nvim_create_autocmd('User', {
            pattern = 'VimtexEventViewReverse',
            callback = texFocusVim,
            group = vimtex_event_focus_group,
         })
         -- vim.cmd [[function! s:TexFocusVim() abort
         --   " Replace `TERMINAL` with the name of your terminal application
         --   " Example: execute "!open -a iTerm"  
         --   " Example: execute "!open -a Alacritty"
         --   silent execute "!open -a iTerm2"
         --   redraw!
         -- endfunction
         -- augroup vimtex_event_focus
         --   autocmd!
         --   autocmd User VimtexEventViewReverse call TexFocusVim()
         -- augroup END
         -- ]]

         let.vimtex_quickfix_ignore_filters = {
            'Underfull \\hbox (badness [0-9]*) in paragraph at lines',
            'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines',
            'Underfull \\hbox (badness [0-9]*) in ',
            'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
            'Package hyperref Warning: Token not allowed in a PDF string',
            'Package typearea Warning: Bad type area settings!'
         }
         vim.opt.conceallevel = 2
      end
   }
}
