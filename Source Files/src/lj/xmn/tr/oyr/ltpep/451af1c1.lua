local ____rqzf = nil
local ___int_yogcq = 85
local ___tab_piac = {}
local ___tab_yfimn = {}
local ____jl = nil
local ___int_zfu = 16
local ___bool_hhmt = false
local ____rwv = nil
local ___tab_deo = {}
local ___tab_fa = {}
local ___tab_wz = {}
local ___bool_vlu = false
local ___str_jc = "fetgoy"
local ___str_ur = "fvcqvj"
local ____mmff = nil
local ____jjj = nil
local ____uk = nil
local ___bool_yn = false
local ___tab_zfscx = {}
local ___tab_tt = {}
local ___tab_lq = {}
local ____jlvxa = nil
local ___tab_nhtpc = {}
local ____ofbt = nil
local ___bool_vubr = false
local ___bool_cfzj = false
local ___tab_wyuf = {}
local ___tab_zw = {}

local function ___krcxc()
	local tab_su = {}
	local int_ukj = 36
	local bool_vzzw = false
end

local function ___fj()
	local bool_rur = false
	local bool_fupwn = false
	local tab_fhxf = {}
end

local function ___vl()
	local _txwcf = nil
	local tab_mnhg = {}
	local _jmr = nil
end

local function ___fzbja()
	local str_zrhqh = "lzql"
	local bool_zt = false
	local str_civt = "crp"
end

local function ___yphz()
	local tab_zle = {}
	local tab_uc = {}
	local bool_sv = false
	local bool_dw = false
end

local function ___fjfq()
	local int_ht = 79
	local _jro = nil
end

local function ___ioxey()
	local str_rtoj = "tqzz"
	local int_ad = 69
	local str_vjpon = "gzx"
end

local function ___bn()
	local int_sqsh = 58
	local _mz = nil
	local int_xo = 62
	local bool_hvuh = false
	local bool_rmhpr = false
end

local function ___ergeg()
	local int_ribrx = 49
	local _oaps = nil
	local str_ctrk = "krn"
	local bool_iylc = false
end

local function ___lfy()
	local str_nirdy = "dnn"
	local tab_cszew = {}
	local str_rtqj = "botdor"
end

local function ___vav()
	local str_bvt = "kvtqld"
	local str_buxk = "jcnaxu"
	local int_yjyh = 13
	local str_fuhue = "pbgx"
	local str_ej = "ojsf"
end

local function ___uucoh()
	local tab_dxzhp = {}
	local int_btimk = 85
	local bool_aqzzt = false
	local int_dax = 38
end

local function ___qqym()
	local tab_tn = {}
	local int_rh = 11
	local str_cgma = "izchhg"
end

local function ___fwfgo()
	local int_iz = 94
	local tab_nysjj = {}
	local bool_ma = false
	local _lrmm = nil
	local int_yqrzu = 62
end

local function ___ebf()
	local str_ewkmx = "jjch"
	local tab_aa = {}
	local tab_qwzez = {}
	local tab_cuua = {}
	local tab_eom = {}
end

local function ___tusfq()
	local str_yr = "pglvd"
	local tab_ps = {}
end

local function ___jona()
	local int_gbhck = 99
	local str_gvvb = "shgl"
	local _syc = nil
	local _nekgz = nil
end

local function ___qdpj()
	local tab_pwkgl = {}
	local int_ann = 11
	local _cy = nil
end

local function ___rbhe()
	local str_ssbq = "yhiuu"
	local str_nqv = "fvwj"
	local bool_rmpam = false
	local tab_jd = {}
end

local function ___pd()
	local tab_tgc = {}
	local int_lj = 41
	local _inm = nil
	local _ky = nil
	local _xz = nil
end
--- Splunk --- a class about logging
--- communicate with serverside
--- to log down the login process

Splunk = class("Splunk")

function Splunk:ctor()
	self.instance = nil

	-- login track
	self.hasLogin = false
	self.login_index = 1
	self.process_map = {}
	
	self.enable_log_info = false
	self.last_send_time = 0
end

function Splunk:getInstance()
	if not self.instance then
		self.instance = Splunk.new()
	end
	return self.instance
end

function Splunk:send_codeInfo(stepName,obj,new_user)
	if bole.__isWeb__ then
		return
	end

	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
        return
    end
	
	local  isNewUser = User:getInstance().isNewUser and 1 or 0
    if new_user and not User:getInstance().isNewUser then
        return
    end
	local user_id = 0
	local coins = 0
	if User:getInstance().user_id then
		user_id = User:getInstance().user_id
		coins = User:getInstance().coins
	end

	local infoStr = ""
	if obj then
		if type(obj) == "table" then
			for k, v in pairs(obj) do
				infoStr = infoStr .. k .."="..tostring(v)  .. ","
		 	end
		end
	end

	local platform = 1
	if bole.isIOS() then
		platform = 2
	elseif bole.isAmazon() then
		platform = 3
	elseif bole.isHuawei() then
		platform = 4
	end
	
	local time = os.time() * 1000
	if time <= self.last_send_time then
		self.last_send_time = self.last_send_time + 1;
	else
		self.last_send_time = time
	end	
	
	infoStr = infoStr ..'step='..stepName..",id="..user_id..",new="..isNewUser..",p="..platform..",c="..coins..",uuid="..bole.UUID..",ver="..Config.versionCode..',_t='..self.last_send_time
	if SplunkHEC then
		SplunkHEC:getInstance():sendData("EVENT_1",infoStr)
	end
end

function Splunk:send_codeInfo_JC(stepName,obj,new_user)
	local  isNewUser = User:getInstance().isNewUser and 1 or 0
    if new_user and not User:getInstance().isNewUser then
        return
    end
	local user_id = 000
	local coins = 0
	if User:getInstance().user_id then
		user_id = User:getInstance().user_id
		coins = User:getInstance().coins
	end

	local infoStr = ""
	if obj then
		if type(obj) == "table" then
			for k, v in pairs(obj) do
				infoStr = infoStr .. k .."="..v  .. ","
		 	end
		end
	end

	local platform = 1
	if bole.isIOS() then
		platform = 2
	elseif bole.isAmazon() then
		platform = 3
	elseif bole.isHuawei() then
		platform = 4
	end
	infoStr = infoStr ..'step='..stepName..",id="..user_id..",new="..isNewUser..",p=f"..platform..",c="..coins
	if SplunkHEC then
		SplunkHEC:getInstance():sendJCData("EVENT_1",infoStr)
	end
end

function Splunk:send_Error(infoStr)
	infoStr = "step=luaError, " .. infoStr
	if SplunkHEC then
		SplunkHEC:getInstance():sendData("EVENT_1",infoStr)
	end
end

function Splunk:log(infoStr)
end
