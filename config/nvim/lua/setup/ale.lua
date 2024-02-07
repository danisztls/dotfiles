vim.g.ale_lint_on_enter = 1
-- vim.g.ale_lint_on_text_changed = 'never'
-- vim.g.ale_lint_on_insert_leave = 0

-- linters & fixers
vim.g.ale_linters = {
  html = { "prettier" },
  javascript = { "prettier", "eslint" },
}

vim.g.ale_fixers = { "prettier", "eslint" }

vim.g.ale_pattern_options = {
  ["\\.min.js$"] = { ale_enabled = 0 },
  ["\\.md$"] = { ale_enabled = 0 },
}

-- binds
vim.api.nvim_set_keymap("n", "<leader>l", ":ALEToggleBuffer<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<Plug>(ale_previous_wrap)", { silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<Plug>(ale_next_wrap)", { silent = true })

-- highlight
vim.cmd "highlight ALEWarning ctermbg=yellow"
vim.cmd "highlight ALEError ctermbg=red"
