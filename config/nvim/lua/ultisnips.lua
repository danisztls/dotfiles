vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'
vim.api.nvim_set_keymap('n', '<leader>fs', ':Snippets<CR>', {noremap = true})
