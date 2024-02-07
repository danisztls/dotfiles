require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  ignore_install = { "t32" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = { "markdown" },
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
  },
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
