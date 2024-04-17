local ___bool_bfbrg = false
local ___tab_zmipm = {}
local ___str_tfpt = "vqqlqd"
local ___int_ozkv = 96
local ___bool_no = false
local ___int_bc = 55
local ___bool_xtvj = false
local ___int_xmo = 81
local ___tab_kzin = {}
local ___int_oi = 29
local ___str_ogeu = "svj"
local ___int_awdb = 96

local function ___ij()
	local str_vkd = "qncm"
	local tab_gj = {}
	local str_woek = "cvepc"
	local bool_rhz = false
end

local function ___la()
	local bool_ffo = false
	local str_snov = "zkpi"
	local str_qi = "ctu"
end

local function ___fwrd()
	local int_fx = 5
	local _jy = nil
	local tab_qd = {}
	local str_dmzrp = "csftjo"
end

local function ___yod()
	local bool_it = false
	local tab_saubj = {}
	local _rbuza = nil
end

local function ___ar()
	local _yoc = nil
	local tab_tmfvf = {}
	local int_bdcf = 67
	local bool_yc = false
end

local function ___xrqy()
	local int_xly = 13
	local tab_rpmni = {}
end

local function ___ut()
	local tab_udmc = {}
	local _gqn = nil
end

local function ___uvfin()
	local _kgjbr = nil
	local int_fn = 9
end

local function ___sr()
	local tab_zgi = {}
	local int_jkg = 86
	local _bmqnz = nil
	local int_cto = 41
	local _jtj = nil
end

local function ___knv()
	local int_rdzgt = 82
	local int_dfl = 83
	local _huqu = nil
	local bool_iqksm = false
	local tab_yp = {}
end

local function ___hk()
	local int_zzbu = 36
	local int_bwbv = 12
end

local function ___nlzwc()
	local str_fprb = "ajuf"
	local str_xatoe = "vuc"
	local _zkb = nil
	local int_rock = 65
	local str_fwm = "pgr"
end

local function ___vtv()
	local tab_hve = {}
	local tab_peen = {}
	local int_sqeqa = 68
end

local function ___wi()
	local bool_ntt = false
	local int_zegue = 21
end

local function ___dtu()
	local str_uroq = "vvt"
	local tab_dx = {}
	local str_bjrh = "jrj"
	local str_jnygk = "hfc"
	local _dmynf = nil
end

local function ___qdx()
	local str_qgwhc = "hnco"
	local tab_yle = {}
	local str_gocbn = "cgqau"
end

local function ___wn()
	local _nzyl = nil
	local int_ymsi = 4
end

local function ___sos()
	local _jouo = nil
	local bool_xqz = false
	local _drjr = nil
	local tab_wb = {}
	local _xtwkr = nil
end

local function ___ddkri()
	local tab_trshe = {}
	local _mykz = nil
end

local function ___wjr()
	local int_poihr = 82
	local _rlnjp = nil
	local tab_uxx = {}
end

local function ___bsd()
	local _lbugu = nil
	local tab_js = {}
	local str_ka = "vxt"
	local bool_xfqk = false
end

local function ___cnook()
	local _rbv = nil
	local bool_xwbet = false
	local tab_mr = {}
	local int_qk = 25
	local tab_nst = {}
end

local function ___rfx()
	local bool_vtf = false
	local str_hde = "equlwb"
end

local function ___lelxu()
	local _drcr = nil
	local bool_fxqgs = false
	local bool_nx = false
	local str_uf = "zwp"
end

local function ___zhyvw()
	local str_un = "abovbg"
	local bool_ai = false
	local _cvw = nil
	local bool_pl = false
end

local function ___ckr()
	local str_zjg = "jezfsu"
	local int_yq = 89
	local _eiscs = nil
	local int_hs = 95
	local int_csebx = 59
end

local screenDesign = {}

screenDesign.orientation = {
    Landscape = 1,              --横屏
    vertical = 2                --竖屏
}

screenDesign.desktopId  = {
    [108] = screenDesign.orientation.Landscape,     --西欧
    [138] = screenDesign.orientation.Landscape,     --女牛仔
    [164] = screenDesign.orientation.Landscape,     --玛雅文明
    [174] = screenDesign.orientation.Landscape,     --吸血鬼
    [177] = screenDesign.orientation.Landscape,     --神龙
    [186] = screenDesign.orientation.vertical,      --竖版埃及
    [188] = screenDesign.orientation.Landscape,     --宙斯
    [192] = screenDesign.orientation.vertical,      --袋鼠
    [194] = screenDesign.orientation.vertical,      --太空
    [220] = screenDesign.orientation.vertical,      --太阳神
    [225] = screenDesign.orientation.vertical,      --竖版森林精灵
    [230] = screenDesign.orientation.vertical,      --黄金矿工
    [231] = screenDesign.orientation.Landscape,     --横版森林精灵
    [240] = screenDesign.orientation.Landscape, 
    [244] = screenDesign.orientation.Landscape,     --犀牛
    [325] = screenDesign.orientation.Landscape,
}

screenDesign.getDesignResolution = function ()
    local orientation = screenDesign.desktopId[THEME_DESKTOP_ID]

    local size = {}
    if orientation == screenDesign.orientation.Landscape then    --横屏
        size.width = 1280
        size.height = 720
        size.orientation = screenDesign.orientation.Landscape
    else                                                         --竖屏
        size.width = 720
        size.height = 1280
        size.orientation = screenDesign.orientation.vertical
    end
    return size
end 

return screenDesign
