local ___tab_jclbn = {}
local ___int_fcw = 20
local ___int_gm = 17
local ___tab_vgnq = {}
local ___int_fujo = 39
local ___int_xwxuy = 90
local ___tab_qfvyf = {}
local ___str_iz = "kqoh"
local ____iwfc = nil
local ___int_waqid = 67
local ____pqu = nil
local ___bool_jcwm = false
local ___tab_fq = {}
local ____zw = nil
local ___tab_wy = {}
local ___str_xuhlt = "jmc"
local ___str_lwd = "xukhb"
local ____oqho = nil
local ___bool_zqr = false

local function ___bedp()
	local tab_zxz = {}
	local tab_ntlr = {}
end

local function ___yvb()
	local str_yux = "bttil"
	local tab_vc = {}
end

local function ___upno()
	local str_qs = "vuqiay"
	local str_ecp = "yvdr"
end

local function ___loa()
	local _fyf = nil
	local _hovdf = nil
	local str_mhq = "dhypf"
end

local function ___jvja()
	local _yc = nil
	local tab_zt = {}
	local int_mh = 32
	local str_wjcs = "nqoogo"
end

local function ___yp()
	local _gxp = nil
	local str_vv = "epof"
end

local function ___xml()
	local str_fx = "stzc"
	local str_sbw = "hxye"
	local _mwc = nil
	local tab_iw = {}
end

local function ___aus()
	local _val = nil
	local tab_kykx = {}
	local _zee = nil
	local _bssn = nil
end

local function ___uin()
	local bool_ua = false
	local _if = nil
	local int_fdih = 9
	local bool_cph = false
	local tab_fajbc = {}
end

local function ___hx()
	local int_cc = 19
	local bool_vddf = false
	local _ckicc = nil
end

local function ___lp()
	local bool_glgj = false
	local int_tpl = 11
end

local function ___evr()
	local bool_mnt = false
	local int_beyf = 35
	local tab_yki = {}
	local bool_ao = false
end

local function ___phkd()
	local _zvk = nil
	local str_bfda = "dnbc"
	local int_am = 21
end

local function ___cvn()
	local _zv = nil
	local str_dbcv = "ejjjkm"
end

local function ___owzw()
	local int_yqjp = 15
	local bool_tuc = false
end

local function ___vc()
	local str_pn = "afopog"
	local _uqg = nil
	local int_rzhcc = 93
end

local function ___zwm()
	local _ip = nil
	local bool_ono = false
	local _bpqe = nil
	local tab_wv = {}
end

local function ___llnp()
	local tab_qwns = {}
	local _jq = nil
	local bool_uxgl = false
	local tab_vg = {}
	local tab_shzo = {}
end

local function ___cmci()
	local bool_nzxcn = false
	local tab_yq = {}
	local _pw = nil
	local int_fmx = 58
	local bool_lwsp = false
end
---
--- @program src
--- @description:theme230 wheel
--- @author: rwb
--- @create: 2020/12/29 20:46
---
local multiItem = require (bole.getDesktopFilePath("Theme/ThemeGRII_MultiItem"))   
local cls = class("ThemeGRII_WheelView", CCSNode)
function cls:ctor(wheelCtl, parentNode, data)
    self.ctl = wheelCtl
    self.csb = self.ctl:getCsbPath("wheel")
    self.data = data
    self.parentNode = parentNode
    local wheel_config = self.ctl:getWheelConfig()
    self.totalCount = wheel_config.count
    self.myBonusData = data

    self.stopIndex = self.ctl:getBigWheelIndex() - 1
    self.stopIndex2 = self.ctl:getSmallWheelIndex() - 1

    if self.stopIndex == 0 then
        self.stopAngle = 0
        self.stopAngle2 = 0
    else
        self.stopIndex = -self.stopIndex
        self.stopIndex2 = -self.stopIndex2
        self.stopAngle = (self.stopIndex * 360 / self.totalCount)
        self.stopAngle2 = (self.stopIndex2 * 360 / self.totalCount)
    end
    self.randomMore = math.random(10, 20)
    CCSNode.ctor(self, self.csb)
