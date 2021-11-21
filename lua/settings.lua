local opt = vim.opt
local o = vim.o
local go = vim.go
local g = vim.g

-- settings
vim.cmd [[
	syntax on
	filetype plugin indent on
]]
g.mapleader = ','
g.localleader = '\\'
g.vimsyn_embed = 'lPr'

o.hidden = true -- Required to keep multiple buffers open
o.wrap = true -- Text is displayed in lines instead of a long one
o.encoding = 'utf-8' -- Displayed encoding
o.fileencoding = 'utf-8' -- Encoding written to files

o.ruler = true -- Show cursor position ALL TIME
o.cmdheight = 2
opt.iskeyword:append('-') -- Treats dashes as part of a word
o.mouse = 'a' -- Enable mouse 
o.splitbelow = true -- hsplits will be below

o.splitright = true -- vsplits will be right
go.t_Co = "256" -- Support 256 colors
o.conceallevel = 0 -- so that `` is visible in md files

o.tabstop = 2 -- Insert x spaces for a tab
o.shiftwidth = 2 -- Number of spaces inserted per indent
o.expandtab = true -- Replace tabs for spaces

o.smarttab = true -- Tab realizes 2 vs 4
o.smartindent = true
o.autoindent = true
o.showtabline = 2 -- Always show tabs
o.laststatus = 2 -- 2 = Always display status line

o.number = true 
o.relativenumber = true
o.cursorline = true -- highlights the line where the cursor is
o.background = 'dark'
o.showmode = false -- Don't display things like -- INSERT --

o.updatetime = 50 -- Faster completion
o.timeoutlen = 500 -- Timeoutlen default is 1000ms
opt.formatoptions:remove('cro') -- Stop new line continuation of comments
o.clipboard = 'unnamedplus' -- Copy/paste b/w VIM and everything else
o.backspace = 'indent,eol,start' -- backspace deletes over lines

o.foldmethod = 'indent' -- Fold over indents
o.foldlevel = 99
o.wildmenu = true -- Graphical auto complete menu
o.lazyredraw = true -- Redraws scene when needed
o.showmatch = true -- Highlights matching brackets

o.incsearch = true -- Search as characters are entered
o.hlsearch = true -- Highlights matching searches
o.scrolloff = 5 -- Display 5 lines above/below cursor
o.swapfile = false -- Don't create swap files
opt.shortmess:append('c') -- Don't give ins-completion hit-enter prompts

-- Using treesitter for folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- shows spaces
vim.o.list = true
vim.o.listchars= 'eol:¬,tab:>·,trail:~,extends:>,precedes:<'

-- disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme " .. colorscheme) -- Same as "colorscheme $colorscheme"
