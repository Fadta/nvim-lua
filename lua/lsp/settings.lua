local nvim_lsp = require'lspconfig'
local lsp_status = require'lsp-status'
local lsp_installer = require'nvim-lsp-installer'
local lsp_installer_servers = require 'nvim-lsp-installer.servers'
local remaps = require'lsp/remaps'
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, 'cmp_nvim_lsp')

-- Make buffer have this settings when LSP is attached to buffer
local function on_attach(client, bufnr)
    remaps.set_default(client, bufnr)
    lsp_status.on_attach(client, bufnr)

    -- adds beatiful icon to completion
    require'lspkind'.init()

    -- add signature autocompletion while typing
    require'lsp_signature'.on_attach({
        floating_window = false,
        timer_interval = 500
    })
end

-- Available LSP servers if want to edit add to this list
-- with their configs
local servers = {
    efm = require('lsp/servers/efm')(),
    tsserver = require('lsp/servers/tsserver')(on_attach),
    pyright = {},
    pylsp = {},
    emmet_ls = require('lsp/servers/emmet_ls')(on_attach),
    sumneko_lua = {},
    cssls = require('lsp/servers/cssls')(on_attach),
    clangd = {},
}

-- extensibility for autocomplete
local capabilities = {};

capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

if presentCmpNvimLsp then
    capabilities = vim.tbl_extend('keep', capabilities,
                                  cmpNvimLsp.update_capabilities(
                                      vim.lsp.protocol
                                          .make_client_capabilities()))
end

-- universal lsp_config
local default_lsp_config = {on_attach = on_attach, capabilities}

-- do setup for all specified servers
for serverName, config in pairs(servers) do
    local serverAvailable, server = lsp_installer_servers.get_server(serverName)
    if serverAvailable then
        server:on_ready(function()
            local opts = vim.tbl_deep_extend('force', default_lsp_config, config)
            -- Temporal fix for LSP diagnostics working only on buffer open
            -- look for differences at setup vs setup_lsp
            server:setup_lsp(opts)
        end)

        if not server:is_installed() then
            print('installing ' .. serverName)
            server:install()
        end
    end

    -- if serverName is not in lspconfig then error
    if nvim_lsp[serverName] == nil then
      dump(serverName)
    end

    -- Black magic ^-^
    vim.cmd [[ do User LspAttachBuffers ]]
end
