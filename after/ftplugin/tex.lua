local set = vim.opt
local let = vim.g

set.conceallevel = 2

-- not ideal method to do this -- do what? I don't remember
-- vim.cmd('setlocal indentexpr=')
-- anyway this seems to be the default (refer :h indentexpr)

let.vimtex_quickfix_ignore_filters = {
   'Underfull \\hbox (badness [0-9]*) in paragraph at lines',
   'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines',
   'Underfull \\hbox (badness [0-9]*) in ',
   'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
   'Package hyperref Warning: Token not allowed in a PDF string',
   'Package typearea Warning: Bad type area settings!'
}

-- set.termguicolors = true -- what does this do?
-- set.foldmethod = 'expr'
-- vim.g.vimtex_fold_enabled = 1
