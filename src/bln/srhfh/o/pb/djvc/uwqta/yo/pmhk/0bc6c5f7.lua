local ___int_omybv = 38
local ___tab_yzt = {}
local ____eawmw = nil
local ____inbpq = nil
local ____ib = nil
local ___tab_mq = {}
local ___int_vfl = 70
local ___str_blj = "uixr"
local ___tab_lrf = {}
local ___tab_yy = {}
local ____lr = nil
local ___tab_ztmpo = {}
local ___bool_txij = false
local ____la = nil
local ___bool_oz = false
local ___str_wrr = "heihw"
local ___bool_rp = false
local ___int_ucs = 53
local ___int_onlvb = 26
local ___str_od = "amddp"
local ____xbh = nil
local ___tab_gij = {}
local ___str_xabw = "waj"
local ___tab_rhk = {}
local ___tab_tcjuh = {}
local ___tab_iul = {}
local ___int_vh = 61
local ___int_wk = 28

local function ___ubysq()
	local str_ervfk = "qsygu"
	local bool_fh = false
	local bool_kf = false
	local _vnziw = nil
end

local function ___evft()
	local _kpu = nil
	local _jwxjy = nil
end

local function ___qqj()
	local bool_lpn = false
	local str_jxh = "iwtxve"
	local _zxvbw = nil
	local bool_nfwq = false
	local str_mzo = "suy"
end

local function ___mbm()
	local str_pmr = "yrn"
	local bool_qcty = false
	local _iehb = nil
end

local function ___gazyq()
	local bool_uceal = false
	local tab_kwvy = {}
	local bool_kqc = false
end

local function ___vyqtx()
	local bool_qs = false
	local int_nkr = 94
	local tab_flmt = {}
	local _jbsi = nil
end

local function ___wl()
	local _lnwpy = nil
	local str_glgl = "wep"
end

local function ___bpuvm()
	local int_fftn = 38
	local str_lbn = "whzb"
	local int_lwnmb = 99
end

local function ___qov()
	local bool_svarr = false
	local tab_xq = {}
end

local function ___qe()
	local int_dzli = 17
	local int_bdk = 90
	local int_ayozz = 10
	local str_wjvs = "dvhi"
	local int_xmgyp = 7
end

local function ___plrow()
	local int_znjjv = 66
	local str_dtbht = "vfyx"
end

local function ___cf()
	local tab_dsz = {}
	local bool_pttp = false
end

local function ___gurzs()
	local int_xdjn = 100
	local bool_ilxj = false
	local bool_atc = false
end

local function ___aatdf()
	local bool_hc = false
	local str_sw = "tkhvgp"
	local _dqm = nil
	local int_otol = 55
end

local function ___udah()
	local _ggyjs = nil
	local tab_kdn = {}
	local str_rgve = "qdeoq"
	local int_dhjj = 17
end

local function ___duk()
	local str_rzn = "jgt"
	local int_is = 34
	local _suh = nil
	local _hoqcx = nil
	local int_oue = 6
end

local function ___sb()
	local bool_jng = false
	local str_hia = "sfknpc"
	local _nos = nil
	local int_mrz = 5
end

local function ___tnhjn()
	local tab_nis = {}
	local int_kkszj = 37
	local _roxfr = nil
	local int_mxriz = 71
	local bool_me = false
end

local function ___ep()
	local str_hhki = "mgdm"
	local bool_evpz = false
	local int_eb = 28
end

local function ___qimkr()
	local _aea = nil
	local tab_wh = {}
	local str_etiu = "waem"
	local int_ugzbm = 1
end

local function ___hu()
	local _zboo = nil
	local bool_nszoy = false
	local tab_twdm = {}
end

local function ___cj()
	local str_ymtm = "rsgo"
	local tab_lrp = {}
	local str_xcxe = "golvg"
	local _ceby = nil
	local bool_cwj = false
end

local function ___ts()
	local tab_ufkl = {}
	local tab_yehdn = {}
	local tab_na = {}
	local _hihng = nil
	local _gd = nil
