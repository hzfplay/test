local ___bool_tri = false
local ____xo = nil
local ___bool_jmoj = false
local ___tab_edj = {}
local ___tab_tbgk = {}
local ____vm = nil
local ____dt = nil
local ___int_ivwtj = 38
local ___int_loole = 72
local ____rgme = nil
local ___bool_fdi = false
local ___bool_aeo = false
local ___bool_yj = false
local ____jdbq = nil
local ___int_kmc = 41
local ___bool_bfne = false
local ____vo = nil
local ___tab_gdf = {}
local ___int_jne = 68
local ___str_gx = "zsjoy"
local ___tab_cyr = {}
local ___str_cijfb = "cxx"
local ___tab_byfa = {}
local ___str_qjv = "dtbmsg"
local ___bool_zdy = false
local ___tab_ykn = {}

local function ___noj()
	local str_ixxrf = "tuhejt"
	local tab_gd = {}
end

local function ___ezoh()
	local _bhwy = nil
	local tab_lbwka = {}
	local tab_yv = {}
end

local function ___tfcxr()
	local int_uejq = 49
	local bool_hait = false
	local _lq = nil
	local str_nos = "qnkrpl"
	local bool_wlfm = false
end

local function ___xcgf()
	local tab_zt = {}
	local tab_oyn = {}
	local tab_mz = {}
end

local function ___ho()
	local _xyga = nil
	local str_fkvo = "jmkwr"
	local _bddwv = nil
end

local function ___pbepw()
	local int_lcu = 21
	local bool_huimb = false
	local str_cgds = "oxrwkb"
	local int_ogpu = 57
end

local function ___pjsj()
	local bool_tq = false
	local bool_mxp = false
end

local function ___xsv()
	local int_zn = 67
	local bool_uirva = false
	local str_cjwvg = "yph"
end

local function ___lviq()
	local _ligrz = nil
	local bool_zzb = false
	local tab_ftwz = {}
	local bool_pd = false
	local tab_ob = {}
end

local function ___msprs()
	local bool_robqh = false
	local tab_dvjcb = {}
end

local function ___fo()
	local int_jxhkd = 72
	local int_vtrpy = 41
	local int_vo = 4
end

local function ___fdxj()
	local tab_cntij = {}
	local int_yufei = 55
end

local function ___ajmto()
	local bool_inase = false
	local _rg = nil
end

local function ___ysfp()
	local bool_om = false
	local tab_xjw = {}
	local tab_ret = {}
	local _iivh = nil
	local tab_djgf = {}
end

local function ___spr()
	local str_kfwyc = "jwkp"
	local _iwq = nil
	local _om = nil
	local int_ie = 38
	local int_wfwwx = 33
end

local function ___svhkf()
	local _io = nil
	local _vxuwk = nil
	local str_fopli = "clm"
	local _bsq = nil
end

local function ___ez()
	local _hnp = nil
	local str_rnufl = "hbazt"
	local str_bw = "tne"
end

local function ___mq()
	local int_el = 54
	local int_kq = 20
	local tab_vndwt = {}
	local tab_lyoep = {}
end

local function ___gvn()
	local str_oxh = "zde"
	local tab_smsxx = {}
	local str_xoarr = "nqsqnu"
end

local function ___tvaed()
	local int_igw = 14
	local bool_cgaec = false
end

local function ___mwlh()
	local str_xxffo = "lbqobo"
	local int_cbiu = 60
end

local function ___bapvd()
	local int_iis = 77
	local bool_hsy = false
end

local function ___wv()
	local tab_ppdl = {}
	local str_cojgh = "qrfn"
	local tab_hhnp = {}
	local str_vp = "sbrl"
	local bool_bk = false
end

local function ___hkbs()
	local int_cb = 20
	local tab_ektv = {}
end

local function ___zafnn()
	local _mfk = nil
	local bool_vdq = false
	local bool_jb = false
	local _jg = nil
end

local function ___cwkyl()
	local tab_wbw = {}
	local int_gtvv = 7
	local str_ez = "ittt"
	local _ybo = nil
end

local function ___hv()
	local _ef = nil
	local str_rnumx = "hnliqk"
	local str_enr = "rqxctt"
	local bool_os = false
end
local CreatorUtils = class("CreatorUtils")

local _ctrlMark = "#"
function CreatorUtils.__getItem( parent, name )
    if string.sub(name,1,1)==_ctrlMark then
        name = string.sub( name, 2, string.len(name) )
        if parent.getController then
            local c = parent:getController( name )
            return c
        else
            print( "getController not found : " .. name )
            return nil
        end
    else
        return parent[ name ]
    end
end

function CreatorUtils.__getItemByPathList(root, pathList, errorOutput)
    local _root = root
    local _rRoot
    for _idx, name in ipairs(pathList) do
        _rRoot = CreatorUtils.__getItem(_root, name)
        if _rRoot == nil then
            return nil
        end
        _root = _rRoot
    end

    return _root
end

function CreatorUtils.getItemByPath(root, path, errorOutput)
    local pathList = string.split(path, ".")
    return CreatorUtils.__getItemByPathList(root, pathList, errorOutput)
end

return CreatorUtils
