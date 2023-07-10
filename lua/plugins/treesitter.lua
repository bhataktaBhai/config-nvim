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
         indent = { enable = true },
         ensure_installed = {
            'lua',
            'python',
            'latex',
         },
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = "<C-space>",
               node_incremental = "<C-space>",
               scope_incremental = false,
               node_decremental = "<bs>",
            },
         },
      },
      config = function (_, opts)
         if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
               if added[lang] then
                  return false
               end
               added[lang] = true
               return true
            end, opts.ensure_installed)
         end
         require("nvim-treesitter.configs").setup(opts)
      end,
   },
}
