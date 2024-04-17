local ____gnb = nil
local ____tlf = nil
local ___str_vd = "vjgrk"
local ___str_uf = "bdrk"
local ___bool_tjlzm = false
local ____sfrz = nil
local ___int_xrkb = 49
local ___bool_jojdu = false
local ____mxuei = nil
local ____jio = nil
local ___int_lrta = 79
local ___str_oqs = "bozqg"
local ___int_weazf = 20
local ___bool_irqsz = false
local ___int_prrw = 65
local ___str_egp = "aamb"
local ____swb = nil
local ___int_frre = 61
local ___bool_ki = false

local function ___xaay()
	local str_cae = "hxhwgw"
	local str_eh = "xsq"
	local tab_hamj = {}
end

local function ___dtsch()
	local int_rae = 29
	local str_suvb = "mbeg"
end

local function ___nmtej()
	local str_cdel = "fraotn"
	local _okonv = nil
end

local function ___sv()
	local bool_zxf = false
	local tab_cwd = {}
	local str_fwxm = "hdgj"
end

local function ___xsrv()
	local tab_aihgm = {}
	local tab_slz = {}
	local str_dxvi = "iixodd"
	local str_xlnzx = "fmqkcd"
	local str_ql = "fjyfas"
end

local function ___xhyl()
	local int_dc = 54
	local _wc = nil
	local bool_nsemi = false
	local str_yo = "ghri"
	local bool_xzx = false
end

local function ___ev()
	local int_hrwdy = 54
	local bool_tees = false
	local int_sadu = 68
end

local function ___lpmny()
	local str_tc = "mxeddy"
	local int_rovvr = 87
	local str_met = "xwzd"
end

local function ___uqhfz()
	local tab_ql = {}
	local tab_duizh = {}
	local str_cqgb = "bcfw"
end

local function ___nh()
	local _eke = nil
	local bool_lkud = false
end

local function ___yj()
	local str_yn = "dov"
	local tab_ww = {}
	local bool_euk = false
	local _gsppp = nil
end

local function ___zu()
	local _jde = nil
	local tab_ycgyk = {}
	local int_hsxm = 31
	local _ew = nil
end

local function ___awq()
	local _www = nil
	local bool_gjvak = false
	local int_mtc = 34
end

local function ___mmhet()
	local tab_uouxd = {}
	local int_st = 39
end

local function ___fny()
	local int_tisx = 23
	local str_zi = "zgtwi"
	local tab_ca = {}
	local _uvlv = nil
end

local function ___to()
	local bool_mk = false
	local _zpix = nil
	local tab_plukk = {}
	local int_qa = 14
	local int_vipe = 48
end

local function ___oia()
	local str_gxyq = "ayp"
	local tab_hv = {}
end

local function ___bl()
	local int_digj = 49
	local bool_wr = false
	local int_rfom = 62
	local int_tt = 9
	local tab_gyxj = {}
end

local function ___pa()
	local tab_nw = {}
	local tab_kwyi = {}
end

local function ___xdka()
	local bool_wt = false
	local _asgs = nil
end

local function ___fhago()
	local _jopa = nil
	local str_cnbco = "tdg"
	local bool_ebvx = false
end

local function ___ehc()
	local int_sf = 61
	local tab_wl = {}
end

local function ___fzo()
	local str_udwrl = "bfx"
	local _ow = nil
end

local luaoc = {}

local callStaticMethod = LuaObjcBridge.callStaticMethod

function luaoc.callStaticMethod(className, methodName, args)
    local ok, ret = callStaticMethod(className, methodName, args)
    if not ok then
        local msg = string.format("luaoc.callStaticMethod(\"%s\", \"%s\", \"%s\") - error: [%s] ",
                className, methodName, tostring(args), tostring(ret))
        if ret == -1 then
            print(msg .. "INVALID PARAMETERS")
        elseif ret == -2 then
            print(msg .. "CLASS NOT FOUND")
        elseif ret == -3 then
            print(msg .. "METHOD NOT FOUND")
        elseif ret == -4 then
            print(msg .. "EXCEPTION OCCURRED")
        elseif ret == -5 then
            print(msg .. "INVALID METHOD SIGNATURE")
        else
            print(msg .. "UNKNOWN")
        end
    end
    return ok, ret
end

return luaoc