end
function cls:loadControls()
    self.wheelRoot = self.node:getChildByName("root")
    self.dimmer = self.node:getChildByName("bg")
    self.wheelBgNode = self.wheelRoot:getChildByName("node1")

    self.wheelCenter = self.wheelRoot:getChildByName("node_normal")
    self.wheelLabels = self.wheelCenter:getChildByName("nums")
    self.imgWheelBg = self.wheelCenter:getChildByName("wheel_bg")

    self.wheelMini = self.wheelRoot:getChildByName("node_mini")
    local wheelMiniLabelsNode = self.wheelMini:getChildByName("nums"):getChildren()
    self.wheelMiniLabels = {}
    for key = 1, #wheelMiniLabelsNode do

        local parent = wheelMiniLabelsNode[key]
        self.wheelMiniLabels[key] = multiItem.new(parent, key)
    end

    self.spineNode = self.wheelRoot:getChildByName("node3")
    self.btnSpin = self.spineNode:getChildByName("btn_spin")
    self.btnImgNode = self.spineNode:getChildByName("btn_img_node")

    self.btnSpineNode = self.spineNode:getChildByName("btn_spine")
    self.spineWinNode = self.spineNode:getChildByName("win_node")
    self.winKuangSpine = self.spineNode:getChildByName("win_kuang_spine")
    self.practiceNode = self.spineNode:getChildByName("practice_node")
    self.outerMulti = self.spineNode:getChildByName("win_multi")
    self.outerMulti:setVisible(false)
    self.outerMultiItem = multiItem.new(self.outerMulti, 1)
    
    
end
function cls:addWheelSpine(isStart)
    local data = {}
    data.file = self.ctl:getSpineFile("wheel_btn")
    data.parent = self.btnImgNode
    data.animateName = "animation1"
    data.isLoop = true
    if isStart then
        data.animateName = "animation2"
        data.isLoop = false
    end
    local _, s = bole.addAnimationSimple(data)
    self.wheelBtnSpine = s
    local data1 = {}
    data1.file = self.ctl:getSpineFile("wheel_loop")
    data1.parent = self.winKuangSpine
    data1.isRetain = true
    data1.animateName = "animation"
    data1.pos = cc.p(-4, -10)
    data1.isLoop = true
    local _, s = bole.addAnimationSimple(data1)
    s:setScale(1.25)
end
function cls:changeWheelBtnStatus(isClick)
    bole.spChangeAnimation(self.wheelBtnSpine, "animation2")

end
function cls:wheelRunAni()
    local data1 = {}
    data1.file = self.ctl:getSpineFile("wheel_roll")
    data1.parent = self.practiceNode
    data1.isRetain = true
    data1.animateName = "animation"
    data1.pos = cc.p(-125, 470)
    data1.isLoop = true
    local _, s1 = bole.addAnimationSimple(data1)
    local data2 = tool.tableClone(data1)
    data2.pos = cc.p(125, 470)
    local _, s2 = bole.addAnimationSimple(data2)
    self.particleList = {}
    self.particleList[1] = s1
    self.particleList[2] = s2
end
function cls:wheelStopAni()
    self.practiceNode:removeAllChildren()
end
function cls:hideInnerMulti()
    local index = self.ctl:getSmallWheelIndex()
    local node = self.wheelMiniLabels[index]
    node:setVisible(false)
end
function cls:showInnerMulti()
    local index = self.ctl:getSmallWheelIndex()
    local node = self.wheelMiniLabels[index]
    node:setVisible(true)
