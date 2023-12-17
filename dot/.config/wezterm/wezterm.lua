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

local function get_color_scheme(scheme_name, component)
    local scheme = wezterm.get_builtin_color_schemes()[scheme_name]
    print(scheme)
    return scheme and scheme[component]
end

local conf = require("conf")

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

return conf

