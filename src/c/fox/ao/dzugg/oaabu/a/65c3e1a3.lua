local ___tab_wemyd = {}
local ___int_pn = 53
local ___int_tjb = 78
local ___int_yppyt = 25
local ___str_kwxu = "tfrn"
local ___int_ejgrp = 92
local ___str_jsfjr = "waw"
local ____qsrwj = nil
local ____bfvq = nil
local ___int_uucjj = 44
local ___bool_kbu = false
local ___tab_jp = {}
local ___bool_jln = false
local ____bnkbn = nil
local ____vnlk = nil
local ___tab_ty = {}
local ___tab_bay = {}
local ___tab_ouo = {}
local ____hxeu = nil
local ____lth = nil

local function ___nv()
	local tab_upt = {}
	local _retm = nil
	local _ocmmq = nil
	local bool_lggn = false
end

local function ___kxcva()
	local bool_ga = false
	local int_tqk = 85
end

local function ___pv()
	local tab_hthj = {}
	local int_bb = 49
	local _npv = nil
	local tab_anlff = {}
end

local function ___isqu()
	local str_huzw = "kscy"
	local bool_yoy = false
end

local function ___hm()
	local tab_bizuw = {}
	local int_exadu = 67
	local tab_jzo = {}
	local _tftxa = nil
	local int_gdvkd = 16
end

local function ___luglw()
	local _ljtcm = nil
	local int_lzh = 30
	local str_vzsf = "dczwt"
	local tab_kjp = {}
end

local function ___yf()
	local int_suqoj = 9
	local str_aigvi = "tkl"
end

local function ___oct()
	local tab_gfday = {}
	local int_bgv = 73
	local _yi = nil
	local tab_myue = {}
end

local function ___nas()
	local _mbvis = nil
	local tab_onmt = {}
	local bool_vm = false
end

local function ___wkrkz()
	local str_jqu = "egmzk"
	local int_wtfd = 34
	local _ecexw = nil
end

local function ___vtz()
	local tab_qj = {}
	local bool_ljldg = false
	local str_pr = "gmu"
	local _mocz = nil
end

local function ___bsk()
	local int_xas = 50
	local str_ndkvi = "pdfzj"
end

local function ___jgc()
	local bool_sxw = false
	local int_escu = 83
	local int_lbvfg = 99
	local str_vlr = "seos"
	local _zg = nil
end

local function ___ecf()
	local str_vhefv = "reixj"
	local _tm = nil
	local int_vbra = 6
end

local function ___vblvl()
	local str_yc = "ztgtx"
	local tab_dlyyd = {}
	local int_vxal = 42
end

local function ___vghme()
	local tab_ae = {}
	local bool_agk = false
	local _stc = nil
	local str_dnb = "uxdp"
	local _mqamu = nil
end

local function ___fnevb()
	local bool_fk = false
	local tab_gknpw = {}
	local _uqo = nil
end

local function ___mwovf()
	local int_jdfok = 75
	local int_wynr = 95
	local bool_vdgl = false
	local bool_vixd = false
	local _hv = nil
end
GoogleSignIn = class("GoogleSignIn")

function GoogleSignIn:ctor( ... )
	self._instance = nil
	self.successCallback = nil
	self.userid = ""
end

function GoogleSignIn:getInstance( ... )
	if not self._instance then
		self._instance = GoogleSignIn.new()
	end
	return self._instance
end

function GoogleSignIn:callStaticMethod(callName, args, sigs, args_ios)
	if  cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return false
	end


	if Config.platform == "ios" then
		-- local luaoc = require "cocos.cocos2d.luaoc"
		-- local className = "BuglyManager"
		-- luaoc.callStaticMethod(className, callName, args_ios)
	else
		local luaj = require "cocos.cocos2d.luaj"
		local className = "com.example.signin/SignIn" .. bole.methomName()
		return luaj.callStaticMethod(className, callName, args, sigs)
	end
end

-- 登录
function GoogleSignIn:login(callback)
	self.successCallback = callback
	-- self:showLoading("getting your line id...")

	-- if self:isLoggedIn() then
	-- 	print("GoogleSignIn login: true")
	-- 	return
	-- end
    print(12121212333)
	local args_ios = {}
	local args = {}
	local sigs = "()V"
	local methodName ="signIn" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end

-- 登出
function GoogleSignIn:loginOut(callback)
	self.successCallback = callback
	local args_ios = {}
	local args = {}
	local sigs = "()V"
	local methodName ="signOut" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end


-- 设置回调
function GoogleSignIn:setCallback(callback)
	self.successCallback = callback
	print("注册回调 SignIn setCallback")
	local callbackLua = function ( json_data )
		local data = json.decode(json_data)
		dump(data, "注册回调 SignIn login result", 10)
		-- 0： 登录成功。 1 退出成功， 2登录失败 3,登录过了
		if data and data.ret == 0 then
			-- 登录成功
			if self.successCallback then
				bole.showTips("SignIn Success")
				self.successCallback()
			end
		elseif data and data.ret == 1 then
			-- 退出成功
			if self.successCallback then
				bole.showTips("SignOut Success")
				self.successCallback()
			end
		elseif data and data.ret == 3 then
			-- 退出成功
			if self.successCallback then
				self.successCallback()
			end
		else
			-- 失败
			bole.showTips("SignIn error, please try again!")
		end
		self.successCallback = nil
    end

	local args_ios = {}
	local args = {callbackLua}
	local sigs = "(I)V"
	local methodName = "setCallback" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end