end
function cls:addWheelWinAni(win_index)
    if win_index == 2 and self.ctl:checkHaveMiniWin() then

        local data = {}
        data.file = self.ctl:getSpineFile("wheel_stop_win")
        data.parent = self.spineWinNode
        data.animateName = "animation3_1"
        bole.addAnimationSimple(data)
        self:hideInnerMulti()
        self.node:runAction(
                cc.Sequence:create(
                        cc.DelayTime:create(50 / 30),
                        cc.CallFunc:create(
                                function()
                                    self:showInnerMulti()
                                end)

                )
        )
        self.outerMultiItem:setMultiWinAni()
    end
    if win_index == 1 then
        local data = {}
        data.parent = self.spineWinNode
        data.file = self.ctl:getSpineFile("wheel_stop_win")
        data.isRetain = true
        self.ctl:addWinJpAni()
        local loopAni
        if self.ctl:checkWinGrand() then
            data.animateName = "animation1_1"
            loopAni = "animation1_2"
            data.pos = cc.p(0, 0)
        elseif self.ctl:checkWinFree() then
            data.animateName = "animation2_1"
            loopAni = "animation2_2"
            data.pos = cc.p(0, 20)
        elseif self.ctl:checkWinJackpot() then
            data.animateName = "animation1_2"
            loopAni = "animation1_2"
            data.pos = cc.p(0, 0)
        else
            data.animateName = "animation2_2"
            loopAni = "animation2_2"
            data.pos = cc.p(0, 20)
        end

        local _, s = bole.addAnimationSimple(data)
        if loopAni then
            s:addAnimation(0, loopAni, true)
        end
        if not self.ctl:checkHaveMiniWin() then
            self:playGoodNotify()
        end
    end

end
function cls:stopWheelMiniByNormal()
    if self.ctl:checkWinGrand() or self.ctl:checkWinFree() then
        self:exitMini()
    end
end
function cls:dealWheelMiniByNormal()
    if self.ctl:checkWinGrand() or self.ctl:checkWinFree() then
        self.ctl:setWheelSpinFinish(2)
    end
end

function cls:wheelFinalPosY()
    local center_posY = -420 - bole.getAdaptReelBoardY()
    return center_posY
end
function cls:showWheelScreen(isStart)
    self:initStartLayout(isStart)
    self.parentNode:addChild(self)
    self.wheelRoot:setPosition(0, -2000)
    local center_posY = self:wheelFinalPosY()
    self.wheelRoot:runAction(
            cc.Sequence:create(
                    cc.MoveTo:create(0.2, cc.p(0, center_posY + 20)),
                    cc.MoveTo:create(0.2, cc.p(0, center_posY)),
                    cc.CallFunc:create(function()
                        if not isStart then
                            self:initWheelEvent()
                        end
                    end)
            )
    )
end
function cls:closeWheelScene()
    --self.ctl:playMusicByName("wheel_disappear")
    --self.wheelRoot:setPosition(0, 0)
    --self:dimmerOut(0.2)
    local center_posY = self:wheelFinalPosY()
    self.wheelRoot:runAction(
            cc.Sequence:create(
                    cc.MoveTo:create(0.2, cc.p(0, center_posY + 20)),
                    cc.MoveTo:create(0.2, cc.p(0, -2000)),
                    cc.CallFunc:create(
                            function()
                                self:removeFromParent()
                            end)
            )
    )
end
function cls:initWheelNumber()
    local wheelConfig = self.ctl:getWheelConfig()

    local chooseIndex = self.ctl:getWheelChoose()
    local big_wheel_config = wheelConfig.big_wheel[chooseIndex]
    local small_wheel_config = wheelConfig.mini_multi[chooseIndex]
    for key = 1, self.totalCount do
        if big_wheel_config[key] < 100 then
            local multi = big_wheel_config[key]
            local bet = self.ctl:getCurTotalBet()
            local str = FONTS.formatByCount4(multi * bet, 4, true, true)
            local strNode = self.wheelLabels:getChildByName("font_" .. key)
            strNode:setString(str)
            bole.shrinkLabel(strNode, 180, 1)

        end
        local str = small_wheel_config[key]
        self.wheelMiniLabels[key]:setString(str)
    end
    local mini_multi = small_wheel_config[self.ctl:getSmallWheelIndex()]
    self.outerMultiItem:setString(mini_multi)
end
function cls:initStartLayout(isStart)

    self:initWheelNumber()
    self:addWheelSpine(isStart)

end
function cls:initWheelEvent()
    local isClick = false

    local pressFunc = function(obj, eventType)
        isClick = true
        self.ctl:playMusicByName("wheel_click")

        self:setStartRoll()
    end

    local function onTouch2(obj, eventType)
        if isClick then
            return nil
        end
        if eventType == ccui.TouchEventType.ended then
            self:changeWheelBtnStatus(true)
            pressFunc()
        end
    end
    self.btnSpin:addTouchEventListener(onTouch2)-- 设置按钮
