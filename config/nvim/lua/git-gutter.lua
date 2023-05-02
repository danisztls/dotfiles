vim.cmd('highlight GitGutterAdd    guifg=#009900 ctermfg=2')
vim.cmd('highlight GitGutterChange guifg=#bbbb00 ctermfg=3')
vim.cmd('highlight GitGutterDelete guifg=#ff2222 ctermfg=1')

vim.api.nvim_set_keymap('n', '<leader>hs', '<Plug>(GitGutterStageHunk)', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>hu', '<Plug>(GitGutterUndoHunk)', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>hp', '<Plug>(GitGutterPreviewHunk)', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>hl', ':GitGutterLineHighlineToggle<CR>', {noremap = true})
