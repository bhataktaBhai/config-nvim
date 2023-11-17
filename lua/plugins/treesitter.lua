return {
   {
      'nvim-treesitter/nvim-treesitter',
      version = false, -- too old as per folke
      dependencies = {
         {
            'nvim-treesitter/nvim-treesitter-textobjects',
         },
      },
      build = ':TSUpdate',
      event = { 'BufReadPre', 'BufNewFile' },
      cmd = 'TSUpdateSync', -- why is this needed?
      keys = {
         { '<C-space>', desc = 'Increment selection' },
         { '<BS>', desc = 'Decrement selection' },
      },
      opts = {
         highlight = {
            enable = true,
            disable = { 'latex' }, -- VimTeX
         },
         indent = {
            enable = true,
            disable = { 'lua' }, -- weird indenting
         },
         ensure_installed = {
            'lua',
            'vim',
            'bash',
            'regex',
            'python',
            'latex',
         },
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = '<C-space>',
               node_incremental = '<C-space>',
               scope_incremental = false,
               node_decremental = '<BS>',
            },
         },
      },
      config = function (_, opts)
         local ts_configs = require("nvim-treesitter.configs")
         ts_configs.setup(opts)
         local ts_parsers = require("nvim-treesitter.parsers")
         local function parse ()
            local lang = ts_parsers.ft_to_lang(vim.bo.filetype)
            local parser = ts_parsers.get_parser(vim.fn.bufnr(), lang)
            if parser then
               return parser:parse()
            else
               return false
            end
         end
         local function throttle(fn, ms)
            local timer = vim.uv.new_timer()
            local running = false
            return function(...)
               if running then return end
               assert(timer ~= nil, 'timer is nil')
               timer:start(ms, 0, function() running = false end)
               running = true
               pcall(vim.schedule_wrap(fn), select(1, ...))
            end
         end
         local treesitter_parse_debounce = throttle(parse, 100)  -- 100 ms
         local treesitter_update_parsing = vim.api.nvim_create_augroup(
            'TreesitterUpdateParsing', { clear = true }
         )
         vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
            callback = treesitter_parse_debounce,
            group = treesitter_update_parsing,
         })
         vim.opt.foldmethod = 'expr'
         vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
         vim.opt.foldenable = false
      end,
   },
}
