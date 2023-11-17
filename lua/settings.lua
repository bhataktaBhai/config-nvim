local set = vim.opt
set.number = true
set.relativenumber = true

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- vsplit and hsplit to the right and below
set.splitright = true
set.splitbelow = true

-- minimum no. of lines above and below cursor
set.scrolloff = 2

-- highlight the current line, in insert mode
vim.api.nvim_create_augroup('highlight_current_line', {clear = true})
vim.api.nvim_create_autocmd('InsertEnter', {
   callback = function() set.cursorline = true end,
   group = 'highlight_current_line'
})
vim.api.nvim_create_autocmd('InsertLeave', {
   callback = function() set.cursorline = false end,
   group = 'highlight_current_line'
})

-- experimental
-- set.cmdheight = 0
