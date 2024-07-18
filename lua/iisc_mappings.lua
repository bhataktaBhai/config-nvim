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

nmap('gl', ':vs lectures/lecture.tex<left><left><left><left>', opts)
nmap('gle', ':e lectures/lecture.tex<left><left><left><left>', opts)
