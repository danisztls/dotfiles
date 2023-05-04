function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup(function(use)
  -- Manage itself 
  use "wbthomason/packer.nvim"

  -- Browsing
  use {
    "nvim-telescope/telescope.nvim", 
    requires = {"nvim-lua/plenary.nvim"},
    config = get_setup("telescope")
  }
  use "tpope/vim-vinegar"

  -- Visual
  use "nvim-tree/nvim-web-devicons"
  use {"dracula/vim", as = "dracula"}
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"nvim-tree/nvim-web-devicons", opt = true},
    config = get_setup("lualine")
  }
  use {"lukas-reineke/indent-blankline.nvim", config = get_setup("indent")}
  use "dstein64/nvim-scrollview"
  use {"rrethy/vim-hexokinase", run = "make hexokinase", config = get_setup("hexokinase")}
  use {"edluffy/hologram.nvim", config = get_setup("hologram")}

  -- Code
  use {"dense-analysis/ale", config = get_setup("ale")}
  use {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = get_setup("treesitter")}
  use "tpope/vim-surround"
  use "tpope/vim-commentary"

  -- Git
  use {"tpope/vim-fugitive", config = get_setup("git-fugitive")}
  use "tpope/vim-rhubarb"
  use "junegunn/gv.vim"
  use {"rhysd/git-messenger.vim", config = get_setup("git-messenger")}
  use {"lewis6991/gitsigns.nvim", config = get_setup("git-signs")}

  -- Markdown
  use {"plasticboy/vim-markdown", ft = "markdown"}
  -- use {"mzlogin/vim-markdown-toc", ft = "markdown"}

  -- Misc
  -- use "tpope/vim-abolish"
  use {"godlygeek/tabular", config = get_setup("tabular")}
  use "cespare/vim-toml"

  -- AI
  use {"github/copilot.vim", config = get_setup("copilot")}

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
end)
