local wezterm = require 'wezterm'

wezterm.on('update-right-status', function(window, pane)
  local compose = window:composition_status()
  if compose then
    compose = 'COMPOSING: ' .. compose
  end
  window:set_right_status(compose or '')
end)

return {
    -- font = wezterm.font 'HackGen',
    -- font = wezterm.font 'JetBrains Mono',
    font = wezterm.font_with_fallback({
            -- #english
            "Yuki Code",
            -- "NovaMono",
            -- #ligature
            -- "Lilex",
            -- "JetBrains Mono",
            -- #japanese
            -- "Hachi Maru Pop",
            -- #{}
        }),
    -- font_size = 20.0,
    font_size = 14.0,
    -- color_scheme = 'Batman',
    color_scheme = 'kanagawabones',
    window_background_opacity = 1.0, -- 0.7,
    text_background_opacity = 1.0,

    window_background_image = '/Users/cassin/Downloads/630848.jpg',
    -- window_background_image = '/Users/cassin/all_year/blur/blured.png',
    window_background_image_hsb = {
      -- Darken the background image by reducing it to 1/3rd
      brightness = 0.3, -- default 0.3
      -- You can adjust the hue by scaling its value.
      -- a multiplier of 1.0 leaves the value unchanged.
      hue = 3.0, -- default 1.0

      -- You can adjust the saturation also.
      saturation = 0.8, -- default 1.0
    },

    colors = {
      compose_cursor = 'orange',
    },

    -- disable_default_key_bindings = true,
    leader = { key = '\\',  mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        {
            key = '|',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        { key = '@', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[64;5u' },
        { key = 'F', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[70;6u' },
        { key = 'H', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[72;6u' },
        -- { key = 'K', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[75;6u' },
        { key = 'L', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[76;6u' },
        { key = 'O', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[79;6u' },
    },
}
