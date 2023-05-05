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

  -- UI 
  -- TODO: Experiment with darken/brighten functions
  -- https://github.com/olimorris/onedarkpro.nvim
  --
  -- TODO: Experiment with doom-one colors
  -- https://github.com/romgrk/doom-one.vim/blob/master/colors/doom-one.vim
  --
  use {"olimorris/onedarkpro.nvim", config = get_setup("onedarkpro")}

  use {
    "nvim-lualine/lualine.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = get_setup("lualine")
  }
  use {"lukas-reineke/indent-blankline.nvim", config = get_setup("indent")}
  use "dstein64/nvim-scrollview"
  use {"rrethy/vim-hexokinase", run = "make hexokinase", config = get_setup("hexokinase")}
  use {"edluffy/hologram.nvim", config = get_setup("hologram")}

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
  -- use "aca/emmet-ls"

  -- Autocomplete (CMP)
  -- use {
  --   "hrsh7th/nvim-cmp",
  --   after = "nvim-lspconfig",
  --   requires = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-vsnip",
  --     "hrsh7th/vim-vsnip"
  --   },
  --   config = get_setup("lsp-cmp")
  -- }

  -- Autocomplete (COQ)
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      "neovim/nvim-lspconfig",
      {"ms-jpq/coq.artifacts", branch = "artifacts"},
      {"ms-jpq/coq.thirdparty", branch = "3p"}
    }
  }

  use {
    "neovim/nvim-lspconfig",
    config = get_setup("lsp")
  }

  use {
    "dense-analysis/ale",
    config = get_setup("ale")
  }

  use {
    "SmiteshP/nvim-navbuddy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      {"numToStr/Comment.nvim", opt = true},
      {"nvim-telescope/telescope.nvim", opt = true}
    }
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
  use {"github/copilot.vim", config = get_setup("copilot")}

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
end)
