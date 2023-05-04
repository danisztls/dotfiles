-- returns the require for use in `config` parameter of lazy's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require('packer').startup(function(use)
  -- Manage itself 
  use 'wbthomason/packer.nvim'

  -- Browsing
  use {'junegunn/fzf', run = 'fzf#install()'}
  use {'junegunn/fzf.vim', config = get_setup("fzf")}
  use 'tpope/vim-vinegar'

  -- Visual
  use 'ryanoasis/vim-devicons'
  use {'vim-airline/vim-airline', config = get_setup("airline")}
  use {"lukas-reineke/indent-blankline.nvim", config = get_setup("indent")}
  use {'rrethy/vim-hexokinase', run = 'make hexokinase', config = get_setup("hexokinase")}
  use {'dracula/vim', as = 'dracula'}

  -- Code
  use {'dense-analysis/ale', config = get_setup("ale")}
  use {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = get_setup("treesitter")}
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- Git
  use {'tpope/vim-fugitive', config = get_setup("git-fugitive")}
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use {'rhysd/git-messenger.vim', config = get_setup("git-messenger")}
  use {'airblade/vim-gitgutter', config = get_setup("git-gutter")}

  -- Markdown
  use {'plasticboy/vim-markdown', ft = 'markdown'}
  -- use {'mzlogin/vim-markdown-toc', ft = 'markdown'}

  -- Misc
  -- use 'tpope/vim-abolish'
  use {'godlygeek/tabular', config = get_setup("tabular")}
  use 'cespare/vim-toml'
end)
