return {
   {
      'L3MON4D3/LuaSnip',
      -- follow latest release
      -- version = '<CurrentMajor>.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
         -- I have disabled this because I want to use the latest version, not the latest major version.
         -- The latest version has 'condition' as a key in context,
         -- which makes more sense, and also has multisnippets.
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
      event = 'VeryLazy',
      keys = {
         {
            '<tab>', function()
                return require('luasnip').expand_or_jumpable(1) and '<Plug>luasnip-expand-or-jump' or '<tab>'
              end,
              expr = true, silent = true, mode = 'i'
         },
         { '<tab>', function() require('luasnip').jump(1) end, mode = 's' },
         { '<s-tab>', function() require('luasnip').jump(-1) end, mode = {'i', 's'} },
      },
      config = function()
         require('luasnip').config.set_config({
            enable_autosnippets = true,
            update_events = 'TextChanged,TextChangedI',
            store_selection_keys = '<tab>',
         })
         require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/LuaSnip/'})
      end,
   },
}
