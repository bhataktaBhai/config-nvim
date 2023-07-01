local tex = {}

tex.in_mathzone = function()
   return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_comment = function()
   return vim.fn['vimtex#syntax#in_comment']() == 1
end

tex.in_env = function(name)
   local location = vim.fn['vimtex#syntax#in_env'](name)
   return location[1] > 0 and location[2] > 0
end

tex.in_align = function()
   return tex.in_env('align')
end
tex.in_tikz = function()
   return tex.in_env('tikzpicture')
end

