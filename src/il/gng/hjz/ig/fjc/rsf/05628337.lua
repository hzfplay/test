local ___tab_efgkq = {}
local ___tab_zxtyj = {}
local ____sc = nil
local ___tab_kaxsz = {}
local ____veu = nil
local ___tab_vlhd = {}
local ____fmp = nil
local ___str_zthmv = "qkppr"
local ___int_tg = 43
local ____lm = nil
local ___tab_ieujl = {}
local ____ncjgk = nil
local ___int_kb = 47
local ___tab_qcmk = {}
local ___int_ryb = 99
local ___bool_ywgzm = false
local ___str_chii = "ytz"
local ___int_zrg = 18
local ___int_ay = 0
local ___bool_ecajn = false
local ___bool_qi = false
local ____byv = nil
local ___tab_psp = {}
local ____cbjqi = nil
local ___str_epm = "ltpco"
local ___str_frhhc = "iwg"
local ____cew = nil

local function ___xpf()
	local int_br = 54
	local _swen = nil
	local str_pic = "yoz"
	local str_svinz = "pudycd"
end

local function ___mxs()
	local bool_unzo = false
	local str_pkut = "mvaps"
	local bool_fz = false
	local str_rith = "rqf"
end

local function ___sfad()
	local _vouzw = nil
	local int_lfvj = 59
	local bool_gzhs = false
	local int_xseos = 74
end

local function ___hlqez()
	local tab_nn = {}
	local bool_sbohl = false
	local _zy = nil
end

local function ___xhyui()
	local int_vavdk = 47
	local tab_dxi = {}
	local str_cacwl = "esadc"
	local _wzial = nil
	local bool_laa = false
end

local function ___zzbln()
	local int_jytzt = 68
	local int_kyqa = 29
	local int_se = 63
	local tab_dbxpr = {}
end

local function ___tc()
	local int_ilbsc = 64
	local str_hbvn = "lteqao"
	local _mypm = nil
end

local function ___ufnv()
	local _dc = nil
	local tab_wfvg = {}
	local int_yqvyx = 25
	local str_unucg = "enfsf"
	local tab_gsccm = {}
end

local function ___qqdv()
	local bool_uj = false
	local int_ecwkr = 15
	local tab_jl = {}
end

local function ___bscxy()
	local int_vf = 45
	local str_fv = "jfx"
	local _jkz = nil
	local str_vk = "qscisi"
	local str_ncnxi = "yeszv"
end

local function ___at()
	local _zi = nil
	local str_twt = "encz"
	local _bw = nil
	local str_ov = "ojd"
end

local function ___oa()
	local str_rl = "hzxh"
	local _nc = nil
	local bool_wabfd = false
	local int_dmw = 61
	local str_ys = "hdazyc"
end

local function ___ze()
	local tab_gfqz = {}
	local tab_yp = {}
	local tab_deg = {}
	local bool_os = false
	local bool_rweux = false
end

local function ___ch()
	local int_zzyd = 51
	local int_pe = 94
	local str_gux = "nyrx"
end

local function ___ftwwk()
	local bool_vlvj = false
	local tab_fkown = {}
	local bool_ezu = false
	local int_wni = 30
end

local function ___dw()
	local bool_pqvj = false
	local int_fna = 51
	local tab_zabr = {}
	local _vyaes = nil
	local bool_yto = false
end

local function ___txcw()
	local tab_uvk = {}
	local _kzb = nil
end

local function ___oxo()
	local str_bj = "vjntt"
	local str_bzssh = "zew"
end

local function ___jjys()
	local int_wf = 67
	local int_bs = 18
	local int_tmutu = 18
end

local function ___jdcx()
	local int_cqb = 53
	local int_wus = 31
	local int_ykvcx = 67
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2020/12/29 20:46
local cls = class("ThemeGRII_CollectView")
function cls:ctor(ctl, parent, flyNode)
    self.ctl = ctl
    self.node = parent
    self.flyNode = flyNode
end
function cls:initCollectRoot()

    local collect_config = self.ctl:getGameConfig().collect_config
    self.startPosX = collect_config.progress_start_x
    self.startPosY = collect_config.progress_y

    self.maxMapPoint = collect_config.max_point
    self.moveAllDistance = collect_config.progress_end_x - self.startPosX

    self.collectRoot = self.node:getChildByName("root")
    self.openStoreBtn = self.collectRoot:getChildByName("btn_map")

    self.unlockStoreBtn = self.collectRoot:getChildByName("btn_unlock")
    self.bgSpineNode = self.collectRoot:getChildByName("bg_spine")
    self.topSpineNode = self.collectRoot:getChildByName("spine_node")
    self.lockNode = self.collectRoot:getChildByName("lock_node")

    self.progressPanel = self.collectRoot:getChildByName("pro_panel")
    self.progressCell = self.progressPanel:getChildByName("node")
    self.progressCell:setPositionY(self.startPosY)
    self.loopNode = self.collectRoot:getChildByName("loop_node")
    self.collectItem = self.collectRoot:getChildByName("collect_item")
    self.mapNode = self.collectRoot:getChildByName("map_node")
    --self.collectTipNode = self.collectRoot:getChildByName("tip_node")

    self:_setFeatureEvent()
    self:_addCollectSpine()
    self:initCollectTipNode()
