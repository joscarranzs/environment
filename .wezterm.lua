local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return {
    -- Fuente
    font = wezterm.font_with_fallback {
        "Iosevka Nerd Font",
        "JetBrainsMono Nerd Font",
    },
    font_size = 14.0,

    -- Colores inspirados en Rosé Pine + fondo #15191F
    colors = {
        foreground = "#e0def4",
        background = "#15191F",        -- Fondo personalizado
        cursor_bg = "#e0def4",
        cursor_fg = "#15191F",
        selection_bg = "#403d52",
        selection_fg = "#e0def4",

        ansi = {
            "#26233a", -- black (base)
            "#eb6f92", -- red (love)
            "#31748f", -- green (foam)
            "#f6c177", -- yellow (gold)
            "#9ccfd8", -- blue (iris)
            "#c4a7e7", -- magenta (pine)
            "#ebbcba", -- cyan (rose)
            "#e0def4", -- white (text)
        },
        brights = {
            "#6e6a86", -- bright black (subtle)
            "#eb6f92",
            "#9ccfd8",
            "#f6c177",
            "#c4a7e7",
            "#ea9a97",
            "#3e8fb0",
            "#e0def4",
        },
    },

    -- Transparencia (opcional)
    window_background_opacity = 0.50,
    text_background_opacity = 0.50,
    win32_system_backdrop = "Acrylic", -- Solo Windows

    -- Tamaño inicial
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
    window_decorations = "NONE",
    window_frame = {
        active_titlebar_bg = "#15191F",
        inactive_titlebar_bg = "#15191F",
    },
    window_close_confirmation = "NeverPrompt",
}
