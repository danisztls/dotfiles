vim.g.coq_settings = {
  ["auto_start"] = true
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.eslint.setup(coq.lsp_ensure_capabilities())
lsp.cssls.setup(coq.lsp_ensure_capabilities())
lsp.html.setup(coq.lsp_ensure_capabilities())
lsp.pylyzer.setup(coq.lsp_ensure_capabilities())
-- lsp.emmet_ls.setup(coq.lsp_ensure_capabilities())

require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" },
  { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "figlet", short_name = "BIG" }
}
