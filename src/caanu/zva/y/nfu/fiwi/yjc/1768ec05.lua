local ___int_mbif = 37
local ___int_eim = 34
local ___bool_jjqxe = false
local ____ogfqg = nil
local ___tab_iqe = {}
local ___tab_jcno = {}
local ____wnbj = nil
local ____nj = nil
local ____ym = nil
local ___str_aenvn = "fsk"
local ___tab_aew = {}
local ___tab_xhmxg = {}
local ___tab_oabu = {}
local ___tab_mlw = {}
local ____evhe = nil
local ___str_dcarn = "wayx"
local ___str_ou = "gxdzk"
local ___tab_gww = {}
local ____bxq = nil
local ___tab_yvwyn = {}
local ___int_rlhl = 10
local ___int_uf = 79
local ___tab_lpdpn = {}

local function ___cixa()
	local bool_rwote = false
	local str_vcbq = "isb"
	local bool_rzdkv = false
	local bool_xd = false
	local tab_yya = {}
end

local function ___cf()
	local _bzbwi = nil
	local str_eehe = "nrdpe"
	local tab_vet = {}
	local bool_ex = false
	local bool_iwcd = false
end

local function ___pxfvd()
	local int_aukcn = 30
	local tab_oqpq = {}
end

local function ___rfc()
	local str_yvav = "kwjdne"
	local bool_qar = false
	local tab_wm = {}
end

local function ___xgnt()
	local int_pgtij = 24
	local str_nkfm = "unro"
end

local function ___mpbp()
	local _dpsf = nil
	local tab_onxx = {}
end

local function ___hpdv()
	local _fs = nil
	local tab_dc = {}
end

local function ___uwrh()
	local _ywks = nil
	local bool_xf = false
end

local function ___ih()
	local int_iyzt = 28
	local str_wp = "rflrg"
	local _vxo = nil
end

local function ___cdnl()
	local _vfnw = nil
	local _aw = nil
	local int_mp = 77
end

local function ___utxj()
	local _kwmkg = nil
	local str_yionv = "ajnkn"
	local _azfs = nil
end

local function ___zoop()
	local bool_gvgs = false
	local int_rjwx = 13
	local str_xjui = "skkke"
	local str_yi = "bwxpy"
end


local ThemeBaseWheelViewControl = class("ThemeBaseWheelViewControl")
local cls = ThemeBaseWheelViewControl

local ThemeBaseWheelView = require "Themes/base/component/ThemeBaseWheelView"

function cls:ctor( bonusParent, themeCtl, data, nodeList, callFunc )
	self.bonusParent 	= bonusParent
	self.themeCtl 		= themeCtl
	
    self.callback = callFunc

	self.node = cc.Node:create()
	bole.scene:addToContentFooter(self.node)

    self.wheelData = data
    self.wheelCfg = self.wheelData.config

    self:initLayout(nodeList, data)
end

function cls:initLayout( nodeList, data )
	self._view = ThemeBaseWheelView.new(self, nodeList, data)
end

function cls:enterFeatureGame()
    self:onStartTrasitionCoverEvent()
    self:onStartTrasitionEndEvent( true )
end

function cls:onStartTrasitionCoverEvent(  )
    self._view:initAndShowWheelNode()
    self._view:createMiniReel(self.itemParent)
end

function cls:onStartTrasitionEndEvent( isClick )
    self._view:openWheelBtn(isClick) -- 默认直接滚动
end

function cls:playWheelClickMusic( ... )
	if self.wheelCfg.click_music then 
        self.themeCtl:playMusicByName(self.wheelCfg.click_music)
    end
end

function cls:onMiniReelRoll( )
    -- 播放滚动音效 
    if self.wheelCfg.roll_music then 
    	self.themeCtl:playMusicByName(self.wheelCfg.roll_music)
    end
    self.themeCtl:dealMusic_FadeLoopMusic(0.2, 1, 0.3)
end

function cls:onMiniReelStop() -- 进行参数控制
    if self.wheelCfg.stop_music then 
        self.themeCtl:playMusicByName(self.wheelCfg.stop_music)
    end
    
end

function cls:onOverWheelGame( )
    self._view:closeWheelNode()
end

function cls:finshCallBack( ... )
    if self.callback then 
        self.callback()
    end
end

function cls:onExit( ... )
    if self._view then 
    	self._view:onExit()
    end
end

---
function cls:getSpineFile(file_name, notPathSpine)
    return self.themeCtl:getSpineFile(file_name, notPathSpine)
end

return ThemeBaseWheelViewControl
