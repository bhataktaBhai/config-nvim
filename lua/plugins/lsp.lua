return {
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         { 'folke/neodev.nvim', opts = {} },
         'mason.nvim',
         'williamboman/mason-lspconfig.nvim',
      },
      event = { 'BufReadPre', 'BufNewFile' },
      opts = {
         diagnostic = {
            virtual_text = false,
            severity_sort = true,
            icons = {
               Error = ' ',
               Warn = ' ',
               Hint = ' ',
               Info = ' ',
            },
         },
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
            leanls = {},
         },
         global_keymap = {
            ['<leader>d'] = { vim.diagnostic.open_float, 'open diagnostics' },
         },
         on_attach_keymap = {
            gD = { vim.lsp.buf.declaration, 'go to declaration' },
            gd = { vim.lsp.buf.definition, 'go to definition' },
            K = { vim.lsp.buf.hover, 'show hover' },
            gi = { vim.lsp.buf.implementation, 'go to implementation' },
            ['<C-k>'] = { vim.lsp.buf.signature_help, 'show signature help' },
            gT = { vim.lsp.buf.type_definition, 'go to type definition' },
            ['<leader>r'] = { vim.lsp.buf.rename, 'rename' },
            ['<leader>a'] = vim.lsp.buf.code_action,
            gr = { vim.lsp.buf.references, 'show references' },
            ['<leader>f'] = {
               function() vim.lsp.buf.format { async = true } end,
               'format'
            }
         }
      },
      config = function(_, opts)
         -- add border to hover window
         vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

         vim.opt.signcolumn = 'number'
         vim.diagnostic.config(opts.diagnostic or {})

         for name, icon in pairs(opts.diagnostic and opts.diagnostic.icons or {}) do
            name = 'DiagnosticSign' .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
         end

         for k, v in pairs(opts.global_keymap or {}) do
            vim.keymap.set('n', k, v[1], {
               remap = false, silent = true, desc = v[2]
            })
         end

         local function on_attach(_, bufnr)
            for k, v in pairs(opts.on_attach_keymap or {}) do
               vim.keymap.set('n', k, v[1], {
                  silent = true, remap = true,
                  buffer = bufnr,
                  desc = v[2]
               })
            end
         end

         local servers = opts.servers
         local function default_handler(server)
            local server_opts = servers[server] or {}
            server_opts.on_attach = on_attach
            require('lspconfig')[server].setup(server_opts)
         end

         local all_mslp_servers = vim.tbl_keys(
            require("mason-lspconfig.mappings.server").lspconfig_to_package
         )
         local server_names = vim.tbl_filter(
            function(name)
               return vim.tbl_contains(all_mslp_servers, name)
            end,
            vim.tbl_keys(servers)
         )
         require('mason-lspconfig').setup({ ensure_installed = server_names, handlers = { default_handler } })
      end,
   },
   {
      'jose-elias-alvarez/null-ls.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
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
