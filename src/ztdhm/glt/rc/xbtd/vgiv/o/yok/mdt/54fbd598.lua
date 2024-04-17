local ___str_lm = "brtq"
local ___bool_aio = false
local ___str_dp = "wxrts"
local ___int_kjtq = 37
local ___str_clwg = "tey"
local ___tab_ulpaa = {}
local ___tab_xnclt = {}
local ____jp = nil
local ___str_zho = "gilj"
local ___str_wg = "xuq"
local ___tab_bgthy = {}
local ____eq = nil
local ___tab_caymr = {}
local ___tab_osnb = {}

local function ___tly()
	local _tezv = nil
	local str_ee = "rsx"
	local _ra = nil
	local int_wd = 91
	local bool_xwbfs = false
end

local function ___rpehr()
	local _be = nil
	local tab_ygips = {}
	local _tbgd = nil
	local tab_ai = {}
	local bool_rs = false
end

local function ___qbbjg()
	local str_syozt = "swt"
	local int_zhuvn = 72
end

local function ___jcwx()
	local str_jgq = "yof"
	local int_ojpjt = 61
	local _dchyp = nil
	local int_qhoa = 26
end

local function ___mo()
	local int_wh = 20
	local str_cgfy = "rtrvuf"
	local str_etsu = "ltik"
	local int_xc = 10
end

local function ___lrg()
	local bool_kyg = false
	local tab_rkwvd = {}
end

local function ___ba()
	local _sby = nil
	local bool_trf = false
	local tab_isi = {}
	local str_dcu = "flhrs"
	local bool_plsf = false
end

local function ___gq()
	local _vs = nil
	local str_mr = "rhwqj"
	local str_icr = "daf"
	local int_tp = 60
	local tab_suvtq = {}
end

local function ___yvys()
	local str_jwzr = "ojjamw"
	local tab_hir = {}
	local int_ktykt = 19
end

local function ___fbwxt()
	local bool_snwa = false
	local int_hpzm = 14
end

local function ___xvfgz()
	local _imm = nil
	local int_rgcvc = 27
end
--- @program src
--- @description:  
--- @author: rwb 
---@create: : 2021/02/22 19:00:00
local cls = class("MultiView")
function cls:ctor(ctl, parent, flyNode)
    self.ctl = ctl
    self.node = parent
end
function cls:initRoot()
    self.node:setVisible(false)
    self.multiDesc = self.node:getChildByName("desc")
    self.multiLeftCnt = self.node:getChildByName("left_cnt")
    self.node.base_pos = cc.p(34, -245)
    self.node:setPosition(cc.p(34, -245))
end
function cls:hideMultiTipNode()
    self.multiTipNode:setVisible(false)
end
function cls:setMultiSpinLeftCount(count, multi)
    if count < 0 then
        self.node:runAction(
                cc.Sequence:create(
                        cc.ScaleTo:create(0.3, 0),
                        cc.Hide:create()
                )
        )
        self.ctl:playMusicByName("doubletip_out")
    elseif count <= 1 then
        self.multiLeftCnt:setString(count)
        local str = self.ctl:getCommonConfig().multi_tip_config["tip_desc"]
        str = string.format(str, multi)
        self.multiDesc:setString(str)
    else
        self.multiLeftCnt:setString(count)
    end
end
function cls:showMultiSpinLeftCount(count, multi, isAni)
    self.multiLeftCnt:setString(count)
    local multi_tip_config = self.ctl:getCommonConfig().multi_tip_config
    local str
    if count > 1 then
        str = multi_tip_config["tip_desc1"]
    elseif count then
        str = multi_tip_config["tip_desc"]
    end
    str = string.format(str, multi)
    self.multiDesc:setString(str)
    self.node:setVisible(true)
    if isAni then
        self.node:setScale(0)
        self.node:runAction(
                cc.ScaleTo:create(0.3, 1)
        )
        self.ctl:playMusicByName("doubletip_in")
    else
        self.node:setScale(1)
    end
end
function cls:getMultiNodeWorldPos()
    return self.node:convertToWorldSpace(cc.p(0, 0))
end
return cls





