local chatgpt = require "chatgpt"

-- defaults: https://github.com/jackMort/ChatGPT.nvim/blob/main/lua/chatgpt/config.lua

chatgpt.setup {
  actions_paths = { "~/.config/nvim/lua/setup/chatgpt/actions.json" },
  openai_params = {
    model = "gpt-4o",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = nil,
    temperature = 0.1,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "gpt-4o",
    frequency_penalty = 0,
    presence_penalty = 0,
    temperature = 0.1,
    top_p = 1,
    n = 1,
  },
}
