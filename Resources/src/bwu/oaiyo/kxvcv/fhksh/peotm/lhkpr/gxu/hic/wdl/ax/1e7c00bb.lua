local ___int_gob = 95
local ___bool_ygxw = false
local ___str_izja = "ljpuhu"
local ___tab_ui = {}
local ___int_sylf = 40
local ___bool_gw = false
local ____yt = nil
local ___tab_zh = {}
local ___int_gecc = 84
local ___tab_psw = {}

local function ___wnnnj()
	local int_qlo = 75
	local tab_jwz = {}
	local str_wj = "pnj"
	local tab_tlre = {}
end

local function ___fyck()
	local bool_cl = false
	local _wf = nil
	local str_unopo = "uysyip"
	local str_ip = "bjpd"
	local bool_suvuh = false
end

local function ___hgygg()
	local bool_avuy = false
	local int_tyq = 42
	local int_rtra = 10
end

local function ___ceabo()
	local _cufj = nil
	local bool_ipo = false
	local str_jiy = "avx"
	local tab_sxl = {}
end

local function ___ww()
	local tab_ss = {}
	local str_pigcj = "oajue"
	local bool_eyvvz = false
	local tab_eicz = {}
end

local function ___iwaak()
	local str_fbqmj = "zvnx"
	local str_nnvcv = "pyhs"
end

local function ___wccpt()
	local str_qa = "hpnz"
	local tab_gmdtl = {}
	local tab_dnvhj = {}
	local str_bd = "bjql"
end

local function ___np()
	local str_howg = "oqtfaf"
	local bool_ss = false
end

local function ___afx()
	local tab_wb = {}
	local str_la = "xvkqwv"
	local _elqe = nil
end

local function ___lf()
	local int_jjej = 37
	local int_ozyc = 59
end

local function ___xgu()
	local tab_bbynq = {}
	local int_xlf = 9
	local int_djiy = 69
	local int_bzbpw = 25
end

local function ___qqjg()
	local bool_no = false
	local int_quo = 39
end

local function ___ug()
	local _ouedr = nil
	local int_xbr = 55
	local int_imu = 82
	local bool_uxp = false
end

local function ___tpdsc()
	local tab_nwbqb = {}
	local str_poldr = "lansd"
	local tab_wit = {}
	local str_zlkhh = "jff"
	local int_je = 62
end

local function ___ik()
	local str_colk = "btapf"
	local int_tu = 41
	local int_kawpi = 5
	local _wx = nil
	local str_xcdg = "focrv"
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLLayout = class("BLLayout", function(type, ...) return ccui.Layout:create(); end)

function BLLayout:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLLayout:create( ... )
    return self.new(... )
end

function BLLayout:_ScriptHandler( evt, param )
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

function BLLayout:onEnter( ... )
    
end

function BLLayout:update(...)
    self.__controllerMix:update( ... )

end

function BLLayout:onExit( ... )
    
end

function BLLayout:onExitTransitionDidStart( ... )
    -- body
end

function BLLayout:onEnterTransitionDidFinish( ... )
    -- body
end

function BLLayout:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLLayout:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end

function BLLayout:stopUpdate()
    self:unscheduleUpdate()
end


function BLLayout:onCleanup()
    self:removeAllController()
end

return BLLayout