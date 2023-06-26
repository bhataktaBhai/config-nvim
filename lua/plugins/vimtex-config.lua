-- let g:airline#extensions#vimtex#enabled = 1
return {
   {
      'lervag/vimtex',
      ft = 'tex',
      config = function()
         local let = vim.g
         let.tex_flavor = 'latex'
         let.vimtex_quickfix_mode = 0
         let.vimtex_compiler_progname = 'latexmk'
         let.tex_conceal = 'abdmg'
         let.vimtex_syntax_conceal = {sections = 1}
         let.airline_extensions_vimtex_enabled = 1

         let.vimtex_view_method = 'skim'
         let.vimtex_view_skim_activate = 1
         let.vimtex_view_skim_sync = 1

         local map = vim.keymap.set
         map('n', '<localleader>e', ':VimtexErrors<CR>', {
            remap = false,
            silent = true,
            desc = 'vimtex errors',
         })

         local math_toggle = {}
         math_toggle['$'] = '\\['
         math_toggle['\\['] = 'align*'
         math_toggle['align*'] = 'equation'
         math_toggle['equation'] = '$'
         let.vimtex_env_toggle_math_map = math_toggle

         let.vimtex_syntax_custom_cmds = {
            {name = 'R', concealchar = 'ℝ'},
            {name = 'N', concealchar = 'ℕ'},
            {name = 'Z', concealchar = 'ℤ'},
            {name = 'Q', concealchar = 'ℚ'},
            {name = 'C', concealchar = 'ℂ'},
            {name = 'O', concealchar = '∅'},
            {name = 'lxor', concealchar = '⊕'},
         }
         
         -- vim.cmd([[function! s:TexFocusVim() abort
         --   " Replace `TERMINAL` with the name of your terminal application
         --   " Example: execute "!open -a iTerm"  
         --   " Example: execute "!open -a Alacritty"
         --   silent execute "!open -a iTerm2"
         --   redraw!
         -- endfunction]])
         function TexFocusVim()
           -- Replace `TERMINAL` with the name of your terminal application
           -- Example: execute "!open -a iTerm"  
           -- Example: execute "!open -a Alacritty"
           vim.cmd('silent execute "!open -a iTerm2"')
           vim.cmd('redraw!')
         end

         -- local vimtex_event_focus_group = vim.api.nvim_create_augroup('vimtex_event_focus', {clear = true})
         -- vim.api.nvim_create_autocmd('User VimtexEventViewReverse', {
         --    command = 'call TexFocusVim()',
         --    group = vimtex_event_focus_group
         -- })
         vim.cmd([[
         augroup vimtex_event_focus
           autocmd!
           autocmd User VimtexEventViewReverse call TexFocusVim()
         augroup END
         ]])
      end
   }
}
