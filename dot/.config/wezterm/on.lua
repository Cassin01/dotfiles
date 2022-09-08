local wezterm = require("wezterm")
local conf = require("conf")
local dimmer = { brightness = 0.1 }

local getimagewidthheight = require("get_img_size")

local file = os.getenv('HOME')..'/.config/nvim/data/wallpapers/thresh.gif'

local function gi_wh(width, height)
    local w, h = getimagewidthheight(file)
    if w and h then
        if w * height  > h * width then
            return math.ceil(height * w / h), height
        else
            return width , math.ceil(width * h / w)
        end
    else
        return width,height
    end
end

local function recompute_background_size(window)
    local window_dims = window:get_dimensions()

    local width = tostring(window_dims.pixel_width)
    local height = tostring(window_dims.pixel_height)
    width, height = gi_wh(width, height)

    conf.background = {
        {
            source = {
                -- File = os.getenv('HOME')..'/.config/nvim/data/wallpapers/c-o-champion-sona-mutemix-animated.gif',
                File =  file,
            },
            -- width = "1920",
            -- height = "1200",
            width = width,
            height = height,
            -- width = "Contain",
            repeat_x = "NoRepeat",
            repeat_y = "NoRepeat",
            -- vertical_align = 'Bottom',
            -- repeat_y_size = '200%',
            hsb = dimmer,

            -- attachment = { Parallax = 0.2 },
        }
    }
    local cfg = window:get_config_overrides()
    wezterm.log_info(cfg)
    -- wezterm.log_info(window:get_config_overrides())
    window:set_config_overrides(conf)


    return conf
end

wezterm.on("window-resized", function(window, pane)
    recompute_background_size(window)
end)

wezterm.on('window-config-reloaded', function(window)
    recompute_background_size(window)
end)
