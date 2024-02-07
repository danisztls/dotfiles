local km = vim.keymap

-- alternative <esc> in insert mode
km.set("i", "jk", "<esc>", { noremap = true })

-- folds
km.set("n", "<space>", "za", { noremap = true })

-- clipboard
km.set("v", "<C-c>", '"*y:let @+=@*<CR>', { noremap = true })
km.set("v", "<C-x>", '"*x:let @+=@*<CR>', { noremap = true })
km.set("n", "<C-v>", '"+P', { noremap = true })

-- spell-check
km.set("n", "<leader>en", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
km.set("n", "<leader>pt", ":setlocal spell! spelllang=pt_br<CR>", { noremap = true })

-- show hidden chars
km.set("n", "<leader>i", ":setlocal list!<CR>", { noremap = true })

-- allow the . to execute once for each line of a visual selection
km.set("v", ".", ":normal .<CR>", { noremap = true })

-- disable arrow keys
-- km.set('i', '<Up>', '<nop>', { noremap = true })
-- km.set('i', '<Down>', '<nop>', { noremap = true })
-- km.set('i', '<Left>', '<nop>', { noremap = true })
-- km.set('i', '<Right>', '<nop>', { noremap = true })

-- whichkey
km.set("n", "<leader>w", ":WhichKey<CR>", { noremap = true })

-- enclosing helpers
-- word on cursor
km.set("n", '<leader>"', 'ciw"<C-r>""<ESC>', { noremap = true })
km.set("n", "<leader>'", "ciw'<C-r>\"'<ESC>", { noremap = true })
km.set("n", "<leader>(", 'ciw(<C-r>")<ESC>', { noremap = true })
km.set("n", "<leader>[", 'ciw[<C-r>"]<ESC>', { noremap = true })
km.set("n", "<leader>{", 'ciw{<C-r>"}<ESC>', { noremap = true })

-- cursor to EOL
km.set("n", '<leader>e"', 'c$"<C-r>""<ESC>', { noremap = true })
km.set("n", "<leader>e'", "c$'<C-r>\"'<ESC>", { noremap = true })
km.set("n", "<leader>e(", 'c$(<C-r>")<ESC>', { noremap = true })
km.set("n", "<leader>e[", "c$(<C-r>])<ESC>", { noremap = true })
km.set("n", "<leader>e{", 'c$(<C-r>"}<ESC>', { noremap = true })

-- splits
km.set("n", "<C-h>", "<C-w>h", { noremap = true })
km.set("n", "<C-j>", "<C-w>j", { noremap = true })
km.set("n", "<C-k>", "<C-w>k", { noremap = true })
km.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- toggle line number
-- km.set('n', '<leader>n', ':setlocal number! relativenumber!<CR>', { noremap = true })

-- ignores capital-typos when you want to write/quit
vim.cmd "command! WQ wq"
vim.cmd "command! Wq wq"
vim.cmd "command! W w"
vim.cmd "command! Q q"