end
function cls:initCollectTipNode ()

    local csb_path = self.ctl:getCsbPath("collect_tip")
    self.collectTipNode = cc.CSLoader:createNode(csb_path)
    self.flyNode:addChild(self.collectTipNode)
    self.collectTipNode:setPosition(cc.p(360, 584))
    self.collectTipNode:setVisible(false)
end

function cls:_addCollectSpine()
    local topData = {}
    topData.parent = self.loopNode
    topData.file = self.ctl:getSpineFile("collect_loop")
    topData.isLoop = true
    topData.pos = cc.p(22, 0)
    topData.animateName = "animation1"
    local _, s0 = bole.addAnimationSimple(topData)
    self.loopAni = s0

    local downData = {}
    downData.parent = self.collectItem
    downData.file = self.ctl:getSpineFile("collect_item")
    downData.isLoop = true
    downData.animateName = "animation1"
    downData.pos = cc.p(0, 0)
    local _, s = bole.addAnimationSimple(downData)
    self.m1Spine = s
    self:progressUping()
    local mapData = {}
    mapData.parent = self.mapNode
    mapData.file = self.ctl:getSpineFile("collect_map")
    mapData.isLoop = true
    mapData.pos = cc.p(0, 0)
    local _, s2 = bole.addAnimationSimple(mapData)
    self.btnMapSpine = s2
end
function cls:_updateLoopSpine(isLock)

    if isLock then
        self.loopAni:setVisible(false)
    else
        self.loopAni:setVisible(true)
    end
end
function cls:progressUping()
    local proHeadData = {}
    proHeadData.parent = self.progressCell
    proHeadData.file = self.ctl:getSpineFile("collect_uping")
    proHeadData.pos = cc.p(0, 0)
    proHeadData.isLoop = true
    local _, s1 = bole.addAnimationSimple(proHeadData)
    self.upSpine = s1
end

