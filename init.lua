require('settings')
require('mappings')

require('lazy_bootstrap').install()
require('lazy').setup('plugins', {
   performance = {
      rtp = {
         disabled_plugins = {
            'gzip',
            'matchparen',
            'spec',
            'tarPlugin',
            'tohtml',
            'tutor',
            'zipPlugin',
         },
      },
   },
})
