return {
   {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      opts = {
         disable_filetype = { 'TelescopePrompt', 'tex' },
      },
   },
   -- {
   --    'boltlessengineer/smart-tab.nvim',
   --    event = 'InsertEnter',
   --    opts = {
   --       filetype_exclude = { 'tex' }
   --    },
   -- },
   -- {
   --    -- tabout
   --    'abecodes/tabout.nvim',
   --    event = 'InsertEnter',
   --    opts = {},
   -- }
}
