return {
   {
      'sirver/ultisnips',
      ft = 'snippets',
      config = function()
         local let = vim.g
         let.UltiSnipsExpandTrigger = '<tab>'
         let.UltiSnipsJumpForwardTrigger = '<tab>'
         let.UltiSnipsJumpBackwardTrigger = '<s-tab>'
         let.UltiSnipsEditSplit = 'vertical'
         let.UltiSnipsSnippetDirectories = {"~/.config/nvim/UltiSnips"} -- one entry: absolute path => no search
      end
   },
}
