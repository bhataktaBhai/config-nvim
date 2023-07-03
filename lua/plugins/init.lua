return {
   -- {
   --    'nvim-tree/nvim-tree.lua',
   --    dependencies = { 'nvim-tree/nvim-web-devicons' },
   -- },
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
      keys = {'<leader>c', '<leader>b', '<localleader>c', '<localleader>b'},
   },
   -- 'tree-sitter/tree-sitter',
   {
      'PeterRincker/vim-argumentative',
      event = 'VeryLazy',
   },
   -- {
   --    'echasnovski/mini.pairs',
   --    event = 'VeryLazy',
   --    config = true,
   -- },
   -- 'dylanaraps/wal',
   -- {
   --    'folke/trouble.nvim',
   --     dependencies = { 'nvim-tree/nvim-web-devicons' },
   -- },
}
