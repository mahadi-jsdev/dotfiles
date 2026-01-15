local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- --- Appearance ---
config.color_scheme = 'Tokyo Night' -- One of 1000+ built-ins
config.font = wezterm.font('JetBrains Mono Nerd Font')
config.font_size = 13.0
config.window_background_opacity = 1
config.macos_window_background_blur = 10 -- macOS only
config.window_decorations = "RESIZE"     -- Cleaner title bar

-- remove side padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- --- Tab Bar ---
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- --- Performance ---
config.front_end = "WebGpu" -- Faster rendering on modern GPUs

return config
