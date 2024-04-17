local ___bool_ixdpr = false
local ___int_tm = 58
local ___bool_xti = false
local ___int_qk = 65
local ___str_ymcxp = "okw"
local ___str_yjets = "wnyck"
local ____jdu = nil
local ___int_bky = 69
local ___int_duxm = 5
local ___tab_kp = {}
local ___tab_yl = {}
local ___bool_nic = false
local ___int_gixib = 31
local ___tab_juevu = {}
local ___tab_ji = {}

local function ___vdb()
	local int_pubpa = 18
	local tab_oxmik = {}
end

local function ___nrnl()
	local _ajdm = nil
	local int_aqupi = 25
	local _wx = nil
end

local function ___kh()
	local _upr = nil
	local tab_qpt = {}
	local bool_pr = false
end

local function ___wzi()
	local bool_tadj = false
	local tab_fg = {}
end

local function ___eeruw()
	local int_qwvs = 74
	local _qnhxo = nil
	local tab_mlkgl = {}
	local tab_omxc = {}
	local _rpdg = nil
end

local function ___qjz()
	local str_ucz = "gixfxa"
	local tab_sdapt = {}
	local bool_twgs = false
	local str_mf = "xss"
	local tab_kx = {}
end

local function ___dqkbt()
	local int_pi = 42
	local bool_usmj = false
end

local function ___vjmsr()
	local _swcm = nil
	local int_xrri = 97
	local int_zj = 6
	local _zv = nil
end

local function ___wbksi()
	local int_sqwdy = 8
	local bool_eyhfo = false
	local int_ahn = 8
end

local function ___aih()
	local str_cxs = "ldxmut"
	local bool_fj = false
	local str_kowi = "nlhlr"
	local _ofv = nil
	local tab_dmcm = {}
end

local function ___uuibl()
	local bool_ch = false
	local int_pvats = 77
	local _fxbq = nil
	local tab_szbsq = {}
end

local function ___euii()
	local str_nsn = "nnabyb"
	local tab_sn = {}
	local int_yvuz = 79
	local tab_velv = {}
end

local function ___mzz()
	local str_bcj = "xhhtvr"
	local _mv = nil
	local _jmhde = nil
	local int_zr = 97
end

local function ___esizp()
	local tab_jg = {}
	local bool_ips = false
	local _pmbm = nil
	local tab_tlh = {}
	local tab_wh = {}
end

local function ___hdyx()
	local _dcf = nil
	local _fwm = nil
end

local function ___xfwtf()
	local tab_jianl = {}
	local str_ixvvv = "rcwz"
	local int_purcc = 63
end

local function ___ogvig()
	local int_un = 19
	local tab_ioqap = {}
	local tab_ch = {}
	local bool_juw = false
	local bool_og = false
end

local function ___jde()
	local str_bk = "ogn"
	local int_iuwg = 50
end

local function ___rbvn()
	local _gaufj = nil
	local tab_jmo = {}
	local str_rxql = "jxupoc"
end
-- require "Common"
-- cclog
log = {}
log.d = function( ... )
    -- do return end
    if appDebugMode then
        log.i(...)
    end
end
log.i = function( ... )
    -- do return end
    local tv = "\n"
    local xn = 0
    local function tvlinet(xn)
        
        for i=1,xn do
            tv = tv.."\t"
        end
    end
    local function printTab(i,v)
        --print("print table",i, v)
        
        if type(v) == "table" then
            --if type(i)=="string" and string.sub(i,1,2) ~="__" then
            if i ~="__index" then
                tvlinet(xn)
                xn = xn + 1
                tv = tv..""..i..":Table="..tostring(v).."{\n"
                table.foreach(v,printTab)
                tvlinet(xn)
                tv = tv.."}\n"
                xn = xn - 1
            else
                tvlinet(xn)
                tv = tv..""..i..":Table{"..tostring(v).."}\n"
            end
        elseif type(v) == nil then
            tvlinet(xn)
            tv = tv..i..":nil\n"
        else
            tvlinet(xn)
            tv = tv..tostring(i)..":"..tostring(v).."\n" 
        end
    end
    local function dumpParam(tab)
        for i=1, #tab do  
            if tab[i] == nil then 
                tv = tv.."nil\t"
            elseif type(tab[i]) == "table" then 
                xn = xn + 1
                tv = tv.."table{\n"
                table.foreach(tab[i],printTab)
                tv = tv.."\t}\n"
            else
                tv = tv..tostring(tab[i]).."\n"
            end
        end
    end
    --print("cclog len",#{...})
    dumpParam({...})
    -- print(tv)
    release_print(tv)
    if writeLogToFile then
        writeLogToFile(tv)
    end
end