function cls:_updateUping(isAnimate)

    local status = true
    if self.ctl:getMapPoint() == 0 or self.ctl:getMapPoint() == self.maxMapPoint then
        status = false
    elseif self.ctl:getIsLockFeature() then
        status = false
    end
    if self.upSpine:isVisible() == status then
        return
    else
        if isAnimate then
            self.upSpine:stopActionByTag(1001)
            if not status then
                local a1 = cc.FadeOut:create(0.2)
                local a2 = cc.Hide:create()
                local a3 = cc.Sequence:create(a1, a2)
                a3:setTag(1001)
                self.upSpine:runAction(a3)
            else
                local a1 = cc.FadeIn:create(0.2)
                a1:setTag(1001)
                self.upSpine:setVisible(true)
                self.upSpine:runAction(a1)
            end
        else
            self.upSpine:setVisible(status)
        end
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
function cls:_setFeatureEvent()
    local function open_store_fun(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            self.btnMapSpine:setColor(cc.c3b(255, 255, 255))
            self.ctl:clickMapBtn()
        end
        if eventType == ccui.TouchEventType.began then
            if self.ctl._mainViewCtl:getCanTouchFeature() then
                self.btnMapSpine:setColor(cc.c3b(100, 100, 100))
            end
        end
        if eventType == ccui.TouchEventType.canceled then
            self.btnMapSpine:setColor(cc.c3b(255, 255, 255))
        end
    end

    local unlock_store_fun = function(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            self.ctl:clickUnLockBtn()
        end
    end

    self.openStoreBtn:addTouchEventListener(open_store_fun)
    self.openStoreBtn:setTouchEnabled(true)

    self.unlockStoreBtn:addTouchEventListener(unlock_store_fun)
    self.unlockStoreBtn:setTouchEnabled(true)
end
function cls:getFlyStoreCoinWorldPos()
    local wEndPos = self.collectItem:convertToWorldSpace(cc.p(0, 0))
    return wEndPos
end
function cls:updateCollectCount(newCount, beforeCount, isAnimate)
    if newCount > self.maxMapPoint then
        newCount = self.maxMapPoint
    end
    local newPosX = self.startPosX + newCount / self.maxMapPoint * self.moveAllDistance
    if isAnimate then
        if beforeCount > self.maxMapPoint then
            beforeCount = self.maxMapPoint
        end
        local oldPosX = self.startPosX + beforeCount / self.maxMapPoint * self.moveAllDistance
        local aniList = {}
        local a1 = cc.MoveTo:create(15 / 30, cc.p(newPosX, self.startPosY))
        table.insert(aniList, a1)
        if newCount >= self.maxMapPoint then
            local a2 = cc.CallFunc:create(function()
                self:playCollectFull()
            end)
            table.insert(aniList, a2)
        end
        self.progressCell:setPositionX(oldPosX)
        self.progressCell:runAction(
                cc.Sequence:create(bole.unpack(aniList))
        )
        self:_addReceiveLight()
    else
        self.progressCell:setPositionX(newPosX)
    end
    self:_updateUping(isAnimate)


end
function cls:playCollectFull()

    local data = {}
    data.file = self.ctl:getSpineFile("collect_loop")
    data.animateName = "animation2"
    data.parent = self.topSpineNode
    bole.addAnimationSimple(data)
    self.ctl:playMusicByName("collect_full")
    if self.m1Spine and bole.isValidNode(self.m1Spine) then
        self.m1Spine:setAnimation(0, "animation3", false)
        self.m1Spine:addAnimation(0, "animation1", true)
    end

end
function cls:setCollectPartState(isLock, isAnimate)
    if not self.lockSuperSpine then
        local data = {}
        data.file = self.ctl:getSpineFile("collect_lock")
        data.parent = self.lockNode
        data.isRetain = true
        data.pos = cc.p(0, -2)
        local _, s = bole.addAnimationSimple(data)
        self.lockSuperSpine = s
    end
    if isLock then
        local aniName = "animation1"
        if isAnimate then
            self.ctl:playMusicByName("collect_lock")
        end
        self.lockSuperSpine:setAnimation(0, aniName, false)
        self:changeStoreTipState(true)
    else
        local aniName = "animation3"
        self.lockSuperSpine:setAnimation(0, aniName, false)
        if isAnimate then
            self.ctl:playMusicByName("collect_unlock")
        end
        self:changeStoreTipState()
    end
    self:_updateUping(isAnimate)
    self:_updateLoopSpine(isLock)
end
---@param status /1:打开，2:关闭，0:忽略
function cls:setCloseTipStatus(status)
    self.closeTipStatus = status
end
function cls:getCloseTipStatus()

    return self.closeTipStatus or 2
end
function cls:changeStoreTipState(isClose)
    local closeType = self:getCloseTipStatus()
    if closeType == 0 and not isClose then
        return
    end
    if not self.collectTipNode or not bole.isValidNode(self.collectTipNode) then
        return
    end
    local cur_isClose = closeType == 2
    local next_isClose = isClose
    if cur_isClose and next_isClose then
        return
    end
    if closeType == 1 then
        self.collectTipNode:stopAllActions()
        --if notAni then
        --    self:setCloseTipStatus(2)
        --    self.collectTipNode:setVisible(false)
        --else
        if self.collectTipNode:isVisible() then
            self:setCloseTipStatus(0)
            self.collectTipNode:runAction(
                    cc.Sequence:create(
                            cc.ScaleTo:create(0.3, 0),
                            cc.CallFunc:create(function()
                                self:setCloseTipStatus(2)
                            end),
                            cc.Hide:create()
                    )
            )
        else
            self:setCloseTipStatus(2)
        end
        --end
    elseif closeType == 2 then
        --if notAni then
        --    self:setCloseTipStatus(1)
        --    self.collectTipNode:stopAllActions()
        --    self.collectTipNode:setVisible(true)
        --    self.collectTipNode:setScale(1)
        --else
        self:setCloseTipStatus(0)
        self.collectTipNode:setScale(0)
        self.collectTipNode:setVisible(true)
        self.collectTipNode:runAction(
                cc.Sequence:create(
                        cc.ScaleTo:create(0.3, 1),
                        cc.CallFunc:create(function()
                            self:setCloseTipStatus(1)
                        end),
                        cc.DelayTime:create(2),
                        cc.CallFunc:create(
                                function()
                                    self:changeStoreTipState()
                                end)
                )
        )
        --end
    end
end

function cls:flyItemActions(info)

    local endWPos = self.collectItem:convertToWorldSpace(cc.p(0, 0))
    local endNPos = bole.getNodePos(self.flyNode, endWPos)
    self.ctl:playMusicByName("collect_fly")
    for i = 1, #info do
        local file = self.ctl:getSpineFile("collect_fly")
        local data = {}
        data.file = file
        data.parent = self.flyNode
        data.pos = info[i][3]
        data.animateName = "animation3"
        local _, s = bole.addAnimationSimple(data)
        s:runAction(
                cc.Sequence:create(
                        cc.DelayTime:create(5 / 30),
                        cc.CallFunc:create(function()

                            self:_parabolaToAnimation(s, endNPos)
                        end)

                )
        )
    end
end
function cls:_parabolaToAnimation(obj, to)
    local from = bole.getPos(obj)
    local half = cc.pMidpoint(to, from)
    local a = to.y - from.y
    local b = to.x - from.x
    --local dis = math.sqrt(math.pow(a, 2) + math.pow(b, 2))
    local a1 = half.y - b / 2
    local b1 = half.x + a / 2
    --local dur = dis / 1000
    local dur = 10 / 30
    obj:runAction(
            cc.Sequence:create(
                    cc.BezierTo:create(dur, { from, cc.p(b1, a1), to }),
            --cc.DelayTime:create(10 / 30),
                    cc.RemoveSelf:create()
            )
    )
end

return cls





