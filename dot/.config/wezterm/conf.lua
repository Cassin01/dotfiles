local wezterm = require 'wezterm'
local dimmer = { brightness = 0.1 }

local config = {
    font = wezterm.font_with_fallback({
            -- #english
            -- "Yuki Code",
            "NovaMono",

            -- #ligature
            "Lilex",
            -- "JetBrains Mono",

            -- #japanese
            -- "Hachi Maru Pop",
        }),
    font_size = 14.0,

    window_background_opacity = 1.0, -- 0.7,
    text_background_opacity = 1.0,
    -- window_background_image=os.getenv('HOME')..'/.config/nvim/data/wallpapers/c-o-champion-sona-mutemix-animated.gif',
    background = {
        {
            source = {
                -- File = os.getenv('HOME')..'/.config/nvim/data/wallpapers/c-o-champion-sona-mutemix-animated.gif',
                File = os.getenv('HOME')..'/.config/nvim/data/wallpapers/thresh.gif',
            },
            -- width = "1920",
            -- height = "1200",
            width = "2560",
            height = "1600",
            -- width = "Contain",
            repeat_x = "NoRepeat",
            repeat_y = "NoRepeat",
            -- vertical_align = 'Bottom',
            -- repeat_y_size = '200%',
            hsb = dimmer,
            -- attachment = { Parallax = 0.2 },
        }
    },
    window_background_image_hsb = {
        brightness = 0.1,
        -- hue = 1.0,
        -- saturation = 1.0,
    },

    color_scheme = 'kanagawabones',

    window_decorations = "RESIZE",
    -- window_padding = {
    --   left = 0,
    --   right = 0,
    --   top = 0,
    --   bottom = 0,
    -- },

    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,

    -- disable_default_key_bindings = true,
    leader = { key = '\\',  mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        {
            key = '|',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'r',
            mods = 'CMD|SHIFT',
            action = wezterm.action.ReloadConfiguration,
        },
        { key = '@', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[64;5u' },
        { key = 'F', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[70;6u' },
        { key = 'H', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[72;6u' },
        -- { key = 'K', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[75;6u' },
        { key = 'L', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[76;6u' },
        { key = 'O', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[79;6u' },
        { key = 'U', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[85;6u' },
    },
}

return config
