local ___str_qz = "ghu"
local ___tab_djsbf = {}
local ___bool_atluv = false
local ___bool_vdju = false
local ___tab_mcpj = {}
local ___tab_bl = {}
local ___int_rnzh = 30
local ____nzyc = nil
local ____fz = nil
local ___int_tu = 3
local ___str_quee = "gxgg"
local ____inhi = nil
local ____dzj = nil
local ___str_jmd = "mjoeql"
local ___int_jsyjo = 36
local ___str_rhyd = "klla"
local ___tab_ovi = {}
local ____cqk = nil
local ____fr = nil
local ___tab_topq = {}
local ___tab_zb = {}
local ___int_juoa = 82
local ____jhzos = nil
local ___int_zsoi = 82
local ___int_lqlxw = 48

local function ___be()
	local tab_tlrm = {}
	local bool_vybd = false
	local str_rfxm = "hpcked"
end

local function ___huahj()
	local bool_aujbd = false
	local _xby = nil
	local _caswx = nil
	local bool_ulf = false
	local _cwm = nil
end

local function ___ck()
	local tab_jv = {}
	local _ck = nil
end

local function ___wrxmu()
	local tab_cv = {}
	local int_yolwn = 81
end

local function ___atjqb()
	local bool_kp = false
	local int_sdv = 85
end

local function ___enma()
	local tab_ys = {}
	local int_vzq = 53
	local str_lzzp = "xfbk"
	local _tvdlk = nil
end

local function ___pkvod()
	local int_qbek = 77
	local str_mwr = "lzxy"
	local tab_ud = {}
end

local function ___bjq()
	local tab_cf = {}
	local bool_bnb = false
end

local function ___xcpck()
	local bool_cnoc = false
	local str_tsak = "rcfez"
	local str_in = "alri"
end

local function ___pcizg()
	local int_kpmzs = 52
	local tab_vpzfy = {}
	local bool_pnewu = false
	local str_lgz = "dkbasy"
	local bool_rtk = false
end

local function ___ncwd()
	local tab_rhv = {}
	local tab_vyj = {}
	local tab_mtc = {}
	local _jzo = nil
end

local function ___qhu()
	local tab_fk = {}
	local _raus = nil
	local str_qsed = "haxv"
end

local function ___yydn()
	local str_tqka = "mcpjv"
	local bool_kre = false
end

local function ___oa()
	local _yx = nil
	local str_jtami = "uknn"
	local tab_unked = {}
end

local function ___mv()
	local tab_ntiq = {}
	local tab_xj = {}
	local int_ne = 47
end

local function ___ivs()
	local _lq = nil
	local bool_avgm = false
end

local function ___awc()
	local tab_lb = {}
	local int_tzc = 88
	local tab_olpyg = {}
end

local function ___mpzub()
	local str_gbq = "yiovhj"
	local str_uh = "ybbr"
	local bool_xbnxt = false
end
--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

local device = {}

device.platform    = "unknown"
device.model       = "unknown"

local app = cc.Application:getInstance()
local target = app:getTargetPlatform()
if target == cc.PLATFORM_OS_WINDOWS then
    device.platform = "windows"
elseif target == cc.PLATFORM_OS_MAC then
    device.platform = "mac"
elseif target == cc.PLATFORM_OS_ANDROID then
    device.platform = "android"
elseif target == cc.PLATFORM_OS_IPHONE or target == cc.PLATFORM_OS_IPAD then
    device.platform = "ios"
    local director = cc.Director:getInstance()
    local view = director:getOpenGLView()
    local framesize = view:getFrameSize()
    local w, h = framesize.width, framesize.height
    if w == 640 and h == 960 then
        device.model = "iphone 4"
    elseif w == 640 and h == 1136 then
        device.model = "iphone 5"
    elseif w == 750 and h == 1334 then
        device.model = "iphone 6"
    elseif w == 1242 and h == 2208 then
        device.model = "iphone 6 plus"
    elseif w == 768 and h == 1024 then
        device.model = "ipad"
    elseif w == 1536 and h == 2048 then
        device.model = "ipad retina"
    end
elseif target == cc.PLATFORM_OS_WINRT then
    device.platform = "winrt"
elseif target == cc.PLATFORM_OS_WP8 then
    device.platform = "wp8"
end

local language_ = app:getCurrentLanguage()
if language_ == cc.LANGUAGE_CHINESE then
    language_ = "cn"
elseif language_ == cc.LANGUAGE_FRENCH then
    language_ = "fr"
elseif language_ == cc.LANGUAGE_ITALIAN then
    language_ = "it"
elseif language_ == cc.LANGUAGE_GERMAN then
    language_ = "gr"
elseif language_ == cc.LANGUAGE_SPANISH then
    language_ = "sp"
elseif language_ == cc.LANGUAGE_RUSSIAN then
    language_ = "ru"
elseif language_ == cc.LANGUAGE_KOREAN then
    language_ = "kr"
elseif language_ == cc.LANGUAGE_JAPANESE then
    language_ = "jp"
elseif language_ == cc.LANGUAGE_HUNGARIAN then
    language_ = "hu"
elseif language_ == cc.LANGUAGE_PORTUGUESE then
    language_ = "pt"
elseif language_ == cc.LANGUAGE_ARABIC then
    language_ = "ar"
else
    language_ = "en"
end

device.language = language_
device.writablePath = cc.FileUtils:getInstance():getWritablePath()
device.directorySeparator = "/"
device.pathSeparator = ":"
if device.platform == "windows" then
    device.directorySeparator = "\\"
    device.pathSeparator = ";"
end

printInfo("# device.platform              = " .. device.platform)
printInfo("# device.model                 = " .. device.model)
printInfo("# device.language              = " .. device.language)
printInfo("# device.writablePath          = " .. device.writablePath)
printInfo("# device.directorySeparator    = " .. device.directorySeparator)
printInfo("# device.pathSeparator         = " .. device.pathSeparator)
printInfo("#")

return device
