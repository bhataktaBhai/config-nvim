return {
   {
      'neovim/nvim-lspconfig',
      event = {'BufReadPre', 'BufNewFile'},
      dependencies = {
         { 'folke/neodev.nvim', config = true },
         'mason.nvim',
         'williamboman/mason-lspconfig.nvim',
      },
      opts = {
         servers = {
            vimls = {},
            lua_ls = {
               settings = {
                  Lua = {
                     workspace = {
                        checkThirdParty = false,
                     },
                     completion = {
                        callSnippet = 'Replace',
                     },
                  },
               },
            },
         },
      },
      config = function(_, opts)
         local servers = opts.servers
         local function default_handler(server)
            local server_opts = servers[server] or {}
            require('lspconfig')[server].setup(server_opts)
         end

         local server_names = vim.tbl_keys(servers)
         require('mason-lspconfig').setup({ ensure_installed = server_names, handlers = { default_handler } })
      end,
   },
   {
      'jose-elias-alvarez/null-ls.nvim',
      event = {'BufReadPre', 'BufNewFile'},
      dependencies = { 'mason.nvim' },
      config = true,
   },
   {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      build = ':MasonUpdate',
      config = true,
   },
}
