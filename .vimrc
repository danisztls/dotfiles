call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
call plug#end()

" basics
"set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8

" line number
set number relativenumber
nmap <leader>h :setlocal number! relativenumber!<CR>

" autocompletion
set wildmode=longest,list,full

" fix splits
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

" disable automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" spell-check
nmap <leader>en :setlocal spell! spelllang=en_us<CR>
nmap <leader>pt :setlocal spell! spelllang=pt_br<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" markdown-preview
"let g:mkdp_refresh_slow = 1
let g:mkdp_browser = "electron"
nmap <leader>t <Plug>MarkdownPreviewToggle

" fzf
nmap <leader>f :Files

"vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

"vim-markdown-toc
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_list_item_char = '-'

