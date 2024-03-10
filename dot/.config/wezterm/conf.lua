local wezterm = require("wezterm")
local act = wezterm.action
local dimmer = {
    -- brightness = 0.1
    brightness = 1
}

-- 日中はopacityを下げてみる
local opacity = (function()
    local h = tonumber(os.date("%H"))
    print(h)
    if h >= 6 and h < 13 then
        return 0.8
    else
        return 0.6
    end
end)()
opacity = 0.6

-- 画数の多い文字
local config = {
    font = wezterm.font_with_fallback({
        -- #english
        -- "Yuki Code",
        -- "NovaMono",

        -- #ligature
        -- "Lilex",
        -- "JetBrains Mono",
        -- "PlemolJP Console",
        "Hack Nerd Font",

        -- #japanese
        -- "Hachi Maru Pop",
    }),
    font_size = 14.0,
    -- font_size = 48.0,
    -- font_size = 18.0,
    -- font_size = 24.0,

    window_background_opacity = opacity,
    text_background_opacity = opacity,
    macos_window_background_blur = 10,
    -- text_background_opacity = 0.6,
    -- window_background_image=os.getenv('HOME')..'/.config/nvim/data/wallpapers/c-o-champion-sona-mutemix-animated.gif',
    --
    -- background = {
    --     {
    --         source = {
    --             -- File = os.getenv('HOME')..'/.config/nvim/data/wallpapers/c-o-champion-sona-mutemix-animated.gif',
    --             File = os.getenv('HOME')..'/.config/nvim/data/wallpapers/thresh.gif',
    --         },
    --         -- width = "1920",
    --         -- height = "1200",
    --         width = "2560",
    --         height = "1600",
    --         -- width = "Contain",
    --         repeat_x = "NoRepeat",
    --         repeat_y = "NoRepeat",
    --         -- vertical_align = 'Bottom',
    --         -- repeat_y_size = '200%',
    --         hsb = dimmer,
    --         -- attachment = { Parallax = 0.2 },
    --     }
    -- },
    -- window_background_image_hsb = {
    --     brightness = 0.1,
    --     -- hue = 1.0,
    --     -- saturation = 1.0,
    -- },

    --color_scheme = "kanagawabones",
    -- color_scheme = "tokyonight-storm",
    -- color_scheme = "Grape",
    -- color_scheme = "Black Metal (base16)",
    -- color_scheme = "Swayr (terminal.sexy)",
    -- color_scheme = "tokyonight-day",
    -- color_scheme = "TokyoNightStorm (Gogh)",
    -- color_scheme = "Catppuccin Mocha",
    -- color_scheme = 'iceberg-light',
    -- color_scheme = 'Konsolas',
    -- color_scheme = "Teerb", -- 淡い
    -- color_scheme = "terafox", -- 濃い [お気に入り]
    -- color_scheme = "Tinacious Design (Light)",
    ---- for daylight
    -- color_scheme = 'Kolorit',
    -- color_scheme = 'Heetch Light (base16)',
    color_scheme = "Nova (base16)",

    window_decorations = "RESIZE", -- disable the title bar but eneable the resizable border
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    use_fancy_tab_bar = true,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    enable_tab_bar = true,
    check_for_updates = false,
    check_for_updates_interval_seconds = 86400,

    -- disable_default_key_bindings = true,
    leader = { key = "\\", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        {
            key = "-",
            mods = "LEADER",
            action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "|",
            mods = "LEADER|SHIFT",
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "r",
            mods = "LEADER",
            -- mods = "CMD|SHIFT",
            action = wezterm.action.ReloadConfiguration,
        },
        {
            key = "n",
            mods = "LEADER",
            -- mods = "CMD|SHIFT",
            action = wezterm.action.ToggleFullScreen,
        },
        {
            key = "a",
            mods = "LEADER",
            action = wezterm.action.EmitEvent 'change-color-scheme',
        },
        {
            key = "b",
            mods = "LEADER",
            action = wezterm.action.EmitEvent 'toggle-blur',
        },
        -- {
        --     key = "o",
        --     mods = "LEADER",
        --     action = wezterm.action.EmitEvent 'toggle-opacity',
        -- },
        {
            key = "t",
            mods = "LEADER",
            action = wezterm.action.EmitEvent 'toggle-tabbar',
        },
        {
            key = "h",
            mods = "LEADER",
            action = act.ActivatePaneDirection 'Left',
        },
        {
            key = "l",
            mods = "LEADER",
            action = act.ActivatePaneDirection 'Right',
        },
        {
            key = "k",
            mods = "LEADER",
            action = act.ActivatePaneDirection 'Up',
        },
        {
            key = "j",
            mods = "LEADER",
            action = act.ActivatePaneDirection 'Down',
        },
        {
            key = "s",
            mods = "CMD",
            action = wezterm.action.ShowDebugOverlay,
        },
        -- { key = 'Return', action = wezterm.action.SendString '\x0D'},
        -- { key = 'm', mods='CTRL', action = wezterm.action.SendString '\x1b[109;5u' },
        { key = "@", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[64;5u") },
        { key = "F", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[70;6u") },
        { key = "H", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[72;6u") },
        { key = "I", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[73;6u") },
        -- { key = 'K', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[75;6u' },
        { key = "L", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[76;6u") },
        -- { key = 'M', mods='CTRL|SHIFT', action = wezterm.action.SendString '\x1b[77;6u' },
        { key = "O", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[79;6u") },
        { key = "U", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[85;6u") },

        { key = "i", mods = "CTRL", action = wezterm.action.SendString("\x1b[105;5u") },
        -- { key = 'm', mods='CTRL', action = wezterm.action.SendString '\x1b[109;5u' },
    },
    colors = {
        -- split = '#149414',
        background = "#1c2131",
    },
}

return config
