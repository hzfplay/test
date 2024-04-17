local ___bool_rcop = false
local ____zk = nil
local ___str_ew = "albq"
local ___bool_daxmv = false
local ___bool_lr = false
local ___tab_tt = {}
local ____wfdkn = nil
local ___bool_kgh = false
local ___str_poub = "hgiuon"
local ___int_qmin = 40
local ___int_fwqdr = 95
local ____wzq = nil
local ____ep = nil
local ____dxdy = nil
local ____coieq = nil
local ___bool_plfwu = false
local ___bool_qze = false
local ___str_zo = "qqke"
local ___tab_keb = {}
local ____qy = nil
local ____hdfrm = nil
local ___bool_rwfi = false
local ___tab_smwz = {}
local ___str_xgqls = "oye"
local ___int_iz = 87
local ___str_nm = "xsxihd"
local ___bool_bcxx = false
local ___str_xo = "spdm"

local function ___fo()
	local tab_ewdna = {}
	local tab_efth = {}
	local _wtgrs = nil
	local int_duh = 87
	local int_bzj = 81
end

local function ___ynj()
	local _qujz = nil
	local bool_lr = false
	local int_hecaq = 64
end

local function ___mdgq()
	local int_xowzg = 5
	local int_oujw = 46
	local _oli = nil
	local str_zmbsu = "qjbef"
	local bool_bs = false
end

local function ___klsjl()
	local str_wmew = "eacwp"
	local tab_iavk = {}
	local _mhih = nil
	local tab_cai = {}
end

local function ___tgsi()
	local tab_cpbgn = {}
	local tab_epkre = {}
	local _mn = nil
	local str_ohn = "aux"
	local int_lsu = 63
end

local function ___zu()
	local tab_gxftq = {}
	local bool_df = false
	local str_rt = "zec"
	local tab_va = {}
end

local function ___gd()
	local str_jsce = "lvsp"
	local _hv = nil
	local int_azofm = 81
end

local function ___xe()
	local _lgm = nil
	local bool_hdv = false
	local bool_ln = false
	local int_uardn = 15
end

local function ___re()
	local _kplc = nil
	local int_ssf = 73
	local tab_jhigo = {}
	local bool_mi = false
	local tab_krf = {}
end

local function ___exsvi()
	local str_wk = "wipx"
	local _wqk = nil
	local str_nogik = "ykf"
	local tab_xdzb = {}
	local str_qpx = "fehy"
end

local function ___wl()
	local bool_vffpv = false
	local bool_hyou = false
	local int_aty = 64
	local bool_yn = false
	local _jdfgc = nil
end

local function ___dfmn()
	local int_rssqj = 38
	local int_spolm = 21
end

local function ___pjr()
	local int_oq = 94
	local _th = nil
	local bool_uubc = false
	local int_yuxxo = 12
end

local function ___dsd()
	local int_miyy = 53
	local int_uw = 4
	local tab_gayvs = {}
end

local function ___gg()
	local str_rz = "ektn"
	local bool_iw = false
	local bool_ewid = false
	local tab_agw = {}
	local str_rnm = "drx"
end

local function ___ieg()
	local str_tvnt = "haho"
	local _lesyb = nil
end

local function ___jgiaa()
	local int_dt = 43
	local bool_nz = false
	local bool_ch = false
end

local function ___rqin()
	local tab_oi = {}
	local bool_nih = false
end

local function ___su()
	local int_wg = 29
	local tab_geq = {}
end

local function ___vsnz()
	local _czfkj = nil
	local str_gl = "unmrx"
	local _lrnkr = nil
	local tab_tfl = {}
end

local function ___ulwkn()
	local _uy = nil
	local _qgqhi = nil
	local tab_iu = {}
end

local function ___qr()
	local bool_dw = false
	local bool_gy = false
	local tab_vo = {}
	local _ilq = nil
end

local function ___psjr()
	local tab_tnnj = {}
	local str_ngd = "linasv"
	local bool_giq = false
	local _hd = nil
end

local function ___ry()
	local int_kcmr = 46
	local tab_oftac = {}
	local _ds = nil
	local tab_qzvlz = {}
end

local function ___jgz()
	local tab_hefx = {}
	local tab_lg = {}
	local bool_xgbjp = false
	local int_sh = 49
end

local function ___ud()
	local _ihc = nil
	local str_awz = "eawtly"
	local tab_hlay = {}
	local _jwrz = nil
	local str_sbrz = "ooao"
end

local function ___sw()
	local tab_qtpki = {}
	local str_kw = "qtchxm"
	local str_dtwt = "xofc"
end

local function ___heu()
	local bool_we = false
	local int_sa = 32
	local _rkz = nil
end

local function ___blhem()
	local bool_vbkt = false
	local int_yfod = 25
end
if nil == cc.XMLHttpRequest then
    return
end
-- This is the DeprecatedNetworkClass

DeprecatedNetworkClass = {} or DeprecatedNetworkClass

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--WebSocket class will be Deprecated,begin
function DeprecatedNetworkClass.WebSocket()
    deprecatedTip("WebSocket","cc.WebSocket")
    return cc.WebSocket
end
_G["WebSocket"] = DeprecatedNetworkClass.WebSocket()
--WebSocket class will be Deprecated,end
