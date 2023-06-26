return {
   {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
   },
   {
      'numToStr/Comment.nvim',
      opts = {
         ignore = '^$',
         toggler = {
            line = '<leader>c',
            block = '<leader>b',
         },
         opleader = {
            line = '<localleader>c',
            block = '<localleader>b',
         },
      },
   },
   'tree-sitter/tree-sitter',
   'PeterRincker/vim-argumentative',
   'dylanaraps/wal',
   {
      'folke/trouble.nvim',
       dependencies = { 'nvim-tree/nvim-web-devicons' },
   },
}
