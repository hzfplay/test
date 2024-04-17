local ___bool_nlckn = false
local ___bool_srn = false
local ___tab_cyru = {}
local ___bool_rnzf = false
local ____yjbad = nil
local ___tab_nmar = {}
local ___int_dfuc = 55
local ____rfbkh = nil
local ____xa = nil
local ___int_rgch = 93
local ___str_adfh = "zdn"
local ____fdhy = nil
local ___tab_tut = {}
local ___bool_sy = false
local ___bool_faehy = false
local ___tab_wvvfm = {}
local ___bool_gynb = false
local ___str_zpdwf = "prwg"
local ____lzjh = nil
local ____mg = nil
local ____utarp = nil
local ___bool_hhm = false
local ____jtds = nil
local ___int_bzdsr = 74
local ___str_aiwwa = "ibgepe"
local ____hxif = nil
local ___str_rqln = "mbmu"
local ___str_acw = "plwtr"
local ___int_ep = 80
local ___bool_vabh = false

local function ___fcwz()
	local _pvn = nil
	local tab_peyvr = {}
	local bool_kmfw = false
	local str_xlglu = "hnbme"
end

local function ___tkoef()
	local tab_ebq = {}
	local _yrd = nil
	local tab_ijr = {}
	local tab_pp = {}
	local bool_ftxns = false
end

local function ___zw()
	local bool_jnojg = false
	local _tqqi = nil
end

local function ___hofwb()
	local _ot = nil
	local _rvftd = nil
	local tab_eiogh = {}
end

local function ___olu()
	local str_vye = "oza"
	local tab_ou = {}
	local bool_iv = false
	local int_uio = 76
	local _odyzl = nil
end

local function ___qstfn()
	local tab_nhbya = {}
	local _gusbv = nil
	local str_rgb = "acq"
	local _qha = nil
end

local function ___an()
	local str_tb = "cxtszx"
	local int_wf = 2
	local bool_zu = false
end

local function ___fzsvr()
	local bool_cyd = false
	local _ib = nil
	local int_oo = 80
	local _pb = nil
	local int_djrdg = 11
end

local function ___cxh()
	local bool_jf = false
	local _cotdh = nil
end

local function ___tida()
	local _ebsbo = nil
	local int_dxfy = 76
	local tab_fhqq = {}
	local _bbsm = nil
end

local function ___qjd()
	local int_iy = 71
	local int_okdle = 27
	local int_in = 19
end

local function ___tawqa()
	local _ypl = nil
	local str_cv = "crxtk"
	local tab_tbjeu = {}
end

local function ___jdqkx()
	local int_hcrxq = 33
	local int_rbelc = 61
	local _yitid = nil
	local _lwdt = nil
	local tab_rgm = {}
end

local function ___avhtq()
	local bool_iijh = false
	local int_fqdzu = 52
	local bool_roxt = false
	local str_zc = "okeukq"
end

local function ___arapp()
	local tab_spj = {}
	local bool_asxgu = false
end

local function ___dvym()
	local str_mos = "xgwaky"
	local str_lkkk = "gdjr"
	local _ayp = nil
	local int_jaa = 72
	local _rw = nil
end

local function ___yzmn()
	local bool_eptb = false
	local str_qpcds = "pigx"
	local _fzza = nil
end

local function ___lse()
	local tab_gwbn = {}
	local str_gemj = "ucwc"
	local _dvz = nil
	local bool_kb = false
end

local function ___klgo()
	local int_cat = 70
	local bool_lak = false
end

local function ___dkruy()
	local tab_pob = {}
	local tab_nx = {}
	local _brwrf = nil
	local int_bckd = 46
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLClipNode = class("BLClipNode", function(type, ...) 
    if type == 1 then 
        return cc.Label:createWithBMFont(...)
    elseif type == 0 then
        return cc.Label:createWithSystemFont(...)
    else
        return cc.Label:createWithTTF(...)
    end
end)

function BLClipNode:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLClipNode:create( ... )
    return self.new(... )
end

function BLClipNode:_ScriptHandler( evt, param )
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

function BLClipNode:onEnter( ... )
    
end

function BLClipNode:update(...)
    self.__controllerMix:update( ... )

end

function BLClipNode:onExit( ... )
    
end

function BLClipNode:onExitTransitionDidStart( ... )
    -- body
end

function BLClipNode:onEnterTransitionDidFinish( ... )
    -- body
end

function BLClipNode:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLClipNode:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end

function BLClipNode:stopUpdate()
    self:unscheduleUpdate()
end


function BLClipNode:onCleanup()
    self:removeAllController()
end

return BLClipNode