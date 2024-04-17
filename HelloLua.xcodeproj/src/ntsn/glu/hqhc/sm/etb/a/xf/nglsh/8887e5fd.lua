local ___str_foag = "ahkfon"
local ___int_ogdxt = 55
local ___tab_exsx = {}
local ___str_jqg = "nlotm"
local ___int_ha = 33
local ___int_dgfiy = 28
local ___bool_aev = false
local ___tab_lprmu = {}
local ___bool_vafw = false
local ____ardg = nil
local ___tab_zpv = {}
local ___bool_zwr = false

local function ___iiki()
	local tab_lrr = {}
	local str_td = "nhanfk"
	local str_lh = "adlh"
	local tab_bk = {}
end

local function ___zhkjo()
	local str_xsiif = "ioifct"
	local str_mha = "vnlhq"
end

local function ___dm()
	local _nt = nil
	local bool_ts = false
end

local function ___xhnkh()
	local _kdufa = nil
	local int_oyvdl = 60
	local tab_fxhi = {}
end

local function ___waqau()
	local str_nl = "hsfec"
	local tab_afkm = {}
	local str_xdw = "yef"
	local int_vveun = 60
	local bool_rs = false
end

local function ___tvoy()
	local int_aai = 7
	local str_cppg = "badhvf"
end

local function ___af()
	local _djj = nil
	local str_qcwnj = "wyy"
end

local function ___geaxo()
	local tab_xcsn = {}
	local int_httph = 33
	local str_gk = "lxauq"
	local tab_tmjs = {}
end

local function ___zcdc()
	local _ixwjf = nil
	local tab_hy = {}
	local tab_fgy = {}
end

local function ___vq()
	local tab_sa = {}
	local _zlmmu = nil
end

local function ___lcm()
	local int_nblyt = 96
	local tab_ivma = {}
	local bool_wsddz = false
	local tab_qxoy = {}
	local str_tvtxe = "koeo"
end

local function ___ioj()
	local bool_xcd = false
	local bool_nhidd = false
end

local function ___ex()
	local str_oggx = "lejcsh"
	local int_jtabt = 43
	local bool_sxqn = false
end

local function ___tb()
	local bool_tun = false
	local tab_fw = {}
end

local function ___ayr()
	local tab_jdd = {}
	local tab_yoz = {}
	local int_pp = 63
end

local function ___erzt()
	local str_gpui = "emnqiq"
	local _mrrp = nil
	local str_rzf = "ekbfvw"
	local str_nuxd = "wvbr"
	local bool_xbgzg = false
end

local function ___tsdsm()
	local tab_go = {}
	local bool_jql = false
	local _pn = nil
	local int_hqq = 24
end

local function ___xmhu()
	local bool_ruolj = false
	local int_bkpa = 86
end

local function ___vpfy()
	local tab_pw = {}
	local int_ca = 32
	local tab_aut = {}
	local int_nxunz = 70
	local tab_xpzt = {}
end

local function ___dlxtf()
	local str_rzhuq = "qsbbb"
	local bool_ydv = false
end

local function ___oue()
	local bool_qahw = false
	local int_pedz = 86
	local tab_al = {}
	local _vspz = nil
	local int_aqtd = 54
end

local function ___oav()
	local _zuk = nil
	local bool_ds = false
	local bool_lcv = false
	local int_nbc = 57
end

local function ___yh()
	local int_pws = 16
	local int_osbo = 66
	local bool_uqkdq = false
	local bool_wkp = false
	local tab_cnxe = {}
end

local function ___ne()
	local _kdlw = nil
	local _rnqs = nil
	local str_rvg = "fzky"
	local int_wjq = 58
	local str_npret = "wgtjy"
end

local function ___its()
	local tab_guhsq = {}
	local int_mqrv = 85
	local _tipf = nil
	local _ktea = nil
	local tab_ht = {}
end

local function ___mps()
	local _fqbbl = nil
	local _tbg = nil
	local str_aj = "qwd"
end

local function ___jnv()
	local _uso = nil
	local _wgxh = nil
	local str_le = "nnseu"
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLScrollView = class("BLScrollView", function() return ccui.ScrollView:create() end)


function BLScrollView:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLScrollView:create( ... )
    return self.new(... )
end

function BLScrollView:_ScriptHandler( evt, param )
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

function BLScrollView:onEnter( ... )
    
end

function BLScrollView:update(...)
    self.__controllerMix:update( ... )
end

function BLScrollView:onExit( ... )
    
end

function BLScrollView:onExitTransitionDidStart( ... )
    -- body
end

function BLScrollView:onEnterTransitionDidFinish( ... )
    -- body
end

function BLScrollView:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLScrollView:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end

function BLScrollView:stopUpdate()
    self:unscheduleUpdate()
end


function BLScrollView:onCleanup()
    self:removeAllController()
end

return BLScrollView