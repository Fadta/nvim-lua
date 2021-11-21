local M = {}
    -- defaults

function M.set_default(client, bufnr)
  local opts = { noremap=true, silent=true }
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local function buf_set_keymap(...)
    local p = {...}
    vim.api.nvim_buf_set_keymap(bufnr, p[1], p[2], p[3], opts)
  end

  -- Mappings.
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<leader>h', '<cmd>Lspsaga signature_help<CR>', opts)

  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<cmd>Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
end

function M.set_typescript(client, bufnr)
  local function buf_set_keymap(...) bufnoremap(bufnr, ...) end
  local ts_utils = require("nvim-lsp-ts-utils")

  -- defaults
  ts_utils.setup {
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,
    eslint_enable_code_actions = true,
    enable_formatting = true,
    formatter = "prettier",
  }

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)

  nnoremap("<leader>tso", ":TSLspOrganize<CR>")
  nnoremap("<leader>tsc", ":TSLspFixCurrent<CR>")
  -- buf_set_keymap("n", "gr", ":TSLspRenameFile<CR>", 'lsp', 'lsp_', '')
  nnoremap("<leader>tsi", ":TSLspImportAll<CR>")
end
return M
