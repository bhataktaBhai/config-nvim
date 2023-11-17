return {
   ---- Order of keys
   -- version, dependencies, build, lazy, priority, cmd, ft, event, keys, opts, init, config
   {
      'numToStr/Comment.nvim',
      keys = { '<leader>c', '<leader>b', '<localleader>c', '<localleader>b' },
      opts = {
         -- ignore = '^$',
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
   {
      'PeterRincker/vim-argumentative',
      event = 'VeryLazy',
   },
   {
      'kylechui/nvim-surround',
      event = 'VeryLazy',
      opts = {},
   },
   {
      'folke/which-key.nvim',
      event = 'VeryLazy',
      opts = {},
   },
}
