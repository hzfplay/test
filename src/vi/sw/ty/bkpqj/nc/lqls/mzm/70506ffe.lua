local ___bool_gf = false
local ___tab_vp = {}
local ___int_wndz = 52
local ____khdrf = nil
local ___str_clnw = "wsgtix"
local ___tab_cwkq = {}
local ___str_mexvh = "vlb"
local ___tab_lfx = {}
local ___bool_uumv = false
local ___tab_fg = {}
local ___int_hq = 92
local ___int_tfae = 18

local function ___jf()
	local str_fz = "flxpf"
	local _czyt = nil
	local bool_ck = false
end

local function ___vwjlu()
	local str_wy = "qqsec"
	local _ykksr = nil
	local str_cx = "uroun"
	local str_xafs = "yifw"
end

local function ___aeyl()
	local tab_pjss = {}
	local str_nkb = "glvpkd"
end

local function ___cep()
	local _vygy = nil
	local tab_ci = {}
end

local function ___ltq()
	local tab_vx = {}
	local _jxp = nil
	local int_mi = 48
	local _qrudj = nil
end

local function ___dn()
	local bool_io = false
	local _glmdd = nil
	local tab_wfro = {}
	local _ceg = nil
	local bool_ceprq = false
end

local function ___fv()
	local str_wd = "vhypu"
	local str_bey = "vgzci"
end

local function ___upxe()
	local tab_pynrg = {}
	local str_umx = "spb"
	local tab_bjp = {}
end

local function ___kuoqw()
	local bool_uyipb = false
	local str_sfgro = "bovynq"
	local tab_mm = {}
	local str_mai = "hyb"
end

local function ___zgjat()
	local _bz = nil
	local bool_fanww = false
	local tab_knq = {}
	local _xl = nil
	local str_unidr = "vmbwsl"
end

local function ___kl()
	local bool_cuio = false
	local tab_lovyd = {}
	local tab_idd = {}
end

local function ___au()
	local tab_bw = {}
	local int_kyffr = 48
	local int_orjhg = 9
	local tab_wq = {}
end

local function ___ob()
	local str_bd = "tisr"
	local str_hxbta = "lirtj"
end
ScreenControl = class("ScreenControl")

ScreenOrientation = {
    Landscape = 1,
    vertical = 2
}

function ScreenControl:getInstance( ... )
    if not self._instance then
        self._instance = ScreenControl.new()
    end
    return self._instance
end

function ScreenControl:ctor()
    self.isPortrait = false
    self.orientation = ScreenOrientation.Landscape
    self.preOrientation = ScreenOrientation.Landscape
    self:reset()
end


function ScreenControl:reset()
    
end

function ScreenControl:setScreenOrientation(isPortrait)
    self.isPortrait = isPortrait
    if self.isPortrait then
        self.preOrientation = self.orientation
        self.orientation = ScreenOrientation.vertical
    	bole.setScreenOrientation(ScreenOrientation.vertical) 
    else
        self.preOrientation = self.orientation
        self.orientation = ScreenOrientation.Landscape
        if bole.isThemeScene() then
            bole.setScreenOrientation(ScreenOrientation.Landscape) 
        else
            local screenDesign = require "screenDesign"
            local screenDesignSize = screenDesign:getDesignResolution()
            bole.setScreenOrientation(screenDesignSize.orientation) 
        end
    end
end

function ScreenControl:resetScreenOrientation( )
    if self.isPortrait then
        bole.setScreenOrientation(ScreenOrientation.vertical)
    else
        bole.setScreenOrientation(ScreenOrientation.Landscape) 
    end
end

function ScreenControl:resumeScreenOrientation()
    if self.preOrientation == ScreenOrientation.vertical then
        self:setScreenOrientation(true)
    else
        self:setScreenOrientation(false)
    end
end

function ScreenControl:reconnect()
    self.isPortrait = false
    self.orientation = ScreenOrientation.Landscape
    self.preOrientation = ScreenOrientation.Landscape
end