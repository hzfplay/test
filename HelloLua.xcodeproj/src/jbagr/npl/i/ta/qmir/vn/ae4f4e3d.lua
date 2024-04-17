local ___int_tzdf = 60
local ____xkts = nil
local ___tab_ot = {}
local ____ajch = nil
local ___tab_cophj = {}
local ___str_ns = "ktas"
local ___str_umnet = "czxvx"
local ___str_xapl = "cpvcj"
local ___tab_hu = {}
local ____mlhgk = nil
local ___int_ujakk = 6
local ___tab_narv = {}
local ___bool_tbjm = false
local ___bool_hqo = false
local ___bool_ngfy = false
local ___int_kti = 32
local ___tab_lspnc = {}

local function ___yhwoi()
	local int_ktoaq = 48
	local tab_eqld = {}
	local int_xhsxg = 19
	local tab_nr = {}
end

local function ___bqpt()
	local bool_iecfk = false
	local tab_vsq = {}
	local tab_tdza = {}
	local tab_wg = {}
end

local function ___di()
	local tab_mnrf = {}
	local str_uuby = "eaprk"
end

local function ___uxz()
	local bool_qm = false
	local str_mqlln = "oqh"
end

local function ___nh()
	local tab_nm = {}
	local _gndx = nil
end

local function ___pm()
	local _xgm = nil
	local int_bx = 89
	local str_jybtr = "udod"
	local _ec = nil
	local int_azu = 86
end

local function ___uox()
	local _hak = nil
	local tab_tv = {}
	local int_rc = 6
	local _ezywo = nil
end

local function ___ixa()
	local tab_kp = {}
	local int_gir = 29
end

local function ___ju()
	local _are = nil
	local bool_kuu = false
	local int_cfzw = 86
end

local function ___ax()
	local _mzzz = nil
	local _gpq = nil
end

local function ___cvd()
	local bool_eq = false
	local bool_zt = false
	local int_jfn = 90
	local _cvhvq = nil
end

local function ___kdl()
	local tab_zwpz = {}
	local _xbsv = nil
	local bool_bpeob = false
end

local luaj = {}

local callJavaStaticMethod = LuaJavaBridge.callStaticMethod

local function checkArguments(args, sig)
    if type(args) ~= "table" then args = {} end
    if sig then return args, sig end

    sig = {"("}
    for i, v in ipairs(args) do
        local t = type(v)
        if t == "number" then
            sig[#sig + 1] = "F"
        elseif t == "boolean" then
            sig[#sig + 1] = "Z"
        elseif t == "function" then
            sig[#sig + 1] = "I"
        else
            sig[#sig + 1] = "Ljava/lang/String;"
        end
    end
    sig[#sig + 1] = ")V"

    return args, table.concat(sig)
end

function luaj.callStaticMethod(className, methodName, args, sig)
    local args, sig = checkArguments(args, sig)
    --echoInfo("luaj.callStaticMethod(\"%s\",\n\t\"%s\",\n\targs,\n\t\"%s\"", className, methodName, sig)
    return callJavaStaticMethod(className, methodName, args, sig)
end

return luaj
