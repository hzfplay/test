local ___bool_jwimc = false
local ___str_xhhb = "fhumrv"
local ___int_xdaf = 70
local ____ukd = nil
local ___tab_gqqwy = {}
local ___int_ou = 26
local ___int_jjl = 59
local ___str_ts = "hermgq"
local ___bool_zty = false
local ___str_zx = "bjpphn"

local function ___muysi()
	local _krr = nil
	local tab_ttokp = {}
	local bool_dil = false
	local _crw = nil
end

local function ___npw()
	local tab_hx = {}
	local int_hympn = 76
	local _go = nil
	local _frkw = nil
	local int_hzv = 29
end

local function ___beau()
	local int_onzt = 32
	local tab_vat = {}
	local str_kiv = "dyi"
	local int_kgb = 53
	local _iaw = nil
end

local function ___lte()
	local bool_dybcf = false
	local int_xdx = 16
end

local function ___txgg()
	local int_qhlc = 8
	local _zt = nil
	local bool_ro = false
	local tab_kimc = {}
	local _ica = nil
end

local function ___xcxbz()
	local _isc = nil
	local int_qn = 95
end

local function ___bdmfc()
	local int_kcz = 70
	local bool_mbqe = false
	local bool_es = false
	local tab_amjil = {}
	local str_uyout = "edbq"
end

local function ___jdgn()
	local int_uuf = 69
	local int_sl = 40
end

local function ___pty()
	local int_djdi = 51
	local int_qjwq = 60
	local int_gcj = 33
	local tab_pbhx = {}
	local _tidqu = nil
end

local function ___seqpl()
	local int_nie = 69
	local int_tnspp = 70
end

local function ___fufjd()
	local str_lnjmy = "xtlw"
	local tab_wucr = {}
	local int_tgjwl = 85
	local _tec = nil
end

local function ___xgv()
	local _vn = nil
	local str_wpms = "euyz"
	local bool_xawk = false
	local str_fokc = "axwds"
end

local function ___omsot()
	local int_ad = 14
	local bool_dyex = false
	local str_vi = "gcx"
	local int_iozhn = 45
end

local function ___bmx()
	local _enl = nil
	local tab_ywssf = {}
end

local function ___lrj()
	local str_vyif = "jwpedz"
	local tab_htkc = {}
	local str_uhen = "oggygt"
	local str_qvpe = "jwjirp"
	local int_xxdkl = 60
end

local function ___wrena()
	local tab_ln = {}
	local tab_qscm = {}
end

local function ___ggacz()
	local bool_yygp = false
	local int_itw = 70
end

local function ___vsb()
	local int_cmw = 64
	local tab_tcga = {}
	local int_ncxc = 98
	local bool_ulx = false
end

local function ___xyf()
	local tab_ifza = {}
	local str_hrd = "cpc"
	local int_gu = 93
	local _vsm = nil
end

local function ___on()
	local bool_wyfe = false
	local str_drekc = "fxjc"
end

local function ___fqdar()
	local tab_bs = {}
	local _nn = nil
	local tab_up = {}
end

local function ___kph()
	local str_jnqml = "nwoj"
	local int_jh = 33
	local bool_kyzff = false
	local int_fcwn = 99
end

local function ___wzzn()
	local tab_vgjq = {}
	local tab_jx = {}
	local str_kq = "uzz"
	local str_eydfn = "dkuwqb"
end

local function ___il()
	local tab_ku = {}
	local int_gnbf = 40
	local tab_ot = {}
	local _btilo = nil
	local _rs = nil
end

local function ___jqmr()
	local str_ub = "hel"
	local _iuikt = nil
	local _foluw = nil
end

local function ___ew()
	local int_juh = 75
	local bool_om = false
	local _goq = nil
	local int_njlg = 38
	local int_jd = 44
end

local function ___nnhex()
	local tab_mkjve = {}
	local _hy = nil
	local int_afm = 26
end

local function ___ogct()
	local tab_wn = {}
	local str_rfl = "xwjhn"
end

local function ___wvlrt()
	local tab_otipr = {}
	local int_awb = 33
	local int_yyac = 8
	local _ved = nil
	local bool_kmyiu = false
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLButton = class("BLButton", function() return ccui.Button:create() end)


function BLButton:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLButton:create( ... )
    return self.new(... )
end

function BLButton:_ScriptHandler( evt, param )
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

function BLButton:onEnter( ... )
    
end

function BLButton:update(...)
    self.__controllerMix:update( ... )

end

function BLButton:onExit( ... )
    
end

function BLButton:onExitTransitionDidStart( ... )
    -- body
end

function BLButton:onEnterTransitionDidFinish( ... )
    -- body
end

function BLButton:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLButton:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end


function BLButton:addTouchEvent(event, param)
    local function btnEvent(sender, eventType)
        local function changeChild(is_normal)
            for i, child in ipairs(self:getChildren()) do
                if child.setColor then
                    if is_normal then
                        child:setColor(cc.c3b(255, 255, 255))
                    else
                        child:setColor(cc.c3b(123, 123, 123))
                    end
                end
            end
        end
        if eventType == ccui.TouchEventType.ended then
            self:setColor(cc.c3b(255, 255, 255))
            changeChild(true)
        	if event then
        		event(param)
        	end
        elseif eventType == ccui.TouchEventType.began then
            self:setColor(cc.c3b(123, 123, 123))
            changeChild(false)
        elseif eventType == ccui.TouchEventType.canceled then
            self:setColor(cc.c3b(255, 255, 255))
            changeChild(true)
        elseif eventType == ccui.TouchEventType.moved then
            self:setColor(cc.c3b(123, 123, 123))
            changeChild(false)
        end
    end
    self:addTouchEventListener(btnEvent)
end

function BLButton:setAllItemBright(state)
    local function setBrght(node,state)
        if node.setColor then
            if state then
                node:setColor(cc.c3b(255, 255, 255))
            else
                node:setColor(cc.c3b(123, 123, 123))
            end
        end
    end
    for i, child in ipairs(self:getChildren()) do
        setBrght(child,state)
    end
    setBrght(self,state)
end

function BLButton:stopUpdate()
    self:unscheduleUpdate()
end


function BLButton:onCleanup()
    self:removeAllController()
end

return BLButton