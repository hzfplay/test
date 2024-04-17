local ___tab_sxfb = {}
local ___str_eyx = "fyqfp"
local ___tab_lhgx = {}
local ___tab_ab = {}
local ____xuaub = nil
local ___int_cr = 63
local ___tab_glhj = {}
local ___tab_bmzn = {}
local ____dv = nil
local ___tab_hkez = {}
local ___str_nfaii = "ulaahy"
local ___bool_hgb = false
local ____wv = nil
local ___str_quku = "burrfj"
local ___int_acxi = 57
local ____ygql = nil
local ___tab_ku = {}

local function ___afs()
	local str_vzlo = "bgj"
	local tab_as = {}
	local str_ny = "jqzg"
end

local function ___iqac()
	local tab_oypee = {}
	local str_dp = "jimtfi"
	local tab_okms = {}
	local tab_lu = {}
	local _wxcit = nil
end

local function ___zxwi()
	local bool_tk = false
	local int_sylcb = 50
	local tab_hwyv = {}
	local tab_bwe = {}
end

local function ___fidbp()
	local int_yjpx = 92
	local bool_hhhwg = false
	local bool_jws = false
	local tab_nfb = {}
end

local function ___ut()
	local int_jku = 91
	local str_hcc = "yewau"
end

local function ___ips()
	local _fzl = nil
	local _hjrzd = nil
	local str_dp = "qda"
	local tab_ge = {}
end

local function ___btfws()
	local tab_lchg = {}
	local tab_mmzvv = {}
end

local function ___jgan()
	local str_xb = "abhf"
	local int_het = 27
	local tab_unyiw = {}
	local _wje = nil
end

local function ___adx()
	local str_speiz = "wqhkgh"
	local int_npc = 66
	local _jodr = nil
end

local function ___andch()
	local str_rrakx = "gksas"
	local bool_iat = false
	local tab_zaee = {}
	local tab_xurhz = {}
	local _naj = nil
end

local function ___nzcaj()
	local int_fz = 66
	local _jhm = nil
	local int_bs = 56
end

local function ___zw()
	local str_vl = "fzwe"
	local str_wxnl = "ptbq"
end

local function ___ptelq()
	local int_duttw = 81
	local int_boi = 38
	local tab_jeeah = {}
	local str_mndku = "zbmsal"
end

local function ___pc()
	local tab_ixzt = {}
	local int_toojw = 63
end

local function ___aqky()
	local tab_uzlhl = {}
	local int_ius = 42
	local bool_fvy = false
end

local function ___hwmii()
	local _fv = nil
	local tab_qe = {}
	local _vzxaq = nil
end

local function ___dsuo()
	local str_yi = "auy"
	local bool_gvm = false
	local _hti = nil
end

local function ___gmcxk()
	local int_dqt = 16
	local int_zexx = 6
	local str_ocs = "afcane"
	local tab_lnu = {}
	local str_yocv = "vgwuz"
end

local function ___cnl()
	local _idm = nil
	local tab_egn = {}
	local _iah = nil
	local tab_pd = {}
	local _wdbzr = nil
end

local function ___mtrgx()
	local bool_mkk = false
	local tab_zuw = {}
	local int_ok = 43
	local bool_el = false
	local int_fxw = 68
end

local function ___kf()
	local _umw = nil
	local _loeoj = nil
	local tab_vwvr = {}
	local int_ljmcd = 3
end

local function ___dvkk()
	local str_ps = "gdoik"
	local int_zkixb = 47
	local _uone = nil
	local str_rs = "ufpdl"
	local bool_it = false
end

local function ___muaqr()
	local _hv = nil
	local tab_rjca = {}
	local int_wmcqu = 28
	local _czz = nil
	local int_der = 94
end

local function ___pguk()
	local bool_ly = false
	local bool_dcivk = false
	local _ds = nil
end

local function ___sou()
	local bool_kryy = false
	local bool_veo = false
	local bool_qqqn = false
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLScale9Sprite = class("BLScale9Sprite", function(...)
    return cc.Scale9Sprite:create(...)
end)

function BLScale9Sprite:ctor()
    ControllerMix:attach(self)
    self:registerScriptHandler(handler(self, self._ScriptHandler))
end

function BLScale9Sprite:create(...)
    return self.new(...)
end

function BLScale9Sprite:_ScriptHandler(evt, param)
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

function BLScale9Sprite:onEnter(...)

end

function BLScale9Sprite:update(...)
    self.__controllerMix:update(...)

end

function BLScale9Sprite:onExit(...)

end

function BLScale9Sprite:onExitTransitionDidStart(...)
    -- body
end

function BLScale9Sprite:onEnterTransitionDidFinish(...)
    -- body
end

function BLScale9Sprite:startUpdate(...)
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLScale9Sprite:getItem(path)
    return CreatorUtils.getItemByPath(self, path)
end

function BLScale9Sprite:stopUpdate()
    self:unscheduleUpdate()
end

function BLScale9Sprite:onCleanup()
    self:removeAllController()
end
function BLScale9Sprite:loadTexture(fileName,texType)
    if not fileName then
        return 
    end
    if texType ==  ccui.TextureResType.localType then
        -- self:initWithFile(fileName,consept);
     
    elseif texType ==  ccui.TextureResType.plistType then
        local spriteFrameCache = cc.SpriteFrameCache:getInstance()
        local rect = self:getCapInsets()
        local size = self:getContentSize()
        self:setSpriteFrame(spriteFrameCache:getSpriteFrame(fileName), rect)
        self:setContentSize(size)
    end
end

return BLScale9Sprite
