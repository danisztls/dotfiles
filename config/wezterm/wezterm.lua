local wezterm = require 'wezterm'

-- local hostname=wezterm.hostname()

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--   local numpanes = ''
--   if (#tab.panes > 1) then numpanes = '(' .. tostring(#tab.panes) .. ') ' end
--   return numpanes .. tab.active_pane.title
-- end)

-- format window title
-- wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
--   local numtabs = ''
--   if (#tabs > 1) then numtabs = '(' .. tostring(#tabs) .. ') ' end
--   return numtabs .. tab.active_pane.title
-- end)

return {
  audible_bell = "Disabled",
  automatically_reload_config = true,
  -- adjust_window_size_when_changing_font_size = false,
  -- allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
  -- bold_brightens_ansi_colors = false,
  -- canonicalize_pasted_newlines = "LineFeed",
  -- check_for_updates = false,
  -- color_scheme = "Themer",
  -- default_cursor_style = "BlinkingBar",
  -- disable_default_key_bindings = true, -- use only my keybinds
  -- enable_csi_u_key_encoding = true, -- allow ctrl-tab, others?
  -- exit_behavior = "Close",

  font = wezterm.font({
    family = "Hack Nerd Font"
  }),
  font_size = 12,
  hide_tab_bar_if_only_one_tab = true,

  window_background_opacity = 0.98,

  colors = {
    --- NOTE: HSL is also supported
    -- The default text color
    foreground = '#eceff1',
    -- The default background color
    background = '#242e33',

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = '#c9d1d7',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = '#eceff1',
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = '#52ad70',

    -- the foreground color of selected text
    -- selection_fg = 'black',
    -- the background color of selected text
    -- selection_bg = '#fffacd',

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    -- scrollbar_thumb = '#222222',

    -- The color of the split lines between panes
    -- split = '#444444',

    -- ansi = {
    --   'black',
    --   'maroon',
    --   'green',
    --   'olive',
    --   'navy',
    --   'purple',
    --   'teal',
    --   'silver',
    -- },
    -- brights = {
    --   'grey',
    --   'red',
    --   'lime',
    --   'yellow',
    --   'blue',
    --   'fuchsia',
    --   'aqua',
    --   'white',
    -- },
    --
    ansi = {
      '#636c77',
      '#ff1447',
      '#4e9c00',
      '#ba9c00',
      '#009bba',
      '#a42eff',
      '#0ba394',
      '#c9d1d7',
    },
    brights = {
      '#6c7986',
      '#db0025',
      '#308000',
      '#cc6800',
      '#007ea8',
      '#c557ff',
      '#008276',
      '#ffffff',
    },

    -- Arbitrary colors of the palette in the range from 16 to 255
    -- indexed = { [136] = '#af8700' },

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    -- compose_cursor = 'orange',

    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    -- copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    -- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    -- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    -- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    -- quick_select_label_bg = { Color = 'peru' },
    -- quick_select_label_fg = { Color = '#ffffff' },
    -- quick_select_match_bg = { AnsiColor = 'Navy' },
    -- quick_select_match_fg = { Color = '#ffffff' },
  },

  keys = {
    -- shift-control-c copies
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({
      CopyTo = "ClipboardAndPrimarySelection"
    })},
    -- shift-ctrl-v pastes
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({
      PasteFrom = "Clipboard"
    })},
    -- control -/_ decreases font size
    { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
    { key = "_", mods = "CTRL|SHIFT", action = "DecreaseFontSize" },
    -- control =/+ increases font size
    { key = "=", mods = "CTRL", action = "IncreaseFontSize" },
    { key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
    -- ctrl 0 resets font size
    { key = "0", mods = "CTRL", action = "ResetFontSize" },
    -- Shift-PageUp, Shift-PageDown scrolls
    { key = "PageUp", mods = "SHIFT", action = wezterm.action({
      ScrollByPage = -1
    })},
    { key = "PageDown", mods = "SHIFT", action = wezterm.action({
      ScrollByPage = 1
    })},

    -- LEADER (CapsLock)
    -- leader-f search
    { key = "f", mods = "LEADER", action = wezterm.action({
      Search={CaseInSensitiveString=""}
    })},
    -- leader-shift-F regex search
    { key = "F", mods = "LEADER|SHIFT", action = wezterm.action({
      Search={ Regex="" }
    })},
  }
}
