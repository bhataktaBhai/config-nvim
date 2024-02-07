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
         -- require('vimtex')
         local let = vim.g
         let.tex_flavor = 'latex'
         let.vimtex_quickfix_mode = 0
         -- deprecated on 2021-10-25, see :h g:vimtex_compiler_progname
         -- let.vimtex_compiler_progname = 'pdflatex' 
         let.tex_conceal = 'abdmg'
         let.vimtex_syntax_conceal = { sections = 1 }

         let.vimtex_view_method = 'skim'
         let.vimtex_view_skim_activate = 1
         let.vimtex_view_skim_sync = 1

         let.vimtex_imaps_enabled = 0

         let.vimtex_fold_enabled = 1
         let.vimtex_fold_types = {
            comments = { enabled = 1 },
         }
         let.vimtex_indent_lists = {}

         local math_toggle = {}
         math_toggle['$'] = '\\['
         math_toggle['\\['] = 'align*'
         math_toggle['align*'] = 'equation'
         math_toggle['equation'] = '$'
         let.vimtex_env_toggle_math_map = math_toggle

         let.vimtex_syntax_packages = {
            siunitx = { load = false },
         }
         local math_and_text = {
            { name = 'mcA', concealchar = '𝒜' },
            { name = 'mcB', concealchar = 'ℬ' },
            { name = 'mcC', concealchar = '𝒞' },
            { name = 'mcD', concealchar = '𝒟' },
            { name = 'mcE', concealchar = 'ℰ' },
            { name = 'mcF', concealchar = 'ℱ' },
            { name = 'mcG', concealchar = '𝒢' },
            { name = 'mcH', concealchar = 'ℋ' },
            { name = 'mcI', concealchar = 'ℐ' },
            { name = 'mcJ', concealchar = '𝒥' },
            { name = 'mcK', concealchar = '𝒦' },
            { name = 'mcL', concealchar = 'ℒ' },
            { name = 'mcM', concealchar = 'ℳ' },
            { name = 'mcN', concealchar = '𝒩' },
            { name = 'mcO', concealchar = '𝒪' },
            { name = 'mcP', concealchar = '𝒫' },
            { name = 'mcQ', concealchar = '𝒬' },
            { name = 'mcR', concealchar = 'ℛ' },
            { name = 'mcS', concealchar = '𝒮' },
            { name = 'mcT', concealchar = '𝒯' },
            { name = 'mcU', concealchar = '𝒰' },
            { name = 'mcV', concealchar = '𝒱' },
            { name = 'mcW', concealchar = '𝒲' },
            { name = 'mcX', concealchar = '𝒳' },
            { name = 'mcY', concealchar = '𝒴' },
            { name = 'mcZ', concealchar = '𝒵' },
            { name = 'R',   concealchar = 'ℝ' },
            { name = 'N',   concealchar = 'ℕ' },
            { name = 'P',   concealchar = 'ℙ' },
            { name = 'Z',   concealchar = 'ℤ' },
            { name = 'Q',   concealchar = 'ℚ' },
            { name = 'C',   concealchar = 'ℂ' },
            { name = 'O',   concealchar = '∅' },
         }
         local custom_cmds = {
            { name = 'L',     concealchar = 'ℒ',  mathmode =  true                    },
            { name = 'lxor',  concealchar = '⊕',  mathmode =  true                    },
            { name = 'given', concealchar = '|',  mathmode =  true                    },
            { name = 'gcd',   conceal     = true, mathmode =  true                    },
            { name = 'bm',    conceal     = true, mathmode =  true, argstyle = 'bold' },
            { name = 'concat',concealchar = '⧺',  mathmode =  true,                   },
            { name = 'Var',   conceal     = true,                   argstyle = 'ital' },
            { name = 'Var',   conceal     = true, mathmode =  true, argstyle = 'ital' },
            -- { name = 'State', conceal     = true, mathmode = false                    },
            { name = 'checkmark', concealchar = '✓' },
         }
         for _, v in ipairs(math_and_text) do
            local v_copy = vim.deepcopy(v)
            v.mathmode = true
            v_copy.mathmode = false
            custom_cmds[#custom_cmds + 1] = v
            custom_cmds[#custom_cmds + 1] = v_copy
         end
         let.vimtex_syntax_custom_cmds = custom_cmds
         let.vimtex_syntax_custom_cmds_with_concealed_delims = {
            { name = 'set',   mathmode = true, cchar_open = '{', cchar_close = '}' },
            { name = 'abs',   mathmode = true, cchar_open = '|', cchar_close = '|' },
            { name = 'norm',  mathmode = true, cchar_open = '‖', cchar_close = '‖' },
            { name = 'floor', mathmode = true, cchar_open = '⌊', cchar_close = '⌋' },
            { name = 'ceil',  mathmode = true, cchar_open = '⌈', cchar_close = '⌉' },
            { name = 'binom',    nargs = 2, mathmode =  true, cchar_open = '(',      cchar_mid = '|', cchar_close = ')' },
            { name = 'stirling', nargs = 2, mathmode =  true, cchar_open = '{',      cchar_mid = '|', cchar_close = '}' },
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
