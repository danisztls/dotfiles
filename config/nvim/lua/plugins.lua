-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Manage itself 
  use 'wbthomason/packer.nvim'

  -- Browsing
  use {'junegunn/fzf', run = 'fzf#install()'}
  use 'junegunn/fzf.vim'
  use 'tpope/vim-vinegar'

  -- Visual
  use 'ryanoasis/vim-devicons'
  use 'vim-airline/vim-airline'
  use 'Yggdroot/indentLine'
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
  use {'dracula/vim', as = 'dracula'}

  -- Code
  use 'dense-analysis/ale'
  use 'godlygeek/tabular'
  use 'cespare/vim-toml'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'
  use 'airblade/vim-gitgutter'

  -- Markdown
  use {'plasticboy/vim-markdown', ft = 'markdown'}
  -- use {'mzlogin/vim-markdown-toc', ft = 'markdown'}

  -- Snippets
  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'

  -- Misc
  -- use 'tpope/vim-abolish'
end)
