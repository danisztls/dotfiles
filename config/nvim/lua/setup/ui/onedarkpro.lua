require("onedarkpro").setup {
  options = {
    cursorline = false,
    -- transparency = true,
    terminal_colors = false,
    highlight_inactive_windows = false,
  },
}

local function set_day_theme()
  vim.cmd("colorscheme onelight")
end

local function set_night_theme()
  require("onedarkpro").setup {
    colors = {
      -- bg = "#282c34",
      -- black = "#282c34",
      -- fg = "#abb2bf",
      -- red = "#ef596f",
      -- orange = "#d19a66",
      -- yellow = "#e5c07b",
      -- green = "#89ca78",
      -- cyan = "#2bbac5",
      -- blue = "#61afef",
      -- purple = "#d55fde",
      -- white = "#abb2bf",
      -- gray = "#5c6370",
      -- highlight = "#e2be7d",
      -- comment = "#7f848e",
      -- none = "NONE"
      -- bg = "#282A36",
      fg = "#F8F8F2",
      selection = "#44475A",
      comment = "#6272A4",
      red = "#FF5555",
      orange = "#FFB86C",
      yellow = "#F1FA8C",
      green = "#50fa7b",
      purple = "#BD93F9",
      cyan = "#8BE9FD",
      pink = "#FF79C6",
      bright_red = "#FF6E6E",
      bright_green = "#69FF94",
      bright_yellow = "#FFFFA5",
      bright_blue = "#D6ACFF",
      bright_magenta = "#FF92DF",
      bright_cyan = "#A4FFFF",
      bright_white = "#FFFFFF",
      menu = "#21222C",
      visual = "#3E4452",
      gutter_fg = "#4B5263",
      nontext = "#3B4048",
      white = "#ABB2BF",
      black = "#191A21",
    },
  }
  vim.cmd("colorscheme onedark_vivid")
end

local function set_theme_based_on_time()
  local hour = tonumber(os.date("%H"))

  -- if hour >= 7 and hour < 19 then
  --   set_day_theme()
  -- else
  --   set_night_theme()
  -- end

  set_night_theme()
end

set_theme_based_on_time()
