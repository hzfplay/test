local ___str_lsfr = "ygkiw"
local ___int_cqc = 19
local ___str_ipp = "lyig"
local ___tab_xnptk = {}
local ____gnk = nil
local ___str_jemzd = "qeddtk"
local ___int_cjlk = 35
local ____mgou = nil
local ___bool_xcw = false
local ___str_sl = "hbtjj"
local ___str_ndev = "zes"
local ___int_fpjro = 99
local ____ilkua = nil
local ___tab_jinko = {}
local ___bool_du = false
local ___int_lzl = 28
local ___bool_efbu = false
local ___str_aggd = "gnsed"

local function ___yva()
	local tab_nup = {}
	local bool_czmxd = false
	local str_uiuqi = "lgky"
	local _mr = nil
end

local function ___md()
	local tab_zbutz = {}
	local int_kyulk = 59
end

local function ___xr()
	local tab_ev = {}
	local str_sueda = "axblih"
	local _owt = nil
	local _ow = nil
	local _elik = nil
end

local function ___lgo()
	local bool_euigg = false
	local tab_ucr = {}
end

local function ___hyo()
	local str_fefsx = "iekbg"
	local bool_lvw = false
	local int_pccg = 92
	local str_vmxi = "rpk"
	local int_zwc = 45
end

local function ___ne()
	local str_xzvv = "wpc"
	local bool_cr = false
	local tab_bpm = {}
	local str_nuehr = "abana"
	local int_ugd = 66
end

local function ___slhph()
	local int_lyoxf = 34
	local tab_yazkq = {}
	local bool_nr = false
	local int_pnrkb = 100
end

local function ___hcn()
	local _ymx = nil
	local bool_ravz = false
end

local function ___lzo()
	local str_zgolf = "jbohmk"
	local tab_ng = {}
	local int_luxof = 52
end

local function ___cvdpe()
	local tab_lvt = {}
	local _xb = nil
	local str_qvs = "jnt"
	local int_wxhku = 89
	local str_vfxi = "fwdhk"
end

local function ___azh()
	local tab_bci = {}
	local int_plopz = 84
	local int_wxyi = 8
	local bool_htl = false
end

local function ___zkva()
	local str_kr = "xqzog"
	local str_rk = "gqybgf"
	local tab_jxa = {}
	local int_gqek = 30
end

local function ___hgzvf()
	local bool_rm = false
	local str_dsasz = "jtbfhk"
	local str_xv = "ciw"
	local bool_wa = false
end

local function ___orl()
	local str_sjarq = "yyatzv"
	local tab_jmycf = {}
	local int_mj = 4
end

local function ___vayzp()
	local str_uuq = "hyse"
	local _oxpmj = nil
	local bool_xlndm = false
end

local function ___mimif()
	local _ugh = nil
	local bool_hh = false
	local int_xdb = 45
end

local function ___vact()
	local tab_qcoe = {}
	local str_ngio = "ftqzt"
	local int_tpxdb = 63
	local _gzdo = nil
	local _exig = nil
end

local function ___wczwh()
	local _qiej = nil
	local str_lh = "hjj"
end

local function ___ni()
	local bool_rh = false
	local bool_td = false
	local int_jwez = 86
	local str_httn = "elaay"
	local int_lwsw = 7
end

local function ___xkmh()
	local str_uazo = "ccwgz"
	local tab_mbu = {}
end

local function ___ryj()
	local int_yjxb = 70
	local int_yu = 29
	local bool_jwvza = false
	local bool_ay = false
end

local function ___tqeq()
	local bool_by = false
	local int_an = 9
	local int_mxup = 30
	local _bocqm = nil
	local tab_zy = {}
end

local function ___rfht()
	local tab_pzhea = {}
	local bool_mmw = false
	local _atbd = nil
end

local function ___uqep()
	local str_tfq = "zgcs"
	local _ph = nil
	local int_hsxw = 47
	local str_gmjxi = "jtwf"
	local tab_jmen = {}
end

local function ___jvmu()
	local _kmx = nil
	local tab_ps = {}
	local bool_epwul = false
	local str_jkvy = "syt"
	local str_co = "bwe"
end

local function ___mwz()
	local int_yqlkr = 67
	local str_pxd = "ojuk"
	local _lh = nil
	local tab_rnap = {}
end

local function ___wx()
	local bool_szer = false
	local str_sukr = "oclvd"
	local str_wh = "cwf"
	local int_chhgb = 77
	local _ta = nil
end

local function ___vnhq()
	local int_aiuhu = 24
	local int_fcb = 1
	local int_ql = 25
	local _xqrt = nil
	local int_cnov = 33
end

local function ___rklm()
	local tab_pp = {}
	local int_ikqrw = 88
	local bool_xd = false
	local bool_xryu = false
	local bool_kbp = false
end

local function ___dsx()
	local int_dbpl = 20
	local bool_jkdb = false
	local int_jpsuo = 22
	local _fdpl = nil
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLSprite = class("BLSprite", function() return cc.Sprite:create() end)


function BLSprite:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLSprite:create( ... )
    return self.new(... )
end

function BLSprite:_ScriptHandler( evt, param )
    if evt == "enter" then
        self:onEnter()

    elseif evt == "exit" then
        self:onExit()

    elseif evt == "cleanup" then
        self:onCleanup()

    elseif evt == "exitTransitionStart" then
        self:onExitTransitionDidStart()

    elseif evt == "enterTransitionFinish" then
        self:onEnterTransitionDidFinish()   
    end
end

function BLSprite:onEnter( ... )
    
end

function BLSprite:update(...)
    self.__controllerMix:update( ... )
end

function BLSprite:onExit( ... )
    
end

function BLSprite:onExitTransitionDidStart( ... )
    -- body
end

function BLSprite:onEnterTransitionDidFinish( ... )
    -- body
end

function BLSprite:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLSprite:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end

function BLSprite:stopUpdate()
    self:unscheduleUpdate()
end


function BLSprite:onCleanup()
    self:removeAllController()
end

return BLSprite
