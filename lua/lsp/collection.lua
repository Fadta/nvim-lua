lsp_servers = {'pyright', 'tsserver', 'clangd', 'pylsp'}
conf = {}

for _, i in ipairs(lsp_servers) do
	if (package.loaded['lua/lsp/servers/' .. i]) then
		conf[i] = require('lua/lsp/servers/' .. i)
	else
		conf[i] = {}
	end
end

return {conf = conf, servers = lsp_servers}
