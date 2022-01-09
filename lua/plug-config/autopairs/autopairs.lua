local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({
  disable_filetype = { "TelescopePrompt"},
    map_cr = true, --  map <CR> on insert mode  
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true -- automatically select the first item
})
