local map = vim.keymap.set
local opts = {remap = false, silent = true}

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local function nmap(lhs, rhs, opts)
   map('n', lhs, rhs, opts)
end
local function imap(lhs, rhs, opts)
   map('i', lhs, rhs, opts)
end
local function vmap(lhs, rhs, opts)
   map('v', lhs, rhs, opts)
end
-- For forcing myself to use hjkl and moving between windows.
nmap('<Up>', '<C-w>k', opts)
nmap('<Down>', '<C-w>j', opts)
nmap('<Left>', '<C-w>h', opts)
nmap('<Right>', '<C-w>l', opts)

-- Move to front and end of line
nmap('H', '^', opts)
nmap('L', '$', opts)

-- Move to bottom and center of screen
nmap('G', 'Gzz', opts)

-- colon is hard to type
nmap(';', ':', opts)

-- make current word uppercase
imap('<C-u>', '<Esc>viwUea', opts)
nmap('<leader>u', 'viwUe', opts)

-- make current word lowercase
imap('<C-l>', '<Esc>viwuea', opts)
nmap('<leader>l', 'viwue', opts)

-- get to editing faster
nmap('<leader>ev', ':vs ~/.config/nvim/<CR>', opts)
-- source init.lua
nmap('<leader>sv', ':source $MYVIMRC<CR>', opts)

-- surround word with quotes
nmap('<leader>"', 'ea"<esc>bi"<esc>lel', opts)
vmap('<leader>"', '<esc>`>a"<esc>`<i"<esc>', opts) -- <esc>`<i"<esc>`>a"<esc> doesn't work
-- because the first quote insertion makes `> not coincide with the end of the visual selection.

-- don't ever use escape
imap('kj', '<esc>', opts)
-- imap('jk', '<esc>', opts)
imap('<esc>', '<nop>', opts)

-- operator pending mode
map('o', 'p', 'i(', opts)
-- nvim-tree idk
--nmap('<leader>e', ':NvimTreeToggle<CR>', opts)
