-- filename suggestions
-- set.wildmode = {'longest', 'full', 'list'}
-- set.wildmenu = true

vim.opt.wildignore = {
   '*.o', '*.out', '*.obj', '*.pyc', '*.class',
   '*.swp',
   '*.pdf', '*.png', '*.jpg', '*.jpeg', '*.gif', '*.bmp', '*.tiff', '*.ico',
   '*.fbd', '*.fdb_latexmk', '*.fls', '*.aux', '*.log', '*.synctex.gz', '*.synctex.gz(busy)', '*.toc',
   '*.hw', '*.lec', -- custom lists in LaTeX
   '*.dvi', '*.ps', '*.eps', '*.pdfsync',
   '.DS_Store', '.git', '.hg', '.svn', '.bzr',
}
vim.api.nvim_create_user_command('Lec', function (tbl)
      local nstr = tostring(tbl.args)
      if nstr:len() < 2 then
         nstr = '0' .. nstr
      end
      vim.cmd(':e lectures/lecture' .. nstr .. '.tex')
   end, { nargs = 1 }
)
