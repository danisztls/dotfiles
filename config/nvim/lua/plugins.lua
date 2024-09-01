local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

  -- UI 
  -- TODO: Experiment with darken/brighten functions
  use { "olimorris/onedarkpro.nvim", config = get_setup "ui/onedarkpro" }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = get_setup "ui/lualine",
  }

  use { "brenoprata10/nvim-highlight-colors", config = get_setup "ui/highlight-colors" }
  use { "lukas-reineke/indent-blankline.nvim", config = get_setup "ui/indent-blankline" }
  use "dstein64/nvim-scrollview"

  -- Navigation
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = get_setup "navigate/telescope",
  }
  use "tpope/vim-vinegar"
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = get_setup "navigate/hop",
  }

  -- Git
  use { "tpope/vim-fugitive", config = get_setup "git/fugitive" }
  use "tpope/vim-rhubarb"
  use "junegunn/gv.vim"
  use { "rhysd/git-messenger.vim", config = get_setup "git/messenger" }
  use { "lewis6991/gitsigns.nvim", config = get_setup "git/signs" }

  -- Formatters
  use { "numToStr/Comment.nvim", config = get_setup "format/comment" }
  use "tpope/vim-surround"
  use { "godlygeek/tabular", config = get_setup "format/tabular" }

  -- Treesitter
  -- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_setup "treesitter" }
  -- use {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   after = "nvim-treesitter",
  -- }
  --
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

  -- Code 
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
    config = get_setup "code/cmp",
  }

  use {
    "neovim/nvim-lspconfig",
    after = "nvim-cmp",
    config = get_setup "code/lsp",
  }

  use {
    "dense-analysis/ale",
    config = get_setup "code/ale",
  }

  use {
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = get_setup "code/barbecue",
  }

  use { "plasticboy/vim-markdown", ft = "markdown" }

  -- AI 
  use {
    "robitx/gp.nvim",
    config = get_setup "ai/gp",
  }

  -- use {
  --   "jackMort/ChatGPT.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = get_setup "ai/chatgpt",
  -- }

  -- use {"zbirenbaum/copilot.lua", config = get_setup("copilot")}

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   requires = {"zbirenbaum/copilot.lua" },
  --   after = {"copilot.lua"},
  --   config = get_setup("ai/copilot")
  -- }

  -- NOTE: Should be last to load
  -- TODO: Use wk.register() to register maps
  use {
    "folke/which-key.nvim",
    config = get_setup "ui/which-key",
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
