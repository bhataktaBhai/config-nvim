local set = vim.opt
local let = vim.g

set.number = true
set.relativenumber = true
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smarttab = true
-- set.mouse = 'a'
-- set.scroll-mouse-wheel = false

set.splitright = true
set.splitbelow = true

-- minimum nr. of lines above and below cursor
set.scrolloff = 5

-- syntax on by default in neovim
-- filetype plugin indent on by default in neovim

let.mapleader = ' '
let.maplocalleader = '\\'

set.backspace = 'indent,eol,start'

-- to highlight the current line, in insert mode
vim.api.nvim_create_augroup('highlight_current_line', {clear = true})
vim.api.nvim_create_autocmd('InsertEnter', {
   callback = function() set.cursorline = true end,
   group = 'highlight_current_line'
})
vim.api.nvim_create_autocmd('InsertLeave', {
   callback = function() set.cursorline = false end,
   group = 'highlight_current_line'
})
