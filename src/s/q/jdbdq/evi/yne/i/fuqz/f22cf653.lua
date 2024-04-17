local ___int_xgkn = 32
local ___tab_bo = {}
local ___str_yvnzi = "dzkh"
local ___tab_fypsn = {}
local ___int_on = 30
local ___int_fo = 55
local ____pnrt = nil
local ___int_ygzgl = 82
local ___tab_fc = {}
local ___tab_uxnud = {}

local function ___ylqf()
	local int_til = 50
	local str_ewtv = "txqe"
	local int_rhvoo = 86
	local int_vghne = 100
	local bool_uaaz = false
end

local function ___pprzz()
	local str_mb = "bim"
	local bool_yb = false
	local _kr = nil
	local tab_wfj = {}
	local bool_bhc = false
end

local function ___ohzvs()
	local tab_dhff = {}
	local tab_ycznd = {}
end

local function ___mlt()
	local bool_ovl = false
	local _tigy = nil
	local str_qttpn = "frvihn"
	local int_eo = 57
	local bool_wz = false
end

local function ___ovkk()
	local str_auyuy = "uwi"
	local _kf = nil
end

local function ___gkpy()
	local str_skcva = "esaixp"
	local int_oxd = 89
	local str_ge = "jjjw"
	local bool_rhui = false
end

local function ___vlhn()
	local int_cska = 95
	local str_vtsql = "fmkmz"
end

local function ___tap()
	local _kgldr = nil
	local tab_uzec = {}
	local int_sj = 9
end

local function ___thdkj()
	local bool_mnive = false
	local bool_xvl = false
	local int_ndp = 45
	local str_bh = "wfok"
end

local function ___eze()
	local str_pl = "iwksu"
	local tab_maqnt = {}
	local bool_dzgs = false
	local tab_xs = {}
end

local function ___ee()
	local int_gf = 93
	local int_vp = 59
	local str_fsio = "hofyf"
end

local function ___kc()
	local str_mc = "iqmqzf"
	local bool_ettb = false
end

local function ___qjjic()
	local bool_uvif = false
	local bool_xarnb = false
	local tab_ulu = {}
	local int_hoqz = 77
end

local function ___tto()
	local bool_oflv = false
	local int_zlakh = 33
end

local function ___tunjf()
	local int_dy = 12
	local str_lno = "lmxksh"
	local tab_stq = {}
	local int_wmre = 47
end

local function ___un()
	local int_wuybd = 56
	local bool_mf = false
	local tab_mzr = {}
	local _oow = nil
	local int_ex = 64
end
---
--- @program src 
--- @description:  
--- @author: rwb 
---@create: : 2021/02/22 19:00:00
local cls = class("TCCollectView")
function cls:ctor(ctl, parent, flyNode)
    self.ctl = ctl
    self.node = parent
    self.flyNode = flyNode
end
function cls:initCollectRoot()
    local collect_config = self.ctl:getCommonConfig().collect_config
    self._upTime = collect_config.up_time
    self._flyTime = collect_config.fly_time
    self.collectRoot = self.node:getChildByName("root")
    self.collectItem = self.collectRoot:getChildByName("collect_item")
    self.collectLabel = self.collectRoot:getChildByName("label")
    self.collectLabel.maxWidth = collect_config.label_max_width
    self.collectLabel.baseScale = collect_config.label_max_scale
    inherit(self.collectLabel, LabelNumRoll)
    local function parseValue1(num)
        local str = FONTS.formatByCount4(num, 12, true, true)
        return str
    end
    self.collectLabel:nrInit(0, 24, parseValue1)
end
function cls:getUpTime()
    return self._upTime or 0.2
end
function cls:getFlyTime()
    return self._flyTime or 0.3
end
function cls:_updateLoopSpine(isLock)
    if isLock then
        self.loopAni:setVisible(false)
    else
        self.loopAni:setVisible(true)
    end
end
function cls:_addReceiveLight()
    local downData = {}
    downData.parent = self.collectItem
    downData.file = self.ctl:getSpineFile("collect_receive")
    downData.animateName = "animation"
    downData.zOrder = 1
    bole.addAnimationSimple(downData)
    if self.m1Spine and bole.isValidNode(self.m1Spine) then
        self.m1Spine:setAnimation(0, "animation2", false)
        self.m1Spine:addAnimation(0, "animation1", true)
    end
end
function cls:getCollectNodeWorldPos()
    local wEndPos = self.collectItem:convertToWorldSpace(cc.p(-72, 0))
    return wEndPos
end
function cls:updateCollectCount(newCount, beforeCount, isAnimate)
    beforeCount = beforeCount or 0
    self:setCollectNum(newCount, beforeCount, isAnimate)
end

---@param status /1:打开，2:关闭，0:忽略
function cls:setCloseTipStatus(status)
    self.closeTipStatus = status
end
function cls:getCloseTipStatus()
    return self.closeTipStatus or 2
end
function cls:flyItemActions(info)

    local endWPos = self:getCollectNodeWorldPos()
    local endNPos = bole.getNodePos(self.flyNode, endWPos)

    self.ctl:playMusicByName("collect_fly")
    for i = 1, #info do
        local file = self.ctl:getSpineFile("collect_fly")
        local data = {}
        data.file = file
        data.parent = self.flyNode
        data.pos = info[i][3]
        data.animateName = "animation2"
        local _, s = bole.addAnimationSimple(data)
        s:runAction(
                cc.Sequence:create(
                        cc.DelayTime:create(5 / 30),
                        cc.CallFunc:create(function()
                            self:addPractice(s)
                            self:_parabolaToAnimation(s, endNPos)
                        end)

                )
        )
    end
end
function cls:addPractice(parentNode)
    local p1 = self.ctl:getParticleFile("bonus_tail")
    local p2 = self.ctl:getParticleFile("bonus_lizi_tail")
    local s1 = cc.ParticleSystemQuad:create(p1)
    local s2 = cc.ParticleSystemQuad:create(p2)
    parentNode:addChild(s1, -1)
    parentNode:addChild(s2, -1)
end
function cls:_parabolaToAnimation(obj, to)
    local from = bole.getPos(obj)
    local half = cc.pMidpoint(to, from)
    local a = to.y - from.y
    local b = to.x - from.x
    local a1 = half.y - b / 2
    local b1 = half.x + a / 2
    local dur = 13 / 30
    obj:runAction(
            cc.Sequence:create(
                    cc.Spawn:create(
                            cc.BezierTo:create(dur, { from, cc.p(b1, a1), to }),
                            cc.ScaleTo:create(dur, 0.2)
                    ),
                    cc.DelayTime:create(15 / 30),
                    cc.RemoveSelf:create()
            )
    )
end

function cls:setCollectNum(nowCount, beforeCount, isAnimate)

    local value_str = FONTS.formatByCount4(nowCount, 12, true, true)
    self.collectLabel:setString(value_str)
    bole.shrinkLabel(self.collectLabel, self.collectLabel.maxWidth, self.collectLabel.baseScale)
    if isAnimate then
        bole.shrinkLabel(self.collectLabel, self.collectLabel.maxWidth, self.collectLabel.baseScale)
        self.collectLabel:nrStartRoll(beforeCount, nowCount, self:getUpTime())
        self:_playReceiveAni()
    end
end
function cls:_playReceiveAni()
    local data = {}
    data.file = self.ctl:getSpineFile("collect_receive")
    data.parent = self.collectRoot
    data.pos = self:receivePos()
    bole.addAnimationSimple(data)
end
function cls:receivePos()
    local pos = bole.getPos(self.collectItem)
    return cc.pSub(pos, cc.p(72, 0))
end

return cls





