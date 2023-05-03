-- set HL colors
vim.cmd('highlight ALEWarning ctermbg=yellow')
vim.cmd('highlight ALEError ctermbg=red')
-- binds for moving
vim.api.nvim_set_keymap('n', '<C-b>', '<Plug>(ale_previous_wrap)', {silent = true})
vim.api.nvim_set_keymap('n', '<C-e>', '<Plug>(ale_next_wrap)', {silent = true})
-- toggle
vim.api.nvim_set_keymap('n', '<leader>l', ':ALEToggleBuffer<CR>', {noremap = true})
-- when to lint
-- vim.g.ale_lint_on_text_changed = 'never'
-- vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 1 -- when opening a file
-- set linters
vim.g.ale_linters = {
   html = {'prettier'},
   javascript = {'prettier', 'eslint'}
}
-- disable linters
vim.g.ale_pattern_options = {
   ['\\.min.js$'] = {ale_enabled = 0},
   ['\\.md$'] = {ale_enabled = 0}
}
-- set fixers (fix w/ :ALEFixer)
vim.g.ale_fixers = {'prettier', 'eslint'}
