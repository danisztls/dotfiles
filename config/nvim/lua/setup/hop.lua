require('hop').setup()
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader><leader>w', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set('', '<leader><leader>W', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set('', '<leader><leader>l', function()
  hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set('', '<leader><leader>L', function()
  hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set('', '<leader><leader>c', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})

vim.keymap.set('', '<leader><leader>C', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