end

local function ___qqhai()
	local _acl = nil
	local _xrmh = nil
	local tab_jp = {}
	local tab_kdl = {}
end

local function ___njxvi()
	local tab_bwql = {}
	local tab_px = {}
	local str_vpt = "nvqi"
	local int_eifht = 25
	local _gcdrd = nil
end
Facebook = class("Facebook")

function Facebook:ctor( ... )
	self._instance = nil
	self.userid = ""
end

function Facebook:getInstance( ... )
	if not self._instance then
		self._instance = Facebook.new()
	end
	return self._instance
end

function Facebook:callStaticMethod(callName, args, sigs, args_ios)
	-- 去掉Facebook
	if true or cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return false
	end

	if Config.platform == "ios" then
		-- local luaoc = require "cocos.cocos2d.luaoc"
		-- local className = "BuglyManager"
		-- luaoc.callStaticMethod(className, callName, args_ios)
	else
		local luaj = require "cocos.cocos2d.luaj"
		local className = "org/cocos2dx/facebook/Facebook" .. bole.methomName()
		return luaj.callStaticMethod(className, callName, args, sigs)
	end
end

-- 设置回调
function Facebook:setCallback()
	print("Facebook setCallback")
	local callbackLua = function ( json_data )
		if not json_data then
			if self.successCallback then
				self.successCallback(1)
			end
		end

		local data = json.decode(json_data)
		dump(data, "Facebook login result", 10)
		if data and data.ret == 0 then
			-- 成功
			if data and data.userid then
				self.userid = data.userid
			end

			if self.successCallback then
				self.successCallback(0)
			end
		else
			-- 失败
			if self.successCallback then
				self.successCallback(1)
			end
			bole.showTips("An error has occurred, please try again!")
		end
    end

	local args_ios = {}
	local args = {callbackLua}
	local sigs = "(I)V"
	local methodName ="setCallback" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end

-- 登录
function Facebook:login(callback)
	self.successCallback = callback
	-- self:showLoading("getting your line id...")

	if self:isLoggedIn() then
		print("facebook login: true")
		return
	end

	local args_ios = {}
	local args = {"public_profile"}
	local sigs = "(Ljava/lang/String;)V"
	local methodName ="login" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end

-- 登出
function Facebook:loginOut()
	local args_ios = {}
	local args = {}
	local sigs = "()V"
	local methodName ="loginOut" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end

function Facebook:isLoggedIn( )
	local args_ios = {}
	local args = {}
	local sigs = "()boolean"
	local methodName ="isLoggedIn" .. bole.methomName()
	local ok, ret = self:callStaticMethod(methodName, args, sigs, args_ios)
	if not ok then
		return false
	else
		return ret
	end
end

function Facebook:getUserID( ... )
	return self.userid
end

function Facebook:hideLoading( ... )
	-- body
	if self.loading and self.loading.hide then
		self.loading:hide()
	end
	self.loading = nil
end

function Facebook:showLoading (txt)
	-- body
	self:hideLoading()
	self.loading = LoadingDialog.new(txt)
	self.loading:show()
end

function Facebook:getPicture(width, height)
	width = width or 128
	height = height or 128
	return self:getFbIconPic(width, height)
end

function Facebook:getFbIconPic(width, height)
	local id = self.userid
	local res = ""
	if width and height then
		res = string.format("https://graph.facebook.com/%s/picture?width=%d&height=%d", id, width, height)
	else
		res = string.format("https://graph.facebook.com/%s/picture", id)
	end
	return res
end

function Facebook:getName( ... )
	return self.name or ""
end

function Facebook:getFirstName( ... )
	return self.firstName or ""
end

function Facebook:getLastName( ... )
	return self.lastName or ""
end

function Facebook:hasLoginBefore ()
	return 1 == cc.UserDefault:getInstance():getIntegerForKey(FACEBOOK_HAS_LOGIN_BEFORE, 0)
end