local lsp = require "lspconfig"

-- COQ
vim.g.coq_settings = {
  ["auto_start"] = true
}

local coq = require "coq"

require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" },
  { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "figlet", short_name = "BIG" }
}

-- Navic + Navbuddy
-- local navic = require("nvim-navic")
-- local navbuddy = require("nvim-navbuddy")
-- TODO: Set up Navic in statusline or winbar
--
-- local on_attach = function(client, bufnr)
--     if client.server_capabilities.documentSymbolProvider then
--         navic.attach(client, bufnr)
--         navbuddy.attach(client, bufnr)
--     end
-- end

-- vim.keymap.set("n", "<leader>n", ":Navbuddy<CR>", { noremap = true })

-- LSP
local lsp_config = {
  -- on_attach = on_attach,
  coq.lsp_ensure_capabilities()
}

lsp.eslint.setup(lsp_config)
lsp.cssls.setup(lsp_config)
lsp.html.setup(lsp_config)
lsp.pylyzer.setup(lsp_config)
lsp.lua_ls.setup(lsp_config)
-- lsp.emmet_ls.setup(lsp_config)
