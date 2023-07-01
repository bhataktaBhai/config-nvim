local line_begin = require('luasnip.extras.conditions.expand').line_begin

return {
   require('luasnip').snippet(
      {
         trig = 'hi',
         dscr = 'An autotriggering snippet that expands "hi" into "Hello, world!"',
         priority = 100,
         snippetType = 'autosnippet',
      },
      { require('luasnip').text_node('Hello, world!') }
   ),
   s(
      'bye',
      { t('Goodbye, world!') }
   ),
}
