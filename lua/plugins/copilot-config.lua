return {
   {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      opts = {
         suggestion = {
            auto_trigger = true,
            keymap = {
               accept = '<C-j>',
               accept_word = '<C-l>',
               next = '<M-j>',
               prev = '<M-k>',
               dismiss = '<C-k>',
            },
         },
      },
   }
}
