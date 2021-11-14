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

-- Enable folding with spacebar
nnoremap('<space>', 'za')

-- Open files with Ctrl + p
nnoremap('<C-p>', ':Files<CR>')

-- Open vimrc in vertical split
nnoremap('<leader>ev', ':vsplit $MYVIMRC<CR>')

-- Update changes in buffer
nnoremap('<leader>sv', ':source $MYVMRC')

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
nnoremap('<C-q', ':q<CR>')

-- Easier buffer navigation
nnoremap('<TAB>', ':bn<CR>') -- Next buffer
nnoremap('<S-TAB>', ':bp<CR>') -- Previous buffer
nnoremap('<leader><TAB>', ':bd<CR>') -- Close buffer

-- Better tabbing
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- Quick escapes
inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')
nnoremap('<C-c>', '<Esc>')

-- Open NERDTree
nnoremap('<leader>n', ':NERDTreeToggle<CR>')

-- All this shit for nnoremap <TAB> pumvisible() ? "\C-n" : "\<Tab>"
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
--HERE ENDS THIS BULLSHIT


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
