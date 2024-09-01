vim.g.ale_disable_lsp = 1
vim.g.ale_lint_on_enter = 1
-- vim.g.ale_lint_on_text_changed = 'never'
-- vim.g.ale_lint_on_insert_leave = 0

-- vim.g.ale_linters = {
-- 	markdown = { "prettier" },
-- 	html = { "prettier" },
-- 	css = { "prettier", "stylelint" },
-- 	scss = { "prettier", "stylelint" },
-- 	javascript = { "prettier", "eslint" },
-- 	yaml = { "prettier" },
-- 	python = { "black" },
-- 	lua = { "stylua" },
-- }

-- vim.g.ale_fix_on_save = 1 -- not working
-- vim.g.ale_fixers = {
--   ["*"] = { "remove_trailing_lines", "trim_whitespace"},
-- 	markdown = { "prettier" },
-- 	html = { "prettier" },
-- 	css = { "prettier", "stylelint" },
-- 	scss = { "prettier", "stylelint" },
-- 	javascript = { "prettier", "eslint" },
-- 	yaml = { "prettier" },
-- 	python = { "black" },
-- 	lua = { "stylua" },
-- }

vim.g.ale_pattern_options = {
  ["\\.min.js$"] = { ale_enabled = 0 },
}

-- binds
vim.api.nvim_set_keymap("n", "<leader>l", ":ALEToggleBuffer<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<Plug>(ale_previous_wrap)", { silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<Plug>(ale_next_wrap)", { silent = true })

-- highlight
vim.cmd("highlight ALEWarning ctermbg=yellow")
vim.cmd("highlight ALEError ctermbg=red")
