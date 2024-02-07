require "options"
require "keymaps"
require "plugins"

-- FUNCTIONS
-- Convert rows of space separated values to a tuple
function ToTuple()
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"

  -- add single quotes at the start and end of each line
  vim.cmd('silent execute "' .. start_line .. "," .. end_line .. "s/^/'/\"")
  vim.cmd('silent execute "' .. start_line .. "," .. end_line .. "s/$/',/\"")

  -- join all lines into a single line
  vim.cmd('silent execute "' .. start_line .. "," .. end_line .. 'join"')

  -- add parentheses at the start and end of the line
  vim.cmd "normal I("
  vim.cmd "normal $xa)"
end

-- Wrap selection in a code fence
function ToCodeFence()
  vim.cmd "normal x^I```"
  vim.cmd "normal $a```"
  vim.cmd "normal jp"
end
vim.api.nvim_set_keymap("n", "<leader>s", ":lua ToCodeFence()<CR>", { noremap = true, silent = true })

function CleanTrailingWhitespaces()
  vim.cmd "%s/\\s\\+$//e"
end
vim.api.nvim_set_keymap("n", "<leader>x", ":lua CleanTrailingWhitespaces()<CR>", { noremap = true, silent = true })

function DisableSyntaxTreesitter()
  if vim.fn.exists ":TSBufDisable" then
    vim.cmd "TSBufDisable autotag"
    vim.cmd "TSBufDisable highlight"
    vim.cmd "TSBufDisable incremental_selection"
    vim.cmd "TSBufDisable indent"
    vim.cmd "TSBufDisable playground"
    vim.cmd "TSBufDisable query_linter"
    vim.cmd "TSBufDisable rainbow"
    vim.cmd "TSBufDisable refactor.highlight_definitions"
    vim.cmd "TSBufDisable refactor.navigation"
    vim.cmd "TSBufDisable refactor.smart_rename"
    vim.cmd "TSBufDisable refactor.highlight_current_scope"
    vim.cmd "TSBufDisable textobjects.swap"
    -- vim.cmd('TSBufDisable textobjects.move')
    vim.cmd "TSBufDisable textobjects.lsp_interop"
    vim.cmd "TSBufDisable textobjects.select"
  end

  vim.opt.foldmethod = "manual"
end

-- AUTOCOMMANDS
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tsv" },
  command = "set filetype=tsv",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.json" },
  command = "set conceallevel=0",
})

-- NOTE: it doesn't work with BufReadPre event
vim.api.nvim_create_autocmd({ "BufRead", "FileReadPre" }, {
  pattern = { "*" },
  callback = function()
    -- if file is larger than 512 KiB
    if vim.fn.getfsize(vim.fn.expand "%:p") > 512 * 1024 then
      DisableSyntaxTreesitter()
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*work/wmf/*" },
  command = "set noexpandtab tabstop=4 shiftwidth=4",
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = { "*work/wmf/**/*.{html,js,css,scss,php}" },
--   command = "set noet ts=4 sw=4",
-- })
