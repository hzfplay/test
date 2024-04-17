local ___int_bti = 79
local ___str_wbvu = "bqxm"
local ___str_dkcr = "ftb"
local ___tab_do = {}
local ___tab_uuwso = {}
local ___tab_rso = {}
local ____kx = nil
local ___str_drm = "msm"
local ___str_lc = "sod"
local ___int_vn = 15
local ___str_uq = "jyq"
local ____cxgp = nil
local ___str_yw = "bjla"
local ___int_ic = 98
local ___int_xvofo = 99
local ___tab_yvysz = {}
local ___tab_zd = {}
local ___tab_cyct = {}
local ____xjdz = nil
local ___tab_av = {}
local ___tab_attu = {}
local ___int_pihek = 99
local ____wbh = nil
local ____jctlw = nil

local function ___omjn()
	local bool_jfyfj = false
	local str_aokzn = "tbbio"
	local str_jmgdu = "whjhw"
end

local function ___kf()
	local _fu = nil
	local bool_xyf = false
end

local function ___sn()
	local int_qhu = 24
	local int_zkbd = 12
	local int_ou = 78
end

local function ___nu()
	local _wvz = nil
	local str_pyxd = "mghy"
	local int_ywb = 72
	local _ntp = nil
end

local function ___wjku()
	local int_awp = 50
	local bool_wtqls = false
	local bool_jeo = false
	local _vji = nil
end

local function ___bshn()
	local str_orziw = "jgobrw"
	local int_wx = 6
	local _zpp = nil
	local int_dep = 84
end

local function ___zhgeh()
	local _wrvyy = nil
	local bool_subm = false
	local bool_eecie = false
	local str_bp = "mtakf"
end

local function ___wtbc()
	local str_vnob = "qxxios"
	local str_scds = "wdca"
	local int_ncg = 28
end

local function ___wofn()
	local _pg = nil
	local str_jyxqs = "rgpefg"
	local bool_qi = false
	local tab_akrtg = {}
end

local function ___ityhu()
	local bool_zpau = false
	local bool_coww = false
	local bool_spb = false
	local str_kc = "vegxua"
end

local function ___mudnn()
	local _bsze = nil
	local _tx = nil
	local int_melcz = 80
	local bool_gexj = false
end

local function ___kgql()
	local _lxf = nil
	local bool_hdgzf = false
end

local function ___qwx()
	local tab_vyb = {}
	local int_djxa = 88
	local bool_foqs = false
	local tab_yyyn = {}
end

local function ___nsup()
	local tab_qsm = {}
	local tab_of = {}
	local tab_hb = {}
end

local function ___zvpqy()
	local tab_if = {}
	local bool_lww = false
	local str_fzd = "lwhlf"
end

local function ___ao()
	local str_hutx = "zzsyx"
	local str_damy = "bqs"
	local str_yam = "dtc"
	local tab_lcb = {}
	local tab_nq = {}
end

local function ___rrbaw()
	local int_mf = 83
	local bool_gnyop = false
	local _lt = nil
end

local function ___da()
	local str_bmy = "dpsiku"
	local str_napy = "sdsoj"
	local bool_kmgq = false
	local str_xm = "psf"
end

local function ___coqo()
	local _keoef = nil
	local _yyx = nil
end

local function ___cfad()
	local _dt = nil
	local str_ycsx = "fwqy"
	local tab_fai = {}
	local int_viz = 74
	local str_lrvq = "qupv"
end

local function ___vwpj()
	local _hd = nil
	local _dy = nil
	local str_rnobo = "goz"
	local int_wrbfc = 32
end

local function ___af()
	local _rubso = nil
	local _mbp = nil
	local _ss = nil
	local _bn = nil
end

local function ___kiu()
	local bool_rvs = false
	local tab_nx = {}
	local tab_wozt = {}
	local int_bqhgv = 77
end

local function ___wcpn()
	local tab_yy = {}
	local tab_qg = {}
	local tab_iebwo = {}
	local tab_jws = {}
	local int_ntof = 35
end

local function ___bkdx()
	local int_tippt = 2
	local bool_hgu = false
	local int_ivyae = 87
	local _kdjew = nil
	local str_osuse = "mrd"
end
local BLNode      = require("UI/CreatorUI/BLNode")

local getSpinePath = function(name)
	return string.format("theme_desktop/theme%d/lobby/%s/", THEME_DESKTOP_ID, name)
end
local Coin_Node = class("Coin_Node", BLNode)

function Coin_Node:ctor(isPortrait)
    self.isPortrait  = bole.isThemeScene()
    self.start_scale = 0.95
    self.width       = 179
    self.nPos        = self.isPortrait and cc.p(-121, -38) or cc.p(-94.317, 9)
    self.csb         = "ui/header_footer/coin_node"
    self.node        = CreatorUITools:getInstance():createUi(self.csb);
    self:addChild(self.node)
    self:loadControls()
end

function Coin_Node:loadControls()
    self.root = self.node.root

    self.coin_node = self.root
    self.coin_node:setPosition(self.nPos)

    self.sp_coin   = self.root.sp_coin

    self.label_coins = self.root.label_coins

    local tongyongDi = self.root.kuang_3
    local coin_bg = self.root.coin_bg

    if  self.isPortrait then
        tongyongDi:setVisible(true)
        coin_bg:setVisible(false)
        local file = getSpinePath("fonts2") .. "tip_num.fnt"
        self.label_coins:setFntFile(file)
    else
        tongyongDi:setVisible(false)
        coin_bg:setVisible(true)
        local file = getSpinePath("fonts") .. "tip_num.fnt"
        self.label_coins:setFntFile(file)
    end
    


    local coin = User:getInstance():getCoins()
    self.label_coins:setString(FONTS.format(coin, true))

    inherit(self.label_coins, LabelNumRoll)
    local parserFunc = function (n)
        return FONTS.format(n, true)
    end
    self.label_coins:nrInit(coin, 25, parserFunc)
end


return Coin_Node