require("options")
require("keymaps")
require("plugins")

-- vim.cmd('source ~/.config/nvim/legacy.vim')

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

