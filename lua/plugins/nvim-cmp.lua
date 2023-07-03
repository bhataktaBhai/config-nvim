-- lazy.nvim
return {
   {
      'hrsh7th/nvim-cmp',
      version = false, -- latest version is too old per folke
      dependencies = {
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'saadparwaiz1/cmp_luasnip',
      },
      event = 'InsertEnter',
      opts = function()
         local cmp = require('cmp')
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
               { name = 'buffer' },
               { name = 'luasnip' },
            },
            mapping = cmp.mapping.preset.insert({
               ['<C-n>'] = cmp.mapping.select_next_item(),
               ['<C-p>'] = cmp.mapping.select_prev_item(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-e>'] = cmp.mapping.close(),
               ['<CR>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
               }),
               ['<S-CR>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
               }),
            }),
         }
      end,
   },
}
