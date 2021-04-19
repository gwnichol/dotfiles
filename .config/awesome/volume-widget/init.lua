local module_path = (...):match ("(.+/)[^/]+$") or ""

package.loaded.volume_widget = nil

local net_widgets = {
    indicator   = require(module_path .. "net_widgets.indicator"),
    wireless    = require(module_path .. "net_widgets.wireless"),
    internet    = require(module_path .. "net_widgets.internet")
}


local wibox = require("wibox")
local awful = require("awful")

local volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

local function set_widget_volume(widget, status)

   local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   status = string.match(status, "%[(o[^%]]*)%]")

   -- starting colour
   local sr, sg, sb = 0x3F, 0x3F, 0x3F
   -- ending colour
   local er, eg, eb = 0xDC, 0xB0, 0xB0

   local color_vol = (function() if volume > 1 then return 1 else return volume end end)()

   local ir = color_vol * (er - sr) + sr
   local ig = color_vol * (eg - sg) + sg
   local ib = color_vol * (eb - sb) + sb
   interpol_colour = string.format("%.2x%.2x%.2x", ir, ig, ib)
   local text = ""
   if string.find(status, "on", 1, true) then
       text = " <span color='#"  .. interpol_colour .. "'> " .. volume * 100 .. "% </span>"
   else
       text = " <span color='red' background='#" .. interpol_colour .. "'> M </span>"
   end
   widget:set_markup(text)
end

local function update_widget(widget)
   awful.spawn.easy_async_with_shell("amixer sget Master", function(status)
	   set_widget_volume(widget, status)
   end)
end

local function update_volume()
	update_widget(volume_widget)
end

update_volume(volume_widget)

local mytimer = timer({ timeout = 5 })
mytimer:connect_signal("timeout", function () update_widget(volume_widget) end)
mytimer:start()

return {
	update_volume = update_volume,
	widget = volume_widget
}

