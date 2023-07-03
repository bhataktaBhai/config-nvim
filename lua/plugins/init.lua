return {
   ---- Order of keys
   -- version, dependencies, build, lazy, priority, cmd, ft, event, keys, opts, init, config
   {
      'numToStr/Comment.nvim',
      keys = {'<leader>c', '<leader>b', '<localleader>c', '<localleader>b'},
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
