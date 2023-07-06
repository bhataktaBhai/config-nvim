return {
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         { 'folke/neodev.nvim', config = true },
         'mason.nvim',
         'williamboman/mason-lspconfig.nvim',
      },
      event = {'BufReadPre', 'BufNewFile'},
      opts = {
         servers = {
            vimls = {},
            texlab = {},
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
         keymap = {
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wl', function()
            -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, bufopts)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            ['gD'] = vim.lsp.buf.declaration,
            ['gd'] = vim.lsp.buf.definition,
            ['K'] = vim.lsp.buf.hover,
            ['gi'] = vim.lsp.buf.implementation,
            ['<C-k>'] = vim.lsp.buf.signature_help,
            ['<leader>D'] = vim.lsp.buf.type_definition,
            ['<leader>rn'] = vim.lsp.buf.rename,
            ['<leader>ca'] = vim.lsp.buf.code_action,
            ['gr'] = vim.lsp.buf.references,
            ['<leader>f'] = function()
               vim.lsp.buf.format { async = true }
            end,
         }
      },
      config = function(_, opts)
         local function on_attach (_, bufnr)
            for k, v in pairs(opts.keymap or {}) do
               vim.keymap.set('n', k, v, { remap = false, silent = true, buffer = bufnr })
            end
         end
         local servers = opts.servers
         local function default_handler(server)
            local server_opts = servers[server] or {}
            server_opts.on_attach = on_attach
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
      build = ':MasonUpdate',
      cmd = 'Mason',
      config = true,
   },
}
