local ___str_mgtf = "bhmm"
local ___int_azzkv = 5
local ___tab_mw = {}
local ___bool_sgq = false
local ___int_wg = 47
local ____qxaj = nil
local ___bool_ozt = false
local ___tab_dkhw = {}
local ___int_zvtvf = 7
local ____ndnd = nil
local ___int_uyxh = 93
local ___int_tjxjh = 6
local ___bool_wixxu = false
local ____fas = nil
local ___str_sgkw = "vnuanm"
local ___str_gcklq = "nstipt"
local ____dwbto = nil
local ___bool_ith = false
local ____zyk = nil
local ___bool_nf = false
local ___bool_if = false
local ___str_ugz = "rwsf"
local ___bool_jhf = false
local ___bool_bn = false
local ___int_mszjz = 13
local ___str_hbku = "tsb"

local function ___dpwdf()
	local tab_xukzt = {}
	local _pjeq = nil
	local _ym = nil
end

local function ___htv()
	local int_uc = 71
	local tab_eurdq = {}
end

local function ___kebab()
	local _gbto = nil
	local str_etq = "vwunu"
	local _ina = nil
	local int_fe = 33
	local int_reiny = 67
end

local function ___flwqj()
	local tab_hphr = {}
	local _hjrf = nil
	local int_qkli = 22
end

local function ___zgfd()
	local bool_mehl = false
	local str_mj = "zvr"
end

local function ___pc()
	local _dy = nil
	local str_ta = "jlk"
	local tab_dpumk = {}
	local tab_dssg = {}
end

local function ___gexn()
	local bool_plew = false
	local _kine = nil
	local str_xgwnw = "lfwpqy"
	local bool_uxfln = false
end

local function ___hgezq()
	local tab_xloln = {}
	local _rn = nil
	local _vvtuk = nil
	local str_vzyym = "iopz"
	local _lcqi = nil
end

local function ___pmv()
	local int_sk = 48
	local str_ff = "wxma"
	local _hjvnf = nil
	local _ezga = nil
	local bool_uuvni = false
end

local function ___xhya()
	local bool_jnu = false
	local _rtri = nil
	local int_egri = 56
	local _nosx = nil
	local bool_vs = false
end

local function ___pz()
	local tab_yg = {}
	local int_lequx = 2
	local bool_fju = false
end

local function ___bcgfp()
	local int_hfc = 27
	local str_zqrsn = "mnsd"
	local _hmam = nil
	local bool_goy = false
	local str_xlf = "stmqkz"
end

local function ___kkwe()
	local bool_immli = false
	local int_gchb = 2
end

local function ___dwunm()
	local _lrho = nil
	local bool_oiebe = false
	local _dfcw = nil
end

local function ___aswm()
	local tab_idat = {}
	local str_iiom = "pku"
	local _faabl = nil
end

local function ___bz()
	local _mjo = nil
	local str_utj = "wdtah"
end

local function ___za()
	local tab_gtkt = {}
	local int_iqld = 71
end

local function ___qz()
	local str_utfi = "xfdy"
	local str_fuq = "efi"
	local bool_qwps = false
	local int_yc = 91
	local tab_lh = {}
end

local function ___rxplz()
	local tab_xfvtt = {}
	local str_kfyuw = "qhfr"
	local str_rzj = "fcy"
	local str_qkmk = "oisvn"
	local tab_girtr = {}
end

local function ___fwtum()
	local _pqug = nil
	local int_xqvn = 77
	local tab_qflp = {}
end

local function ___uvfe()
	local str_qnaf = "cjlb"
	local tab_gn = {}
	local int_dlfis = 52
end

local function ___zfiy()
	local tab_ab = {}
	local bool_sq = false
	local int_vv = 66
	local tab_txgz = {}
	local int_bdvc = 74
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/02/24 11:11
---

local headItem = require("Themes/TournCash/Common/Rank/TCRankHeadItem")
local cls = class("TCRankTipView", function()
    return cc.Node:create()
end)
function cls:ctor(ctl, rankInfo, isSelf, multi)
    self.ctl = ctl
    self.rankInfo = rankInfo
    self.cellHeight = 75
    self.cellWidth = 369
    self.isSelf = isSelf
    self.multi = multi
    self:initRankTipItem()
    self:show()
end
function cls:initRankTipItem()
    self.csb = self.ctl:getCsbPath("rank_tip")
    self.node = cc.CSLoader:createNode(self.csb)
    self:addChild(self.node)
    self.root = self.node:getChildByName("root")
    self.bgSpine = self.root:getChildByName("bg_spine")
    self.headNode = self.root:getChildByName("rank_head")
    self.multiImg = self.root:getChildByName("multi")
    self.spineNode = self.root:getChildByName("loop_node")
    self.headItem = headItem.new(self.ctl, self.headNode, self.isSelf)
    self.headItem:setHeadStyle(self.rankInfo)
    self.headItem:updateIcon(self.rankInfo, self.isSelf)
    self.labelNode = self.root:getChildByName("label_node")
    self.labelName = self.labelNode:getChildByName("label_name")
    self:_initMultiImg()

    self:setLabelName(libUI.getCommonName(self.rankInfo))
    self:_loopAni()
end
function cls:_initMultiImg()
    local data = {}
    data.file = self.ctl:getSpineFile("rank_tip_multi")
    data.parent = self.spineNode
    data.pos = cc.p(101, 0)
    data.isLoop = true
    data.animateName = "animation" .. self:getSpineIndex(self.multi)
    if data.animateName then
        bole.addAnimationSimple(data)
    end
end
function cls:getSpineIndex(multi)
    if multi == 2 then
        return 1
    end
    if multi == 3 then
        return 2
    end
    if multi == 5 then
        return 3
    end
    if multi == 10 then
        return 4
    end
end
function cls:show()
    bole.scene:addToFooter(self, 1)
    local posY = 0
    if bole.getAdaptationWidthScreen() then
        posY = FRAME_HEIGHT / 2 - 70 - (self.cellHeight / 2)
    else
        posY = (self.cellHeight / 2 + 150)
    end
    local startPos = cc.p(FRAME_WIDTH / 2 + self.cellWidth / 2, posY)
    local endPos = cc.p(FRAME_WIDTH / 2 - self.cellWidth / 2, posY)
    self:setPosition(startPos)
    self:_addAppearAni()
    self:runAction(
            cc.Sequence:create(
                    cc.MoveTo:create(0.2, endPos),
                    cc.DelayTime:create(2),
                    cc.MoveTo:create(0.3, startPos),
                    cc.RemoveSelf:create()
            )
    )
end
function cls:_addAppearAni()
    local data = {}
    data.file = self.ctl:getSpineFile("rank_tip_bg")
    data.parent = self.bgSpine
    data.animateName = "animation2"
    bole.addAnimationSimple(data)
end
function cls:_loopAni()
    local data = {}
    data.file = self.ctl:getSpineFile("rank_tip_bg")
    data.parent = self.bgSpine
    data.animateName = "animation1"
    data.isLoop = true
    bole.addAnimationSimple(data)
end
function cls:setLabelName(name)
    self.labelName:setString(bole.getShortName(name, 25))
    bole.shrinkLabel(self.labelName, 140, 1)

end
return cls