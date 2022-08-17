local wezterm = require 'wezterm'

return {
    -- font = wezterm.font 'HackGen',
    -- font = wezterm.font 'JetBrains Mono',
    font = wezterm.font_with_fallback({
            -- #english
            -- "Yuki Code",
            -- "NovaMono",
            -- #ligature
            "Lilex",
            -- "JetBrains Mono",
            -- #japanese
            "Hachi Maru Pop",
            -- #{}
        }),
    -- font_size = 20.0,
    font_size = 16.0,
    color_scheme = 'Batman',
    window_background_opacity = 0.7,
    text_background_opacity = 0.3,

    -- disable_default_key_bindings = true,
    leader = { key = '\\',  mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        {
            key = '|',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        { key = '@', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[64;5u' },
    },
}
