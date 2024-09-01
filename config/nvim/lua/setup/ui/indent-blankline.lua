-- vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineChar guifg=#7C8193 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#4E72FA gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#4EFA80 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#FA4EC8 gui=nocombine]]

-- v2
-- require("indent_blankline").setup {
--   space_char_blankline = " ",
--   color_gui = "#7C8193",
--   -- char_list = {'¦'},
--   show_end_of_line = false,
--   show_current_context = true,
--   show_current_context_start = true,
--   show_trailing_blankline_indent = true,
-- }

-- v3
require("ibl").setup()
