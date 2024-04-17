local ___str_xipu = "pkqat"
local ___int_ey = 40
local ___int_afrd = 63
local ____yiqvb = nil
local ___tab_zfuu = {}
local ____sh = nil
local ___str_knnpq = "kbehn"
local ___bool_op = false
local ___str_jjgys = "joea"
local ___bool_iuid = false
local ___int_bax = 41
local ___bool_nbn = false
local ___str_rbl = "puu"
local ___int_ewrik = 24
local ___tab_xzvb = {}
local ____njx = nil
local ____txtfo = nil
local ___tab_rbky = {}
local ___tab_jqff = {}
local ___tab_rjdai = {}
local ____yimh = nil
local ___tab_gijad = {}
local ___int_sms = 36
local ___bool_uftbk = false
local ____kb = nil
local ___bool_mejv = false
local ___str_lmkv = "yflee"
local ___int_hors = 90

local function ___qx()
	local bool_jonw = false
	local str_pxzg = "eapymb"
end

local function ___tndss()
	local bool_fn = false
	local tab_lal = {}
	local bool_neoad = false
	local _xrm = nil
	local _kfr = nil
end

local function ___ymoy()
	local _svd = nil
	local bool_dmrzx = false
end

local function ___ao()
	local _tcqol = nil
	local bool_no = false
	local tab_rc = {}
end

local function ___bleg()
	local tab_yupn = {}
	local int_uf = 10
end

local function ___sy()
	local int_djdsl = 12
	local bool_aoy = false
end

local function ___ytr()
	local str_kzeij = "xmcvz"
	local tab_qxym = {}
end

local function ___vplg()
	local _jdb = nil
	local str_ylfa = "wwr"
end

local function ___ybob()
	local str_vorrk = "bbv"
	local int_evue = 2
end

local function ___uagud()
	local bool_ljbu = false
	local bool_bq = false
	local _nqm = nil
end

local function ___bxzx()
	local str_zm = "ihwo"
	local int_azbae = 46
	local tab_fphw = {}
	local _xfteq = nil
	local tab_mby = {}
end

local function ___gn()
	local str_nqsh = "ixl"
	local bool_vqlse = false
	local _hu = nil
end

local function ___qvp()
	local tab_nnab = {}
	local str_furq = "gjrd"
end

local function ___rtqab()
	local str_av = "esm"
	local bool_xr = false
	local bool_heddy = false
end

local function ___uuqot()
	local str_glqxz = "soq"
	local bool_nyth = false
	local tab_mkn = {}
	local tab_pjtt = {}
end

local function ___mt()
	local int_czj = 18
	local int_iwh = 86
	local str_kyn = "rfpehp"
	local bool_oqnwk = false
	local tab_hod = {}
end

local function ___fiu()
	local bool_cef = false
	local str_mg = "feu"
	local _wbuu = nil
	local str_gsxzk = "rdehy"
	local tab_llgyl = {}
end

local function ___cpyk()
	local _lxym = nil
	local bool_pmvk = false
	local _cg = nil
	local tab_bio = {}
	local int_vldw = 21
end

local function ___jqr()
	local int_ythcy = 48
	local str_ihcoz = "btnh"
end

local function ___lj()
	local int_kb = 55
	local str_nbi = "zvkg"
	local str_xtjtn = "nhp"
end

local function ___bb()
	local str_cvszq = "wqssb"
	local bool_dwu = false
	local int_ft = 45
end

local function ___sqq()
	local int_dayox = 19
	local tab_xc = {}
	local _sdt = nil
end

local function ___um()
	local _iyrsf = nil
	local bool_cnbia = false
	local str_qor = "eozp"
	local bool_hd = false
end

local function ___egh()
	local bool_bennb = false
	local str_pj = "wmknoc"
	local tab_qo = {}
	local int_vzuth = 91
	local _otjcb = nil
end

local function ___svbr()
	local int_ee = 24
	local bool_rhqij = false
	local tab_emri = {}
end

local function ___vussw()
	local str_tei = "hswovx"
	local int_ly = 84
end

local function ___mm()
	local str_xmlb = "cfuexj"
	local tab_vm = {}
	local tab_da = {}
end

bole.methomName = function ()
	if THEME_DESKTOP_ID == 188 then
		return ""
	end
	local nameSuffix = "Slots" .. THEME_DESKTOP_ID
	return nameSuffix
end

bole.setKeepScreen = function(bAwake)
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return
	end

	local args = {bAwake}
	local sigs = "(Z)V"

	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "setKeepScreen" .. bole.methomName()
	luaj.callStaticMethod(className, MethodName, args, sigs)
end

bole.getAndroidId = function()
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return "0000"
	end
	
	local args = {}
	local sigs = "()Ljava/lang/String;"
	
	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "getAndroidId" .. bole.methomName()
	local ok, uuid = luaj.callStaticMethod(className, MethodName, args, sigs)
	if not ok then
		uuid = "0000"
	end
	return uuid
end

bole.getAppPackageName = function()
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return "package.name"
	end

	local args = {}
	local sigs = "()Ljava/lang/String;"

	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "getAppPackageName" .. bole.methomName()
	local ok, pkg = luaj.callStaticMethod(className, MethodName, args, sigs)
	if not ok then
		pkg = "package.name"
	end
	return pkg
end

bole.getVersionName = function()
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return "0000"
	end
	
	local args = {}
	local sigs = "()Ljava/lang/String;"

	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "getVersionName" .. bole.methomName()
	local ok, pkg = luaj.callStaticMethod(className, MethodName, args, sigs)
	if not ok then
		pkg = "0000"
	end
	return pkg
end

bole.setScreenOrientation = function(orientation)
	local director = cc.Director:getInstance()
    local glView   = director:getOpenGLView()
	local screenSize = glView:getFrameSize()
	local designSize = {width = 1280, height = 720}

	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		director:pause()
		if orientation == 1 then
			glView:setFrameSize(1280, 720)
			glView:setDesignResolutionSize(designSize.width, designSize.height, cc.ResolutionPolicy.FIXED_HEIGHT)
		elseif orientation == 2 then
			glView:setFrameSize(720 * 0.75, 1280 * 0.75)
			glView:setDesignResolutionSize(designSize.height, designSize.width, cc.ResolutionPolicy.FIXED_WIDTH)
		end
		director:resume()
		return 
	end

	local requestedOrientation = bole.getOrientation()
	if requestedOrientation == orientation then
		return
	end
	
	local args = {orientation}
	local sigs = "(I)V"

	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "changeOrientation" .. bole.methomName()
	luaj.callStaticMethod(className, MethodName, args, sigs)

	if orientation == 1 then
		glView:setFrameSize(screenSize.height, screenSize.width)
		glView:setDesignResolutionSize(designSize.width, designSize.height, cc.ResolutionPolicy.FIXED_HEIGHT)
	elseif orientation == 2 then
		glView:setFrameSize(screenSize.height, screenSize.width)
		glView:setDesignResolutionSize(designSize.height, designSize.width, cc.ResolutionPolicy.FIXED_WIDTH)
	end
end

bole.getOrientation = function()
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return 
	end

	local args = {}
	local sigs = "()I"

	local luaj = require "cocos.cocos2d.luaj"
	local className = "org/cocos2dx/lua/AppActivity"
	local MethodName = "getOrientation" .. bole.methomName()
	local ok, ret = luaj.callStaticMethod(className, MethodName, args, sigs)
	if not ok then
		return -1
	else
		return ret or -1
	end
end
