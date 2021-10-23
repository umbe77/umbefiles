#!/usr/bin/env lua

require "socket"
local cjson = require "cjson"
local https = require "ssl.https"

local icon_codes = {}
icon_codes["01d"] = ""
icon_codes["01n"] = ""
icon_codes["02d"] = ""
icon_codes["02n"] = ""
icon_codes["03*"] = ""
icon_codes["04*"] = ""
icon_codes["09d"] = ""
icon_codes["09n"] = ""
icon_codes["10d"] = ""
icon_codes["10n"] = ""
icon_codes["11d"] = ""
icon_codes["11n"] = ""
icon_codes["13d"] = ""
icon_codes["13n"] = ""
icon_codes["50d"] = ""
icon_codes["50n"] = ""

local default_icon = "";

local get_icon = function(icon_code)
    local icon = icon_codes[icon_code]
    if not icon then
        icon = default_icon
    end
    return icon
end

local main = function()
    local city = 'Livorno'
    local body, code, headers, status = https.request('https://api.openweathermap.org/data/2.5/weather?q=' .. city .. '&units=metric&appid=4069b21d94ebb44df96fe895da7ce6c0')
    if code == 200 then
        local result = cjson.decode(body)
        local temperature = result["main"]["temp"] .. '°'
        local icon = get_icon(result["weather"][1]["icon"])
        print(city .. ': ' ..icon .. ' ' .. temperature)
        return
    end
    print('Error retriving weather')
end

main()
