require("plugins")
-- vim.cmd('source ~/.config/nvim/opts.vim')

-- base
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- env
vim.opt.encoding = 'utf-8'
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<leader>n', ':setlocal number! relativenumber!<CR>', { noremap = true })

-- n spaces tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- autocompletion
vim.opt.wildmode = { 'longest', 'list', 'full' }

-- fix splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- enable mouse events
vim.opt.mouse = 'a'

-- alternative <esc> in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })

-- disable arrow keys
-- vim.api.nvim_set_keymap('i', '<Up>', '<nop>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<Down>', '<nop>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<Left>', '<nop>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<Right>', '<nop>', { noremap = true })

-- enclosing helpers
-- word on cursor
vim.api.nvim_set_keymap('n', '<leader>"', 'ciw"<C-r>""<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>\'', 'ciw\'<C-r>"\'<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>(', 'ciw(<C-r>")<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>[', 'ciw[<C-r>"]<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>{', 'ciw{<C-r>"}<ESC>', { noremap = true })

-- cursor to EOL
vim.api.nvim_set_keymap('n', '<leader>e"', 'c$"<C-r>""<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e\'', 'c$\'<C-r>"\'<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e(', 'c$(<C-r>")<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e[', 'c$(<C-r>])<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e{', 'c$(<C-r>"}<ESC>', { noremap = true })

-- tabularize
vim.cmd('cnoreabbrev Tab Tabularize/')

-- folds
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true })

-- ignores capital-typos when you want to write/quit
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')
vim.cmd('command! W w')
vim.cmd('command! Q q')

-- clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"*y:let @+=@*<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-x>', '"*x:let @+=@*<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true })

-- spell-check
vim.api.nvim_set_keymap('n', '<leader>en', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pt', ':setlocal spell! spelllang=pt_br<CR>', { noremap = true })

-- show hidden chars
vim.api.nvim_set_keymap('n', '<leader>i', ':setlocal list!<CR>', { noremap = true })
-- show space as .
vim.opt.listchars:append('space:·')

-- allow the . to execute once for each line of a visual selection
vim.api.nvim_set_keymap('v', '.', ':normal .<CR>', { noremap = true })

-- vim auto-update
vim.opt.updatetime = 250

-- disable automatic commenting on new line
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
vim.opt_local.formatoptions:remove({'c', 'r', 'o'})

-- soft linewrap
vim.opt.wrap = true
vim.opt.linebreak = true

-- Colors
-- https://github.com/RRethy/vim-hexokinase/issues/10 
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- set Vim-specific sequences for RGB colors
-- FIXME: nvim doesn't suppor t_xx. do I need this?
-- vim.opt.t_8f = '<Esc>[38;2;%lu;%lu;%lum'
-- vim.opt.t_8b = '<Esc>[48;2;%lu;%lu;%lum'

-- Plugins Config
require("fzf")
require("ale")
require("airline")
require("git-fugitive")
require("git-gutter")
require("git-messenger")
require("hexokinase")
-- require("ultisnips")
-- require("codi")

-- WEB
-- autocmd FileType html css

-- FUNCTIONS
-- convert rows of numbers or text (as if pasted from excel column) to a tuple
function _G.ToTuple()
   vim.cmd('silent execute "'..vim.fn.line("'<")..','..vim.fn.line("'>")..'s/^/\'/"')
   vim.cmd('silent execute "'..vim.fn.line("'<")..','..vim.fn.line("'>")..'s/$/\',/"')
   vim.cmd('silent execute "'..vim.fn.line("'<")..','..vim.fn.line("'>")..'join"')
   vim.cmd('normal I(')
   vim.cmd('normal $xa)')
end

-- convert a simple code span to a nice shell code fence
function _G.ToShell()
   vim.cmd('silent execute "s/^`/```sh\\r/"')
   vim.cmd('silent execute "s/`$/\\r```/"')
end

-- remove trailing whitespaces
function _G.CleanUp(...)
   local first, last
   if arg.n == 0 then
     first, last = vim.fn.line("'<"), vim.fn.line("'>")
   else
     first, last = arg[1], arg[2]
   end
   for lnum=tonumber(first),tonumber(last) do
       local line = vim.fn.getline(lnum)
       line = line:gsub('%s+$', '')
       vim.fn.setline(lnum, line)
   end
end
vim.api.nvim_set_keymap('n', '<leader>x', ':set opfunc=CleanUp<CR>g@', {noremap = true})

-- Autocommand
-- prevent including autocommands more than once
local autocommands_loaded = false
if not autocommands_loaded then
   autocommands_loaded = true
   vim.cmd('au BufNewFile,BufRead *.tsv set filetype=tsv') -- tab-separated values
   vim.cmd('au BufNewFile,BufRead *.json set conceallevel=0')

   vim.cmd([[
       augroup wikimedia
       au!
       au BufNewFile,BufRead *wikimedia/* set noexpandtab tabstop=4 shiftwidth=4
       " au BufNewFile,BufRead *wikimedia/**/*.{html,js,css,scss,php} set noet ts=4 sw=4
       augroup END
   ]])
end

