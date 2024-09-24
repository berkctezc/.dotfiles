local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
    "MesloLGS Nerd Font Mono",
    "JetBrains Mono Nerd Font",
})
config.font_size = 12
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.7
config.macos_window_background_blur = 50

return config