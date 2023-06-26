local function configFn()
   local let = vim.g
   let.UltiSnipsExpandTrigger = '<localleader><tab>'
   let.UltiSnipsJumpForwardTrigger = '<tab>'
   let.UltiSnipsJumpBackwardTrigger = '<s-tab>'
   let.UltiSnipsEditSplit = 'vertical'
   let.UltiSnipsSnippetDirectories = {"~/.config/nvim/UltiSnips"} -- one entry: absolute path => no search
end

return {
   {
      'sirver/ultisnips',
      init = configFn,
   },
}
