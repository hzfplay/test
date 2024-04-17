local ___str_qrtbh = "ugg"
local ___int_ipx = 79
local ___tab_sxeay = {}
local ___bool_ubkz = false
local ___str_hvsz = "dvwdi"
local ___int_oy = 47
local ___str_rm = "bbl"
local ____juln = nil
local ___bool_xu = false
local ___tab_zv = {}
local ___int_uux = 75
local ___bool_qnj = false
local ____ff = nil
local ____xlsd = nil
local ___tab_sm = {}
local ____bb = nil
local ___str_ruto = "kkmes"
local ___str_zzwo = "jmk"

local function ___nz()
	local tab_myo = {}
	local int_bavoi = 63
	local tab_os = {}
end

local function ___vhq()
	local _wzmdv = nil
	local str_si = "vxtbkc"
	local bool_yi = false
	local bool_hhvn = false
	local int_mcjfr = 85
end

local function ___tos()
	local tab_rrgtc = {}
	local bool_qcm = false
end

local function ___fi()
	local str_cpx = "sxm"
	local int_tta = 8
	local str_uwmm = "gyj"
	local bool_ljw = false
	local _xan = nil
end

local function ___bzbyy()
	local str_ioaf = "fzm"
	local bool_adso = false
end

local function ___avgej()
	local str_utzk = "qflps"
	local bool_ry = false
	local bool_xn = false
end

local function ___tnn()
	local tab_lnqk = {}
	local str_shc = "jrbda"
	local bool_awjh = false
end

local function ___rvsw()
	local tab_vh = {}
	local bool_tcl = false
end

local function ___lgpr()
	local bool_saksg = false
	local str_enf = "alwvw"
	local tab_nc = {}
	local bool_gk = false
	local _bxin = nil
end

local function ___ec()
	local int_peqk = 30
	local int_lx = 87
end
 
Admop = class("Admop")

function Admop:ctor ()
	self._instance = nil
	self.successCallback = nil
 

	-- bole.potp:registerCmd(LINE_CONNECT, self.oncmd,self)
	-- bole.potp:registerCmd(LINE_LOGOUT, self.oncmd, self)
end

function Admop:getInstance (...)
	if not self._instance then
		self._instance = Admop.new()
	end
	return self._instance
end


function Admop:callStaticMethod(callName, args, sigs, args_ios)
	if  cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return false
	end

	if Config.platform == "ios" then
		-- local luaoc = require "cocos.cocos2d.luaoc"
		-- local className = "BuglyManager"
		-- luaoc.callStaticMethod(className, callName, args_ios)
	else
		local luaj = require "cocos.cocos2d.luaj"
		local className = "org/cocos2dx/admop/Admop" .. bole.methomName()
		return luaj.callStaticMethod(className, callName, args, sigs)
	end
end

function Admop:openAd(callback)
    self.successCallback = callback
    local args_ios = {}
	local args = {}
	local sigs = "()V"
	local methodName = "openAd" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end


-- 设置回调
function Admop:setCallback()
	print("Admop setCallback")
	local callbackLua = function ( json_data )
		local data = json.decode(json_data)
		dump(data, "Admop login result", 10)
		if data and data.ret == 0 then
			-- 成功
			if self.successCallback then
				self.successCallback()
			end
		else
			-- 失败
			bole.showTips("Advertisement error, please try again!")
		end
		self.successCallback = nil
    end

	local args_ios = {}
	local args = {callbackLua}
	local sigs = "(I)V"
	local methodName = "setCallback" .. bole.methomName()
	self:callStaticMethod(methodName, args, sigs, args_ios)
end
