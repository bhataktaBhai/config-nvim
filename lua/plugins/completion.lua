-- lazy.nvim
return {
   {
      'hrsh7th/nvim-cmp',
      version = false, -- latest version is too old per folke
      dependencies = {
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-omni',
         'saadparwaiz1/cmp_luasnip',
      },
      event = 'InsertEnter',
      opts = function()
         local cmp = require('cmp')
         local icons = {
            Array = ' ', Boolean = ' ', Class = ' ', Color = ' ',
            Constant = ' ', Constructor = ' ', Copilot = ' ', Enum = ' ',
            EnumMember = ' ', Event = ' ', Field = ' ', File = ' ',
            Folder = ' ', Function = ' ', Interface = ' ', Key = ' ',
            Keyword = ' ', Method = ' ', Module = ' ', Namespace = ' ',
            Null = ' ', Number = ' ', Object = ' ', Operator = ' ',
            Package = ' ', Property = ' ', Reference = ' ', Snippet = ' ',
            String = ' ', Struct = ' ', Text = ' ', TypeParameter = ' ',
            Unit = ' ', Value = ' ', Variable = ' ',
         }
         return {
            completion = {
               completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
               expand = function(args)
                  require('luasnip').lsp_expand(args.body)
               end,
            },
            sources = {
               { name = 'nvim_lsp' },
               { name = 'omni' },
               { name = 'luasnip' },
               { name = 'buffer' },
            },
            mapping = cmp.mapping.preset.insert({
               ['<C-n>'] = cmp.mapping.select_next_item(),
               ['<C-p>'] = cmp.mapping.select_prev_item(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               -- ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-e>'] = cmp.mapping.close(),
               ['<C-Space>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
               }),
               ['<S-CR>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
               }),
            }),
            formatting = {
               format = function (_, item)
                  if icons[item.kind] then
                     item.kind = icons[item.kind] .. ' ' .. item.kind
                  end
                  return item
               end
            },
         }
      end,
   },
   {
      'L3MON4D3/LuaSnip',
      -- nightly
      build = 'make install_jsregexp',
      event = 'VeryLazy',
      keys = {
         {
            '<tab>', function()
               return require('luasnip').expand_or_jumpable(1)
                     and '<Plug>luasnip-expand-or-jump'
                     or '<tab>'
            end,
            expr = true, silent = true, mode = 'i', remap = true,
         },
         { '<tab>', function() require('luasnip').jump(1) end, mode = 's' },
         { '<s-tab>', function() require('luasnip').jump(-1) end, mode = {'i', 's'} },
      },
      opts = {
         enable_autosnippets = true,
         update_events = 'TextChanged,TextChangedI',
         store_selection_keys = '<tab>',
         delete_check_events = 'InsertLeave',
      },
      config = function(_, opts)
         require('luasnip').config.set_config(opts)
         require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/lua/LuaSnip/' })
      end,
   },
   {
      'zbirenbaum/copilot.lua',
      commit = '406f148',
      build = ':Copilot auth',
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
