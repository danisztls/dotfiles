local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup(function(use)
  -- Base 
  use "wbthomason/packer.nvim"
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- Navigation 
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = get_setup("telescope")
  }
  use "tpope/vim-vinegar"
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = get_setup("hop")
  }

  -- Colors 
  -- TODO: Setup dynamic colorscheme switching based on time of daylight

  -- TODO: Experiment with darken/brighten functions
  use {"olimorris/onedarkpro.nvim", config = get_setup("colors-onedarkpro")}

  -- use {"sainnhe/gruvbox-material", config = get_setup("colors-gruvbox")}

  -- UI
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = get_setup("lualine")
  }

  use {"brenoprata10/nvim-highlight-colors", config = get_setup("colors-highlight")}
  use {"lukas-reineke/indent-blankline.nvim", config = get_setup("indent")}
  use "dstein64/nvim-scrollview"

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_setup("treesitter")}
  use({
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
  })
  -- use({
  --   -- TODO: Configure
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   after = "nvim-treesitter",
  -- })
  -- use({
  --   -- TODO: Configure
  --   "nvim-treesitter/nvim-treesitter-refactor",
  --   after = "nvim-treesitter",
  -- })

  -- Code Formatters
  use {'numToStr/Comment.nvim', config = get_setup("comment")}
  use "tpope/vim-surround"
  use {"godlygeek/tabular", config = get_setup("tabular")}

  -- Git
  use {"tpope/vim-fugitive", config = get_setup("git-fugitive")}
  use "tpope/vim-rhubarb"
  use "junegunn/gv.vim"
  use {"rhysd/git-messenger.vim", config = get_setup("git-messenger")}
  use {"lewis6991/gitsigns.nvim", config = get_setup("git-signs")}

  -- LSP
  -- Autocomplete (CMP)
  -- check: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-emoji",
      "chrisgrieser/cmp-nerdfont",
      "hrsh7th/cmp-latex-symbols",
      "hrsh7th/cmp-calc",
      "ray-x/cmp-treesitter",
      "andersevenrud/cmp-tmux",
    },
    config = get_setup("cmp")
  }

  use {
    "neovim/nvim-lspconfig",
    after = "nvim-cmp",
    config = get_setup("lsp")
  }

  use {
    "dense-analysis/ale",
    config = get_setup("ale")
  }

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = get_setup("barbecue")
  })

  -- Copilot
  -- use {"zbirenbaum/copilot.lua", config = get_setup("copilot")}

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   requires = {"zbirenbaum/copilot.lua" },
  --   after = {"copilot.lua"},
  --   config = get_setup("copilot")
  -- }

  -- ChatGPT
  -- use({
  -- "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

  use({
    "dpayne/CodeGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("codegpt.config")
    end
  })

  -- Markdown
  use {"plasticboy/vim-markdown", ft = "markdown"}

  -- TODO: Use wk.register() to register maps
  use {
    "folke/which-key.nvim",
    config = get_setup("which-key")
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