end
function cls:setStartRoll()
    self.btnSpin:setTouchEnabled(false)
    self.ctl:startSpin()
    self.ctl:saveBonus()

    self:runAction(cc.Sequence:create(
            cc.DelayTime:create(4 / 30), -- 按钮特效时间
            cc.CallFunc:create(function()
                self:wheelRunAni()
                self:spinWheel()
            end)
    ))
end
function cls:spinWheel()
    local function finishSpin()
        self.normalWheel = nil
        self.ctl:saveBonus()
        self:runAction(cc.Sequence:create(
                cc.CallFunc:create(function()
                    self.wheelCenter:runAction(cc.RotateBy:create(0.3, -self.randomMore))
                    self.ctl:setWheelSpinFinish(1)
                    self:dealWheelMiniByNormal()
                    self.ctl:saveBonus()
                end),
                cc.DelayTime:create(0.3),
                cc.CallFunc:create(function()
                    self:addWheelWinAni(1)
                    self:wheelStopAni()
                    self:stopWheelMiniByNormal()

                end),
                cc.DelayTime:create(2),
                cc.CallFunc:create(function()
                    self.ctl:spinWheelFinish(1)
                    if self.ctl:checkWinGrand() or self.ctl:checkWinFree() then
                        self.ctl:spinWheelFinish(2)
                    end
                end)))
    end

    local speed = self.ctl:getWheelConfig().speed_config
    local wheelData = tool.tableClone(speed)
    wheelData.endAngle = self.stopAngle + self.randomMore
    self.normalWheel = BaseWheelExtend.new(self, self.wheelCenter, nil, wheelData, finishSpin)
    self.normalWheel:start()

    local speed2 = self.ctl:getWheelConfig().speed_mini_config
    local wheelData2 = tool.tableClone(speed2)
    wheelData2.endAngle = self.stopAngle2 + self.randomMore
    local function finishSpin2()
        self.miniWheel = nil
        self:runAction(cc.Sequence:create(
                cc.CallFunc:create(function()
                    self.wheelMini:runAction(cc.RotateBy:create(0.5, -self.randomMore))
                    self.ctl:setWheelSpinFinish(2)
                    self.ctl:saveBonus()
                end),
                cc.DelayTime:create(0.5),
                cc.CallFunc:create(function()
                    self:addWheelWinAni(2)
                end),
                cc.DelayTime:create(2),
                cc.CallFunc:create(function()
                    if not self.ctl:checkWinGrand() and not self.ctl:checkWinFree() then
                        self.ctl:spinWheelFinish(2)
                    end
                end)))
    end
    self.miniWheel = BaseWheelExtend.new(self, self.wheelMini, nil, wheelData2, finishSpin2)
    self.miniWheel:start()
    if self.ctl:checkWinGrand() or self.ctl:checkWinFree() then
        self.ctl:playMusicByName("wheel_roll2")
    else
        self.ctl:playMusicByName("wheel_roll")
    end

end
function cls:playGoodNotify()

    local data = {}
    data.file = self.ctl:getSpineFile("jili_good_luck")
    self.ctl:playMusicByName("wheel_notify")
    data.parent = self.btnSpineNode
    data.pos = cc.p(0, 400)
    bole.addAnimationSimple(data)

end
function cls:setFinishUI()
    self.wheelCenter:setRotation(self.stopAngle)
    self.wheelMini:setRotation(self.stopAngle2)
end
function cls:wheelLaterCallback(tm, func)

    self.winKuangSpine:runAction(
            cc.Sequence:create(
                    cc.DelayTime:create(tm),
                    cc.CallFunc:create(func)
            )
    )
end

function cls:onExit()
    self:exitNormal()
    self:exitMini()
    self.ctl:stopMusicByName("wheel_roll2")
    self.ctl:stopMusicByName("wheel_roll")
end
function cls:exitMini()

    if self.miniWheel and self.miniWheel.scheduler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.miniWheel.scheduler)
        self.miniWheel.scheduler = nil
    end
end
function cls:exitNormal()
    if self.normalWheel and self.normalWheel.scheduler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.normalWheel.scheduler)
        self.normalWheel.scheduler = nil
    end
end

return cls