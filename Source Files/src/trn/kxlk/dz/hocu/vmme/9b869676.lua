local ___tab_ubczm = {}
local ___bool_aep = false
local ___bool_zd = false
local ___str_fqkaz = "yfl"
local ___bool_lpa = false
local ___tab_mf = {}
local ___int_rbw = 53
local ___int_quy = 42
local ___str_dqcjc = "btxltw"
local ___tab_vu = {}
local ____ohto = nil
local ___bool_ptyiq = false
local ___bool_dr = false
local ___tab_ixro = {}
local ___int_rbvd = 18
local ____szum = nil
local ___str_nllxt = "fjwkt"
local ___int_hlnv = 74
local ___int_bvsjb = 93
local ___str_fh = "nedwp"
local ___tab_jdr = {}
local ____rhx = nil

local function ___crmpq()
	local int_kyna = 62
	local str_qgvyh = "xwkj"
end

local function ___lvyyv()
	local tab_ryrc = {}
	local str_kgrt = "nguzmr"
	local str_eqcte = "hyxapx"
	local _xs = nil
	local int_knaxe = 89
end

local function ___iccnz()
	local _hoby = nil
	local _ch = nil
	local tab_sk = {}
end

local function ___lp()
	local bool_aqjae = false
	local str_aahwf = "gfkpqq"
	local tab_ilz = {}
end

local function ___pike()
	local str_nt = "yglxc"
	local str_nce = "xufi"
end

local function ___tdtad()
	local bool_zglfx = false
	local int_ronlk = 24
	local int_itl = 37
end

local function ___cug()
	local tab_wmmoc = {}
	local _eln = nil
end

local function ___ohsq()
	local bool_gpxa = false
	local int_mggrq = 82
	local tab_uhjg = {}
	local tab_dgsh = {}
	local _ocw = nil
end

local function ___jpyu()
	local str_kkh = "wawr"
	local tab_gff = {}
end

local function ___xccm()
	local str_tgfvp = "hwblh"
	local tab_qhgx = {}
	local str_wzbh = "krdykj"
	local _mvb = nil
	local str_qch = "cwke"
end

local function ___ie()
	local _lma = nil
	local _sfnmz = nil
	local tab_mg = {}
end

local function ___li()
	local tab_mj = {}
	local bool_lujsn = false
	local tab_avrc = {}
	local bool_kjjym = false
end

local function ___rktj()
	local _mpn = nil
	local bool_orsds = false
	local int_izheq = 2
end

local function ___dt()
	local bool_rzfn = false
	local int_fmpiw = 76
end

local function ___nvh()
	local tab_weeu = {}
	local _zo = nil
end

local function ___ngj()
	local int_mpx = 80
	local str_hun = "aokqy"
	local bool_wflyc = false
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")

local BLLabel = class("BLLabel", function(type, ...) 
    if type == 1 then 
        return cc.Label:createWithBMFont(...)
    elseif type == 0 then
        return cc.Label:createWithSystemFont(...)
    else
        return cc.Label:createWithTTF(...)
    end
end)

function BLLabel:ctor()
    ControllerMix:attach( self )
    self:registerScriptHandler( handler(self, self._ScriptHandler) )
end

function BLLabel:create( ... )
    return self.new(... )
end

function BLLabel:_ScriptHandler( evt, param )
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

function BLLabel:onEnter( ... )
    
end

function BLLabel:update(...)
    self.__controllerMix:update( ... )

end

function BLLabel:onExit( ... )
    
end

function BLLabel:onExitTransitionDidStart( ... )
    -- body
end

function BLLabel:onEnterTransitionDidFinish( ... )
    -- body
end

function BLLabel:startUpdate( ... )
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLLabel:getItem( path )
    return CreatorUtils.getItemByPath(self, path)
end

function BLLabel:stopUpdate()
    self:unscheduleUpdate()
end


function BLLabel:onCleanup()
    self:removeAllController()
end

function BLLabel:setFntFile(...)
    if self.setBMFontFilePath then
        self:setBMFontFilePath(...)
    end
end

function BLLabel:setTTFStroke(...)
    self:enableOutline(...)
end

return BLLabel
