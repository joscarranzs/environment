local wezterm = require 'wezterm'

return {
  -- Fuente
  font = wezterm.font_with_fallback {
    "Iosevka Nerd Font",
    "JetBrainsMono Nerd Font",
  },
  font_size = 13.0,

  -- Colores personalizados
  colors = {
    foreground = "#e0def4",
    background = "#070707",
    cursor_bg = "#e0def4",
    cursor_fg = "#191724",
    selection_bg = "#403d52",
    selection_fg = "#e0def4",

    ansi = {
      "#6e6a86",
      "#eb6f92",
      "#9ccfd8",
      "#f6c177",
      "#c4a7e7",
      "#ea9a97",
      "#3e8fb0",
      "#e0def4",
    },
    brights = {
      "#6e6a86",
      "#eb6f92",
      "#9ccfd8",
      "#f6c177",
      "#c4a7e7",
      "#ea9a97",
      "#3e8fb0",
      "#e0def4",
    },
  },

  -- Transparencia y efecto blur (solo en Windows)
  window_background_opacity = 0.95,
  text_background_opacity = 0.95,
  win32_system_backdrop = "Acrylic",

  -- Tamaño inicial amplio
  initial_rows = 40,
  initial_cols = 120,

  -- Padding
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  -- Cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 200,

  -- Scrollback
  scrollback_lines = 10000,

  -- WSL shell
  default_prog = { "wsl.exe", "~" },

  -- Opciones visuales
  enable_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "TITLE",
  window_frame = {
    active_titlebar_bg = "#070707",
    inactive_titlebar_bg = "#070707",
  },
  window_close_confirmation = "NeverPrompt",
}
