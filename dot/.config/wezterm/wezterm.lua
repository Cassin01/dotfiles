local wezterm = require("wezterm")
math.randomseed(os.time())
local schemes = {
    "tokyonight-storm",
    "tokyonight-day",
    "tokyonight-night",
    "Batman",
}

local function pick_color_scheme_randomly()
    local i = math.random(#schemes)
    return schemes[i]
end

wezterm.on("change-color-scheme", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local scheme = pick_color_scheme_randomly()
    overrides.color_scheme = scheme
    wezterm.log_info("changing color scheme to ", scheme)
    window:set_config_overrides(overrides)
end)

wezterm.on("set-color-scheme", function(window, pane)
    wezterm.log_info("the pane_id of ", pane.pane_id)
    local overrides = window:get_config_overrides() or {}
    overrides.color_scheme = schemes[pane.pane_id % #schemes]
    window:set_config_overrides(overrides)
end)

local conf = require("conf")

local function statusbar(conf)
    local scheme = wezterm.get_builtin_color_schemes()[conf["color_scheme"] or "Nova (base16)"]
    local bg = "#1c2131"
    local fg = scheme["foreground"]
    local sleep_fg = '#6c7693'
    local awake_bg = '#22283a'
    conf["colors"]["tab_bar"] = {
        background = bg,
        foreground = fg,
        active_tab = {
            bg_color = bg,
            fg_color = fg
        },
        inactive_tab = {
            bg_color = bg,
            fg_color = sleep_fg
        },
        new_tab = {
            bg_color = bg,
            fg_color = fg,
        },
    }
    conf["window_frame"] = {
        inactive_titlebar_bg = bg,
        active_titlebar_bg = bg,
    }
    return conf
end

wezterm.on("toggle-blur", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local blur = conf["macos_window_background_blur"] or 15
    if overrides.macos_window_background_blur == blur then
        overrides.macos_window_background_blur = 0
    else
        overrides.macos_window_background_blur = blur
    end
    window:set_config_overrides(overrides)
end)

wezterm.on("toggle-tabbar", function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.enable_tab_bar then
        overrides.enable_tab_bar = false
    else
        overrides.enable_tab_bar = true
    end
    window:set_config_overrides(overrides)
end)

local function get_color_scheme(scheme_name, component)
    local scheme = wezterm.get_builtin_color_schemes()[scheme_name]
    return scheme and scheme[component]
end

wezterm.on('update-right-status', function(window, _)
    local date = wezterm.strftime("%H:%M")
    window:set_right_status(wezterm.format({
        -- { Foreground = { Color = get_color_scheme(conf["color_scheme"], "foreground") } },
        { Text = date .. "   "},
    }))
end)

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--     wezterm.log_info("format-tab-title: ", tab.tab_id)
--     local window = wezterm.mux.get_window(tab.window_id)
--     local res = wezterm.emit("set-color-scheme", window, tab.active_pane)
--     -- wezterm.action.EmitEvent('change-color-scheme')
--     -- wezterm.log_info("res", res)
-- end)

conf = statusbar(conf)
return conf

