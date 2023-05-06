local lsp = require "lspconfig"

local lsp_config = {
  -- on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

lsp.eslint.setup(lsp_config)
lsp.cssls.setup(lsp_config)
lsp.html.setup(lsp_config)
lsp.pylyzer.setup(lsp_config)
lsp.lua_ls.setup(lsp_config)
