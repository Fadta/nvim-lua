-- Split navigations
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')

-- Use ALT + hjkl to resize windows
nnoremap('<M-j>', ':resize -2<CR>')
nnoremap('<M-k>', ':resize +2<CR>')
nnoremap('<M-h>', ':vertical resize -2<CR>')
nnoremap('<M-l>', ':vertical resize +2<CR>')

-- Open files with Ctrl + o
nnoremap('<C-o>', ':Telescope find_files<CR>')

-- Open vimrc in vertical split
nnoremap('<leader>ev', ':vsplit $MYVIMRC<CR>')

-- Clear highlights
nnoremap('//', ':noh<Return>')

-- Moves current line down or up
nnoremap('<leader>-', 'ddp')
nnoremap('<leader>_', 'ddkP')

-- Enable or disable line wrapping in current buffer
nnoremap('<localleader>w', ':set wrap!<CR>', {noremap = true, silent = true}, 0)

-- Fast write
nnoremap('<C-s>', ':w<CR>')

-- Fast quit
nnoremap('<C-q>', ':q<CR>')

-- Easier buffer navigation
nnoremap('<TAB>', ':bn<CR>') -- Next buffer
nnoremap('<S-TAB>', ':bp<CR>') -- Previous buffer
nnoremap('<leader>q', ':bd<CR>') -- Close buffer

-- Better tabbing
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- Quick escapes
inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')
nnoremap('<C-c>', '<Esc>')

-- Toggle NvimTree
nnoremap('<leader>ft', ':NvimTreeToggle<CR>')

-- TERMINAL

-- Fast terminal
nnoremap('<leader><leader>', ':terminal<CR>a')

-- Esc
tnoremap('<Esc>', '<C-\\><C-n>')

-- Navigate between splits
tnoremap('<C-J>', '<C-\\><C-N><C-w>j')
tnoremap('<C-K>', '<C-\\><C-N><C-w>k')
tnoremap('<C-L>', '<C-\\><C-N><C-w>l')
tnoremap('<C-H>', '<C-\\><C-N><C-w>h')
