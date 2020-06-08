-- Badwolf theme derived from Steve Losh's Vim Coloe Scheme (github.com/sjl/badwolf)
-- Modified by Grant Nichol

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "badwolf/"
local default_theme = "/usr/share/awesome/themes/default/"

local theme = {}

theme.font          = "sans 8"

theme.bg_focus      = "#141413"
theme.bg_normal     = "#1c1b1a"
theme.bg_urgent     = "#ff2c4b"
theme.bg_minimize   = "#998f84"
theme.bg_systray    = theme.bg_normal

theme.fg_focus     = "#f8f6f2"
theme.fg_normal      = "#f8f6f2"
theme.fg_urgent     = "#f8f6f2"
theme.fg_minimize   = "#f8f6f2"

theme.useless_gap   = 0
theme.border_width  = 0
theme.border_normal = "#141413"
theme.border_focus  = "#45413b"
theme.border_marked = "#998f84"

-- There are other variable sets
-- overriding the badwolf one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Change notification style
theme.notification_opacity = 0.75
theme.notification_icon_size = "50px"
theme.wallpaper = themes_path.."opAmp.jpg"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)


-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = default_theme .. "submenu.png"
theme.menu_height = dpi(10)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = default_theme.."titlebar/close_normal.png"
theme.titlebar_close_button_focus  = default_theme.."titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = default_theme.."titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = default_theme.."titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = default_theme.."titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = default_theme.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = default_theme.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = default_theme.."titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = default_theme.."titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = default_theme.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = default_theme.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = default_theme.."titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = default_theme.."titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = default_theme.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = default_theme.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = default_theme.."titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = default_theme.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = default_theme.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = default_theme.."titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = default_theme.."titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh = default_theme.."layouts/fairhw.png"
theme.layout_fairv = default_theme.."layouts/fairvw.png"
theme.layout_floating  = default_theme.."layouts/floatingw.png"
theme.layout_magnifier = default_theme.."layouts/magnifierw.png"
theme.layout_max = default_theme.."layouts/maxw.png"
theme.layout_fullscreen = default_theme.."layouts/fullscreenw.png"
theme.layout_tilebottom = default_theme.."layouts/tilebottomw.png"
theme.layout_tileleft   = default_theme.."layouts/tileleftw.png"
theme.layout_tile = default_theme.."layouts/tilew.png"
theme.layout_tiletop = default_theme.."layouts/tiletopw.png"
theme.layout_spiral  = default_theme.."layouts/spiralw.png"
theme.layout_dwindle = default_theme.."layouts/dwindlew.png"
theme.layout_cornernw = default_theme.."layouts/cornernww.png"
theme.layout_cornerne = default_theme.."layouts/cornernew.png"
theme.layout_cornersw = default_theme.."layouts/cornersww.png"
theme.layout_cornerse = default_theme.."layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
