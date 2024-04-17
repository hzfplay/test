local ___str_cic = "tiwqi"
local ____suxgv = nil
local ___bool_pihv = false
local ___bool_mho = false
local ___str_dqqyn = "grcxly"
local ___tab_vwxvo = {}
local ___bool_lhgkr = false
local ___int_wie = 39
local ____mblx = nil
local ___tab_ijm = {}
local ____hu = nil
local ___int_bkg = 35
local ___tab_gpmmx = {}
local ____rytbf = nil
local ___str_nlxp = "lwpzbo"
local ___tab_ohfx = {}
local ___str_sz = "nwlf"
local ____nzhbc = nil
local ___int_wt = 43
local ____yj = nil
local ___tab_ar = {}
local ___bool_cfjcs = false
local ___str_asvv = "bjj"

local function ___mn()
	local bool_ign = false
	local int_lt = 80
end

local function ___allyt()
	local str_zqhof = "qoe"
	local tab_ibzpc = {}
	local str_ugvy = "rjqqwg"
end

local function ___evlc()
	local _jbrn = nil
	local int_fc = 87
	local tab_so = {}
end

local function ___zqjvq()
	local str_vc = "oto"
	local bool_yi = false
	local int_lgjzc = 62
end

local function ___czzbx()
	local int_esm = 54
	local _oavbh = nil
	local bool_oj = false
end

local function ___onsos()
	local tab_nqxf = {}
	local tab_bgh = {}
	local _wswsr = nil
end

local function ___pvvga()
	local str_aujzn = "jlu"
	local int_dbrt = 17
end

local function ___pwpcp()
	local bool_ao = false
	local str_crsnz = "xfcfal"
end

local function ___hx()
	local bool_vnxoa = false
	local _co = nil
	local int_ltpu = 74
	local bool_ukioo = false
	local bool_jntog = false
end

local function ___ei()
	local bool_eztiw = false
	local str_zu = "hjc"
	local bool_ayig = false
	local int_gc = 10
end

local function ___mqjn()
	local int_qwuh = 80
	local _en = nil
end

local function ___pdx()
	local bool_yshk = false
	local tab_ior = {}
end

local function ___za()
	local int_gb = 99
	local str_vdxc = "hxylwg"
	local bool_oy = false
end

local function ___narzh()
	local bool_qlp = false
	local tab_osw = {}
	local tab_km = {}
	local bool_ndv = false
end

local function ___gv()
	local str_eb = "pjf"
	local int_jt = 49
	local _uo = nil
	local str_ftep = "jhpiz"
end

local function ___hl()
	local int_ca = 59
	local int_bx = 88
	local str_duk = "ahx"
	local bool_zoul = false
end

local function ___oahm()
	local bool_wrmq = false
	local bool_ueo = false
	local int_qvdp = 14
	local _vahp = nil
end

local function ___qh()
	local bool_miej = false
	local int_zfb = 68
	local _yhe = nil
	local tab_qhiai = {}
end

local PopupConfig = {}

-- 弹窗配置
-- dialog: 保存当前弹窗
-- download_type／download_key: 下载项
-- create_func: 弹窗创建函数
-- popup_func: 弹窗直接弹函数，不管当前是否已有弹窗
-- add_front_func: 将弹窗加入popup列表队首，当前没有弹窗才弹出；
-- add_tail_func: 将弹窗加入popup列表队尾，当前没有弹窗才弹出；
PopupConfig.popupDialogConfig = {

	["ad_reward"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("AdReward/Ad_Reward_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["facebook"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("FaceBook/FaceBook_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["setting"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("Setting/Setting_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["gift"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("Lobby/Lobby_Gift_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["game_rules"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
			local dialog = require ("UI/PaytableView")
			return dialog.new(data.controller, data.page) -- data.page added by rwb 指定打开某一页
		end,
	},
	["inspect_ad"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("Inspect/Inspect_Ad_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["inspect_fb"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("Inspect/Inspect_facebook_Dialog"))
			return dialog.new(data, callback)
		end,
	},
	["freecoins"] =
	{
		dialog = nil,
		create_func = function (key, data, callback)
            local dialog = require (bole.getDesktopFilePath("FreeCoins/Freecoins__Dialog"))
			return dialog.new(data, callback)
		end,
	},
}

return PopupConfig
