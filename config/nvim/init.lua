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

-- AUTOCOMMANDS
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tsv" },
  command = "set filetype=tsv",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.json" },
  command = "set conceallevel=0",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*work/wmf/*" },
  command = "set noexpandtab tabstop=4 shiftwidth=4",
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = { "*work/wmf/**/*.{html,js,css,scss,php}" },
--   command = "set noet ts=4 sw=4",
-- })
