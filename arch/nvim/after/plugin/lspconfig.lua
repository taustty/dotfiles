local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')
local servers = {"lua_ls", "tsserver", "jdtls", "ocamllsp", "clangd"}  -- SERVERS HERE
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end
lspconfig["haxe_language_server"].setup({
    cmd = {"node", vim.fn.stdpath('data').."/mason/packages/haxe-language-server/bin/server.js"},
    capabilities = capabilities
})
