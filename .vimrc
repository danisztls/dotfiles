call plug#begin('.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
call plug#end()

" basics
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" autocompletion
set wildmode=longest,list,full

" fix splits
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" sell-check set to <leader>en and <leader>pt
map <leader>en :setlocal spell! spelllang=en_us<CR>
map <leader>pt :setlocal spell! spelllang=pt_br<CR>

" vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" markdown-preview
"let g:mkdp_refresh_slow = 1
let g:mkdp_browser = "electron"
map <leader>t <Plug>MarkdownPreviewToggle

" fzf
map <leader>f :Files
