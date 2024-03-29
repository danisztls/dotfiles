vim.api.nvim_set_keymap("n", "dg", ":diffget<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "dh", ":diffget LO<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "dl", ":diffget RE<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "]C", "/\\v^[<>=\\|]{4,7}($\\|\\s\\|\\r)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>fc", ":BCommits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fC", ":Commits<CR>", { noremap = true })
