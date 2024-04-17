local ___bool_of = false
local ____tvgoq = nil
local ___str_vss = "hqmv"
local ___bool_of = false
local ____aax = nil
local ___tab_xonba = {}
local ____hxwlc = nil
local ____sbxoc = nil
local ____ljji = nil
local ___str_dt = "sqww"
local ___str_qk = "zbfwl"
local ___tab_uwl = {}
local ____mtuc = nil
local ___str_kmee = "mzlvk"
local ____kej = nil
local ___tab_hmwc = {}
local ____zj = nil
local ___bool_zjrd = false
local ___bool_kadf = false
local ___str_stbp = "aewt"
local ___int_ips = 69
local ___bool_lrvhm = false
local ____zniwt = nil
local ____aw = nil

local function ___dwtck()
	local _vhkc = nil
	local tab_jjhmc = {}
end

local function ___bwk()
	local int_sqvd = 69
	local bool_bx = false
	local tab_rgezy = {}
end

local function ___dhda()
	local str_amnnh = "kvswr"
	local _yi = nil
	local bool_xif = false
end

local function ___lebk()
	local _pon = nil
	local tab_hodew = {}
	local _npvff = nil
end

local function ___jylax()
	local int_av = 19
	local _ex = nil
	local _dki = nil
	local bool_mpdd = false
end

local function ___mt()
	local bool_wcm = false
	local int_hmwf = 33
	local tab_ce = {}
end

local function ___qilkw()
	local tab_fxo = {}
	local tab_ngu = {}
end

local function ___uk()
	local _rerke = nil
	local str_ggwqy = "vog"
end

local function ___mjfu()
	local str_ohlb = "ipfa"
	local _vayxh = nil
	local str_ojlwh = "bvhoe"
	local str_efagq = "lffuym"
	local tab_syon = {}
end

local function ___xhbnk()
	local int_sinh = 21
	local str_nfzv = "sositj"
	local tab_vp = {}
end

local function ___wdb()
	local tab_ohp = {}
	local str_ou = "cyco"
	local bool_igm = false
	local tab_gaf = {}
end

local function ___wutc()
	local str_bqwy = "jwpge"
	local _whxu = nil
	local tab_lusz = {}
	local bool_nsz = false
	local str_nlqee = "qhqm"
end

local function ___euxl()
	local tab_fgx = {}
	local _cp = nil
	local tab_gmvwl = {}
	local str_yfet = "zrnp"
end

-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 2

-- use framework, will disable all deprecated API, false - use legacy API
CC_USE_FRAMEWORK = true

-- show FPS on screen
CC_SHOW_FPS = true

-- disable create unexpected global variable
CC_DISABLE_GLOBAL = false

COMMON_PICS_PATH = "commonpics/"
COMMON_FONTS_PATH = "commonfonts/"

-- for module display
CC_DESIGN_RESOLUTION = {
    width = 1280,
    height = 720,
    autoscale = "FIXED_HEIGHT",
    callback = function(framesize)
        local ratio = framesize.width / framesize.height
        if ratio <= 1.34 then
            -- iPad 768*1024(1536*2048) is 4:3 screen
            return {autoscale = "FIXED_WIDTH"}
        end
    end
}

Splunk_Type = {
	RECORD = "record",         -- pid  1
	ACTION = "action",         -- action ""
	Error = "client_error",    -- error ""
	CoinError = "coin_error",  -- coin_error "" 
	Guide = "guide"            -- pid 1
}
