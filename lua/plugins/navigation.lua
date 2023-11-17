return {
   -- {
   --    'folke/flash.nvim',
   --    event = 'VeryLazy',
   --    opts = {},
   -- },
   {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      cmd = 'Telescope',
      opts = {
         defaults = {
            sorting_strategy = 'descending',
            selection_strategy = 'reset',
            scroll_strategy = 'cycle',
            layout_strategy = 'horizontal',
            layout_config = {
               bottom_pane = {
                  height = 25,
                  preview_cutoff = 120,
                  prompt_position = 'top',
               },
               center = {
                  height = 0.4,
                  preview_cutoff = 40,
                  prompt_position = 'top',
                  width = 0.5,
               },
               cursor = {
                  height = 0.4,
                  preview_cutoff = 40,
                  width = 0.8,
               },
               horizontal = {
                  height = 0.9,
                  preview_cutoff = 120,
                  prompt_position = 'bottom',
                  width = 0.8,
               },
               vertical = {
                  height = 0.9,
                  preview_cutoff = 40,
                  prompt_position = 'bottom',
                  width = 0.8,
               },
            },
            cycle_layout_list = { 'horizontal', 'vertical' },
            winblend = 0,
            wrap_results = false,
            prompt_prefix = '> ',
            selection_caret = '> ',
            entry_prefix = '  ',
            multi_icon = '+',
            initial_mode = 'insert',
            border = true,
            path_display = {},
         },
      },
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      },
      cmd = 'NeoTree',
      keys = {
         {
            '<leader>fe', function ()
               require('neo-tree.command').execute({ toggle = true })
            end,
            desc = 'NeoTree explorer',
         },
         { '<leader>e', '<leader>fe', desc = 'NeoTree explorer', remap = true },
         {
            '<leader>fb', function ()
               require('neo-tree.command').execute({ source = 'buffers', toggle = true })
            end,
            desc = 'NeoTree explorer buffers',
         },
      },
      opts = {
         close_if_last_window = true,
         sort_case_insensitive = true,
      },
   },
}
