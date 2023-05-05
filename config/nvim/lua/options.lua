local opt = vim.opt
local opt_local = vim.opt_local

-- base
vim.cmd('filetype plugin indent on')

-- env
opt.encoding = 'utf-8'
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'

-- line number
opt.number = true
opt.relativenumber = true

-- n spaces tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- autocompletion
opt.wildmode = { 'longest', 'list', 'full' }

-- fix splits
opt.splitbelow = true
opt.splitright = true

-- enable mouse events
opt.mouse = 'a'

-- responsiveness
opt.updatetime = 100
opt.timeout = true
opt.timeoutlen = 300

-- disable automatic commenting on new line
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
opt_local.formatoptions:remove({'c', 'r', 'o'})

-- soft linewrap
opt.wrap = true
opt.linebreak = true

-- colors
opt.termguicolors = true
-- opt.background = 'dark'
