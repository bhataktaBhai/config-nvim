local ls = require('luasnip')
local t = ls.text_node

local tex = require('LuaSnip.tex.util')

local autosnippets = {
   tex.ms(',=', t('\\le')),
   tex.ms('.=', t('\\ge')),
   tex.ms('/=', t('\\ne')),
   tex.ms('+-', t('\\pm')),
   tex.ms('xx', t('\\times')),
   tex.ms('..', t('\\cdot')),
   tex.ms('\\cdot.', t('\\dots')),
   tex.ts('...', t('\\dots')),
   tex.ms('.,', t('..')),
}

return {}, autosnippets
