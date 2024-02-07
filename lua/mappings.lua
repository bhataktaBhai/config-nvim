vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set
local opts = { remap = false, silent = true }

local function nmap(lhs, rhs, opt)
   map('n', lhs, rhs, opt)
end
local function smap(lhs, rhs, opt)
   map('s', lhs, rhs, opt)
end
local function cmap(lhs, rhs, opt)
   map('c', lhs, rhs, opt)
end

nmap('<leader>', '<Nop>', opts)
nmap('<localleader>', '<Nop>', opts)

-- move between windows
nmap('<Up>', '<C-w>k', opts)
nmap('<Down>', '<C-w>j', opts)
nmap('<Left>', '<C-w>h', opts)
nmap('<Right>', '<C-w>l', opts)

-- move to front and end of line
nmap('H', '^', opts)
nmap('L', '$', opts)
nmap('gL', 'g$', opts)
-- delete from end of line
-- nmap('X', '$x', opts)

-- move to bottom and center of screen
nmap('G', 'Gzz', opts)

-- colon is hard to type
nmap(';', ':', opts)
nmap(':', ';', opts)

-- don't ever use escape
map({ 'i', 'v' }, '<Esc>', '<nop>', opts)
map({ 'i', 'v' }, 'kj'   , '<esc>', opts)
-- Note: In command mode, mappings to <Esc> run the command for some odd
-- historical vi compatibility reason. We use the alternate method of
-- exiting which is Ctrl-C.
-- https://vi.stackexchange.com/questions/16963/remap-esc-key-in-vim#comment31245_18081
cmap('kj', '<C-c>', opts)

-- operator pending mode
map('o', 'p', 'i(', opts)

-- select mode: switch to visual and append at end
smap('<C-a>', '<C-g>oA', opts)

-- navigate between buffers
nmap('gb', ':buffers<CR>:buffer<Space>', opts)

-- delete in normal mode
nmap('<Del>', 'hxl', opts)
