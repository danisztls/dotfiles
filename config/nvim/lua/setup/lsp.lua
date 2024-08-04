local lsp = require "lspconfig"

local lsp_config = {
  -- on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

lsp.lua_ls.setup(lsp_config)
-- lsp.eslint.setup(lsp_config)
lsp.cssls.setup(lsp_config)
lsp.html.setup(lsp_config)
lsp.pylsp.setup(lsp_config)
lsp.marksman.setup(lsp_config)

-- pylyzer sucks (may-23)
-- lsp.pylyzer.setup({
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   python = {
--     checkOnType = false,
--     diagnostics = false,
--     inlayHints = false,
--     smartCompletion = true
--   }
-- })
