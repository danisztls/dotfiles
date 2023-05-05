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
    requires = {"nvim-lua/plenary.nvim"},
    config = get_setup("telescope")
  }
  use "tpope/vim-vinegar"
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = get_setup("hop")
  }

  -- UI 
  -- use {"olimorris/onedarkpro.nvim", config = get_setup("onedarkpro")}
  use {"romgrk/doom-one.vim", config = get_setup("doom-one")}

  use {
    "nvim-lualine/lualine.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = get_setup("lualine")
  }
  use {"lukas-reineke/indent-blankline.nvim", config = get_setup("indent")}
  use "dstein64/nvim-scrollview"
  use {"rrethy/vim-hexokinase", run = "make hexokinase", config = get_setup("hexokinase")}
  use {"edluffy/hologram.nvim", config = get_setup("hologram")}

  -- Code Parsers
  use {"dense-analysis/ale", config = get_setup("ale")}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_setup("treesitter")}

  -- use {
  --   "SmiteshP/nvim-navic",
  --   requires = "neovim/nvim-lspconfig"
  -- }
  --
  -- use {
  --   "SmiteshP/nvim-navbuddy",
  --   requires = {
  --       "neovim/nvim-lspconfig",
  --       "SmiteshP/nvim-navic",
  --       "MunifTanjim/nui.nvim",
  --       {"numToStr/Comment.nvim", opt = true},
  --       {"nvim-telescope/telescope.nvim", opt = true}
  --   }
  -- }

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
  use {"neovim/nvim-lspconfig", config = get_setup("lsp")}

  -- Autocomplete (CMP)
  -- use "hrsh7th/cmp-vsnip"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-path"
  -- use "hrsh7th/cmp-cmdline"
  -- use "hrsh7th/vim-vsnip"
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use {"hrsh7th/nvim-cmp", config = get_setup("lsp-cmp")}

  -- Autocomplete (COQ)
  use {"ms-jpq/coq_nvim", branch = "coq"}
  use {"ms-jpq/coq.artifacts", branch = "artifacts"}
  use {"ms-jpq/coq.thirdparty", branch = "3p"}

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
