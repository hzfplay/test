local ____lp = nil
local ___int_gmy = 94
local ___bool_qlf = false
local ____bc = nil
local ___str_jwasn = "swofgu"
local ___tab_cnur = {}
local ___bool_hdf = false
local ___str_lwm = "npxnbz"
local ___tab_uzatx = {}
local ___str_qblo = "tebtu"
local ___str_umohl = "dahao"

local function ___oxyfm()
	local _hr = nil
	local str_cy = "efrymr"
	local _fdf = nil
	local int_hzh = 27
end

local function ___zucj()
	local bool_xcp = false
	local bool_gnp = false
	local str_qo = "haz"
	local _qsycg = nil
end

local function ___qfode()
	local tab_jp = {}
	local tab_fgvka = {}
	local int_shpgc = 89
	local int_epik = 92
	local bool_ryy = false
end

local function ___cui()
	local bool_dkqyt = false
	local bool_qwy = false
	local tab_ryia = {}
end

local function ___wvo()
	local tab_sntjq = {}
	local _lbl = nil
	local str_nvno = "gba"
end

local function ___mbku()
	local bool_bwrd = false
	local _xqj = nil
end

local function ___lbn()
	local _bs = nil
	local int_aida = 18
end

local function ___yjx()
	local bool_ryi = false
	local bool_dpe = false
	local tab_knqu = {}
	local _ga = nil
	local tab_ep = {}
end

local function ___rxf()
	local _vsq = nil
	local str_lu = "xxay"
	local int_dn = 39
	local str_wehg = "byvnsl"
end

local function ___khdt()
	local bool_nm = false
	local _smgg = nil
	local int_uxxm = 35
end

local function ___hmdl()
	local tab_oh = {}
	local _usnlz = nil
	local bool_gg = false
	local tab_my = {}
	local bool_ih = false
end
libMM = {}

libMM.unloadTexture = function (path)
	local textureCache = cc.Director:getInstance():getTextureCache()
	if path then
		textureCache:removeTextureForKey(path)
	end
end

libMM.unloadTextureByList = function (path_list)
	TimerCallFunc:getInstance():addCallFunc(function( ... )
			local textureCache = cc.Director:getInstance():getTextureCache()
			if path_list then
				for _, path in pairs(path_list) do
					if path then
						textureCache:removeTextureForKey(path)
					end
				end
			end
		end, 0.5)
end

libMM.loadTextureAsync = function (path, complete_func)
	local textureCache = cc.Director:getInstance():getTextureCache()
	if path then
		textureCache:addImageAsync(path, function ( ... ) 
			if complete_func then 
				complete_func() 
			end 
		end)
	end
end

libMM.setIntegerForKey = function (key, value)
	cc.UserDefault:getInstance():setIntegerForKey(key .. (User:getInstance().user_id or 10000), value)
end

libMM.getIntegerForKey = function (key,default)
	default = default or 0
	return cc.UserDefault:getInstance():getIntegerForKey(key .. (User:getInstance().user_id or 10000), default)
end

libMM.setBoolForKey = function (key, value)
	cc.UserDefault:getInstance():setBoolForKey(key .. (User:getInstance().user_id or 10000), value)
end

libMM.getBoolForKey = function (key,default)
	return cc.UserDefault:getInstance():getBoolForKey(key .. (User:getInstance().user_id or 10000), default)
end

libMM.setFloatForKey = function (key, value)
	cc.UserDefault:getInstance():setFloatForKey(key .. (User:getInstance().user_id or 10000), value)
end

libMM.getFloatForKey = function (key,default)
	default = default or 0
	return cc.UserDefault:getInstance():getFloatForKey(key .. (User:getInstance().user_id or 10000), default)
end

libMM.setStringForKey = function (key, value)
	cc.UserDefault:getInstance():setStringForKey(key .. (User:getInstance().user_id or 10000), value)
end

libMM.getStringForKey = function (key,default)
	return cc.UserDefault:getInstance():getStringForKey(key .. (User:getInstance().user_id or 10000), default)
end