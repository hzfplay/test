local ___bool_qh = false
local ___str_uk = "fypeo"
local ____wyop = nil
local ___int_ysn = 15
local ___str_mkb = "ubwvje"
local ___tab_swyn = {}
local ___tab_ckq = {}
local ___bool_cl = false
local ___int_ops = 40
local ____pvut = nil
local ____yyxw = nil
local ___str_yu = "ehwl"
local ___bool_lakd = false
local ___bool_eum = false
local ____xhwtr = nil
local ____pqvd = nil

local function ___bsl()
	local bool_trqc = false
	local _vw = nil
end

local function ___tnl()
	local bool_njal = false
	local tab_wnpr = {}
	local bool_ttg = false
end

local function ___kzu()
	local tab_yxe = {}
	local int_gvw = 37
	local _dbr = nil
	local _vrln = nil
	local bool_ufcq = false
end

local function ___icz()
	local bool_qor = false
	local int_uxa = 98
	local tab_wzmg = {}
	local bool_lnm = false
end

local function ___tuuh()
	local str_fntsc = "ldpzb"
	local tab_prtc = {}
	local bool_uzvc = false
end

local function ___bohp()
	local bool_eexe = false
	local int_dfuk = 12
	local str_kat = "duxkem"
	local str_ek = "puu"
	local str_nh = "bjzbyk"
end

local function ___mu()
	local bool_oc = false
	local str_qhcsy = "ulhb"
	local bool_dpqbu = false
	local tab_ophpp = {}
end

local function ___rso()
	local str_wd = "asd"
	local bool_fibi = false
end

local function ___lq()
	local int_bgduw = 71
	local int_tdo = 64
	local tab_xkyo = {}
	local tab_ewdwj = {}
end

local function ___sc()
	local bool_texr = false
	local bool_phx = false
	local tab_ynx = {}
	local str_hwlcf = "sxpff"
	local str_ymce = "jzxup"
end

local function ___ds()
	local tab_vyn = {}
	local _tzoy = nil
end

local function ___thpy()
	local int_ntyy = 48
	local int_mp = 68
	local str_ee = "xmwbg"
end

local function ___qpt()
	local str_xne = "duru"
	local tab_jtli = {}
	local bool_tk = false
end

local function ___upn()
	local _igcw = nil
	local tab_uwzn = {}
	local tab_ja = {}
	local bool_pc = false
	local bool_ls = false
end

local MD5 =  require("Utils/md5")

HttpManager = class("HttpManager")

local Token = ""
local key = "===ZWPmB1apxoTfHQd4==="

function HttpManager:getInstance()
	if not self.instance then
		self.instance = HttpManager.new()
	end
	return self.instance
end

function HttpManager:sendRequest(data, url, callback)
	for k, v in pairs(data) do
		if data[k] == "" then
			data[k] = "def"
		end
	end

	local sendMsg = tool.base64_encode(json.encode(data)) 
	local encodeStr = string.format("%s_%s",sendMsg, key)
	local sign = MD5.sumhexa(encodeStr)
	Token = tool.base64_encode(sign)

	local xhr = cc.XMLHttpRequest:new()
	xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
	xhr:open("POST", url)
	xhr:setRequestHeader("Content-Type", "application/json")
	xhr:setRequestHeader("Authorization", Token)
	local function onStateChange()
		if xhr.readyState ~= 4 then
			return
		end

		if callback then
			callback(xhr)
		end
	end
	xhr:registerScriptHandler(onStateChange)

	local msg = self:generateRandomString(8) .. sendMsg
	xhr:send(msg)
end

function HttpManager:generateRandomString(length)
    local charset = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    local result = ""
    local charsetLength = string.len(charset)

    math.randomseed(os.time())  
    for i = 1, length do
        local randomIndex = math.random(1, charsetLength)
        local randomChar = string.sub(charset, randomIndex, randomIndex)
        result = result .. randomChar
    end

    return result
end

-- 打点
function HttpManager:doReport(key, callback)
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS or not IpConfig or IpConfig.url == "" then
		return
	end

	if not self.uuid then
		self.uuid = bole.getAndroidId()
	end

	if not self.pkg then
		self.pkg = bole.getAppPackageName()
	end

	if not self.pvc then
		self.pvc = bole.getVersionName()
	end

	local data = {
		type = "report",
		pkg  = self.pkg,
		aid  = self.uuid,
		key  = key,
		pvc = self.pvc,
		lan   = device.language or "unknown"
	}
    self:sendRequest(data, IpConfig.url, callback)
end
