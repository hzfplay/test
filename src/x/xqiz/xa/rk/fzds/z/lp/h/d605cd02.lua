local ___int_xeiup = 4
local ___str_cosbv = "citqf"
local ___str_ewgr = "cdfzu"
local ___tab_vd = {}
local ___str_qrug = "pim"
local ___bool_uuiz = false
local ____zcjr = nil
local ___tab_rme = {}
local ___str_uf = "klcp"
local ___tab_pfay = {}
local ___tab_texzu = {}
local ___bool_uy = false
local ___str_osd = "skkxwg"
local ____xoeio = nil
local ____gfi = nil
local ___bool_id = false
local ___tab_szunm = {}
local ____tk = nil
local ____iozd = nil
local ___tab_ryrvc = {}
local ___tab_brrno = {}
local ___bool_bli = false

local function ___angti()
	local tab_zc = {}
	local tab_lry = {}
	local tab_fp = {}
end

local function ___oenny()
	local int_fo = 79
	local _kz = nil
	local bool_asoha = false
end

local function ___gmlj()
	local bool_elams = false
	local tab_loqzh = {}
	local str_xwjm = "igoqp"
end

local function ___xdj()
	local bool_eltq = false
	local int_ukrwv = 20
	local _recc = nil
end

local function ___jbpzx()
	local _divvk = nil
	local bool_air = false
	local int_qiq = 2
	local str_ji = "siho"
end

local function ___pwviq()
	local _rdyhx = nil
	local str_fs = "zthhx"
end

local function ___ym()
	local bool_jgb = false
	local str_dcuc = "bgag"
end

local function ___spzf()
	local int_ga = 67
	local str_fx = "ekulaw"
end

local function ___cn()
	local bool_fmm = false
	local int_yu = 40
end

local function ___zvykh()
	local _wsqnx = nil
	local bool_khx = false
	local bool_bxkqw = false
	local int_dc = 37
	local _czw = nil
end

local function ___xnl()
	local str_jqav = "mny"
	local bool_bf = false
	local int_dek = 31
end

local function ___atx()
	local str_ijdu = "nwpugb"
	local _liqty = nil
	local str_dpsl = "duhb"
	local tab_xcgll = {}
end

local function ___cgg()
	local str_cr = "xatvh"
	local bool_ggw = false
	local _dhmd = nil
	local bool_uf = false
end

local function ___xeku()
	local bool_ekgu = false
	local _uqau = nil
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/03/15 14:55
---
local jackpotItemTip = require("Themes/base/component/Jackpot/JackpotItemTip")
local jackpotItem = require("Themes/base/component/Jackpot/JackpotItem")
local cls = class("ThemeJackpotView")
function cls:ctor(jpCtl, jpRoot, jpTipRoot)
    self.ctl = jpCtl
    self.gameConfig = self.ctl:getGameConfig()
    self.node = jpRoot
    self.parentTip = jpTipRoot
    self.hasJackpotNode = false
    self:initLayout()
    self:initJackpotItems()
    self:initJackpotTips()
end
function cls:initLayout()
    self.jackpotSpine = self.node:getChildByName("bg_spine")
end
function cls:initJackpotItems()
    local jackpot_config = self.ctl:getGameConfig().jackpot_config
    self.jackpotItemList = {}
    for i = 1, jackpot_config.count do
        local node = self.node:getChildByName("node_" .. i)
        local label = self.node:getChildByName("label_jp" .. i)
        local jackpotItemNode = jackpotItem.new(self.ctl, node, i, label)
        self.jackpotItemList[i] = jackpotItemNode
    end
end
function cls:initJackpotTips()
    local jackpot_config = self.ctl:getGameConfig().jackpot_config
    self.jackpotTipList = {}
    for i = 1, jackpot_config.count do
        self.jackpotTipList[i] = {}
        local tipNode = jackpotItemTip.new(self.ctl, i, self.parentTip)
        self.jackpotTipList[i] = tipNode
    end
end
function cls:getJackpotLabel(index)
    return self.jackpotItemList[index].jackpotLabel
end
function cls:getJackpotLabels()
    if not self.jackpotLabels then
        self.jackpotLabels = self.jackpotLabels or {}
        for key = 1, #self.jackpotItemList do
            self.jackpotLabels[key] = self:getJackpotLabel(key)
        end
    end
    return self.jackpotLabels
end

function cls:setJackpotPartState(index, isLock)
    local jackpotItem = self.jackpotItemList[index]
    jackpotItem:setBtnTouchEnable(isLock)

    if isLock then
        jackpotItem:playLockSpine(self.parentTip)
    else
        jackpotItem:playUnLockSpine(self.parentTip)
    end
end
function cls:showJpTipNode(index, status)
    local showNode = self.jackpotTipList[index]
    if self.showjpTipCacheNode then
        self.showjpTipCacheNode:hideTipNode()
    end
    showNode:showJpTipNode(status)
    self.showjpTipCacheNode = showNode
end
----------------------- jackpot win ani start -----------------------
function cls:addWinJpAni(jpIndex)
    self.jackpotItemList[jpIndex]:addWinJpAni()
end
function cls:removeJpAni(jpIndex)
    self.jackpotItemList[jpIndex]:removeJpAni()
end
----------------------- jackpot win ani end -----------------------

local viewCenter = {}
viewCenter.view = cls
viewCenter.jackpotItem = jackpotItem
viewCenter.jackpotItemTip = jackpotItemTip

return viewCenter
