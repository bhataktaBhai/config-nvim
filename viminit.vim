set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
syntax on
filetype plugin indent on

let maplocalleader = "\\"

" nnoremap y "+y
" nnoremap Y "+Y
" nnoremap p "+p
" nnoremap P "+P

set backspace=indent,eol,start  " more powerful backspacing

call plug#begin()

" Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tree-sitter/tree-sitter'

Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'PeterRincker/vim-argumentative'
" Plug 'dylanaraps/wal'

call plug#end()

lua require("config")

colorscheme carbonfox
" colorscheme wal
" set background=dark

" function! ZathuraHook() abort
"   if exists('b:vimtex.viewer.xwin_id') && b:vimtex.viewer.xwin_id <= 0
"     silent call system('xdotool windowactivate ' . b:vimtex.viewer.xwin_id . ' --sync')
"     silent call system('xdotool windowraise ' . b:vimtex.viewer.xwin_id)
"   endif
" endfunction
" 
" augroup vimrc_vimtex
"   autocmd!
"   autocmd User VimtexEventView call ZathuraHook()
" augroup END

" au TextChanged <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif

let g:UltiSnipsExpandTrigger = 'q<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

" Copilot trigger
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

autocmd InsertEnter,InsertLeave * set cul!

""" Colorscheme
" Returns true if the color hex value is light
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction
