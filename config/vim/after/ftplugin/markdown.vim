" vim-markdown
let g:vim_markdown_math = 0 " if enabled $ signs will bug syntax
let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_folding_disabled = 1
setlocal foldlevel=6
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
"setlocal conceallevel=0

" markdown-toc
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_list_indent_text = '  '
"let g:vmt_list_item_char = '*'
"let g:vmt_cycle_list_item_markers = 1
nnoremap <leader>t :GenTocGFM<CR>

" bindings
nnoremap <leader>* viw<esc>a*<esc>bi*<esc>le
nnoremap <leader>_ viw<esc>a_<esc>bi_<esc>le
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>le
nnoremap <leader>code o```<esc>kO```sh<esc>$
