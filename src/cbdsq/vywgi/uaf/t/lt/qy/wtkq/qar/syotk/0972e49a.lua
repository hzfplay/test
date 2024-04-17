local ___str_bw = "zyh"
local ___bool_vqh = false
local ___bool_foiq = false
local ___str_fymwf = "rbkpvz"
local ___tab_keqv = {}
local ___str_ygho = "gralh"
local ___str_rsc = "kijtw"
local ___str_aup = "fac"
local ___str_ewj = "lwhqsk"
local ___str_nva = "igsca"
local ___str_dt = "tqlmlm"
local ___bool_wnnf = false
local ___str_ack = "zdejq"
local ___int_dg = 54
local ___int_sg = 12
local ___str_cxvk = "hlem"
local ___tab_zjlo = {}
local ___str_ul = "fysbzz"
local ___tab_dolp = {}
local ____qy = nil

local function ___kvrun()
	local str_vceoq = "npwwc"
	local bool_ea = false
	local int_tk = 66
	local str_qny = "bsk"
end

local function ___mu()
	local str_yha = "jaqjmh"
	local _vxkq = nil
	local bool_kwbm = false
end

local function ___sbb()
	local _ll = nil
	local _lj = nil
	local bool_bwn = false
	local tab_uknb = {}
	local str_zizc = "pwhd"
end

local function ___iyx()
	local tab_qc = {}
	local bool_ga = false
	local bool_gsih = false
end

local function ___xg()
	local str_xozr = "nci"
	local bool_eb = false
	local str_orrxj = "ktxdm"
end

local function ___bgxl()
	local _ptkks = nil
	local str_zrl = "uznqta"
	local tab_te = {}
	local tab_xy = {}
	local bool_fj = false
end

local function ___tvr()
	local str_sg = "gwi"
	local tab_fx = {}
end

local function ___orxp()
	local _dgqja = nil
	local int_wkko = 13
	local str_aq = "prjae"
	local str_gdm = "aeya"
	local bool_huste = false
end

local function ___dpjng()
	local int_kds = 58
	local tab_kpr = {}
	local str_bbzh = "txuc"
end

local function ___zfihv()
	local _zclz = nil
	local _aac = nil
	local bool_lilqj = false
end

local function ___xmmgp()
	local bool_nx = false
	local str_hrpv = "byu"
end

local function ___kokwx()
	local tab_eg = {}
	local str_onj = "zayz"
	local int_rhpn = 76
end

local function ___bov()
	local str_pyb = "jnhqm"
	local _uij = nil
	local str_tj = "hfqpf"
end

local function ___sbkjx()
	local bool_xa = false
	local _dzsi = nil
end

local function ___qtade()
	local _vx = nil
	local tab_ibxw = {}
end

local function ___hppyp()
	local str_hwmv = "bnke"
	local bool_kv = false
	local bool_bh = false
	local _jtv = nil
	local tab_sn = {}
end

local function ___ve()
	local tab_yw = {}
	local tab_ms = {}
end

local function ___qd()
	local str_gag = "mtiw"
	local str_tzwe = "wvaspr"
	local str_gf = "hxdx"
end

local function ___zpqyc()
	local int_ta = 38
	local _zj = nil
	local int_lg = 81
	local tab_tde = {}
	local int_ro = 56
end
--- @program src
--- @description: theme2010 collect ctl
--- @author: rwb
---@create: : 2021/02/22 19:00:00

local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local cls = class("MultiControl", parentClass)
local view = require "Themes/TournCash/Common/Multi/MultiView"

function cls:ctor(mainCtl, commonCtl)
    parentClass.ctor(self, commonCtl)
    self.themeCtl = mainCtl
    self.tcCommonCtl = commonCtl
end
function cls:initLayout(parentNode)
    self.multiTipView = view.new(self, parentNode)
    self.multiTipView:initRoot()
end
function cls:getCommonConfig()
    return self.tcCommonCtl:getCommonConfig()
end

function cls:hideMultiTipNode(...)
    self.multiTipView:hideMultiTipNode(...)
end
function cls:setMultiSpinLeftCount(...)
    self.multiTipView:setMultiSpinLeftCount(...)
end
function cls:showMultiSpinLeftCount(...)
    self.multiTipView:showMultiSpinLeftCount(...)
end
function cls:getMultiNodeWorldPos(...)
    return self.multiTipView:getMultiNodeWorldPos(...)
end
function cls:clearMultiStatus()

    if self:getLeftMultiSpins() > 0 then
        self:setLeftMultiSpins(0)
        self:setPointsMulti(1)
        self:setIsMultiSpin(false)
        self:hideMultiTipNode()
    end
end
function cls:getLeftMultiSpins()
    return self.leftMultiSpins or 0
end
function cls:setLeftMultiSpins(count)
    self.leftMultiSpins = count
end
function cls:getPointsMulti()
    return self.pointMulti or 1
end
function cls:setPointsMulti(multi)
    self.pointMulti = multi
end
function cls:checkIsMultiSpin()
    return self.multiStatus or false
end
function cls:setIsMultiSpin(status)
    self.multiStatus = status
end
function cls:subMultiPoint()
    if self:checkIsMultiSpin() then
        self:setLeftMultiSpins(self:getLeftMultiSpins() - 1)
        local count = self:getLeftMultiSpins()
        local multi = self:getPointsMulti()
        if count < 0 then
            self:setIsMultiSpin(false)
        end
        self:setMultiSpinLeftCount(count, multi)
    end
end
function cls:playMultiPointsByBalloon(spinCount, multi)
    self:setLeftMultiSpins(spinCount)
    self:setIsMultiSpin(true)
    self:setPointsMulti(multi)
    self:showMultiSpinLeftCount(true)
end
function cls:showMultiSpinLeftCount(isAnimate)
    local spins = self:getLeftMultiSpins()
    local multi = self:getPointsMulti()
    if spins > 0 then
        self.multiTipView:showMultiSpinLeftCount(spins, multi, isAnimate)
    end
end
function cls:playMultiPointsDialog(spinCount, multi, from)
    local dialogStep = self.tcCommonCtl:getDialogStep()
    local dialogType = self.tcCommonCtl:getDialogType()
    local data = {}
    data.spins = spinCount .. " SPINS"
    data.label_multi = "X" .. multi .. " POINTS"
    data.music_mini = 1
    data.mask_id = 3
    self:playMusicByName("dialog_double")
    self:playMusicByName("dialog_double" .. multi)
    data.click_event = function()
        self:showMultiSpinLeftCount(true)
    end
    local dialog = self.tcCommonCtl:showThemeDialog(data, dialogStep.more, dialogType.multi)
    dialog:runAction(cc.Sequence:create(
            cc.DelayTime:create(50 / 30),
            cc.ScaleTo:create(0.5, 0)
    ))
    if from and from == "pick" then
        self:setLeftMultiSpins(spinCount)
    else
        self:setLeftMultiSpins(spinCount - 1)
    end
    self:setPointsMulti(multi)
    if spinCount > 0 then
        self:setIsMultiSpin(true)
    else
        self:setIsMultiSpin(false)
    end
end

return cls


