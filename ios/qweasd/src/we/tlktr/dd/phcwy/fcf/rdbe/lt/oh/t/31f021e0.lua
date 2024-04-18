local ___bool_nfwr = false
local ___str_zg = "iuhp"
local ___tab_whx = {}
local ___int_nsw = 30
local ___tab_nd = {}
local ___str_nqu = "vpcz"
local ___int_mtk = 99
local ___int_mk = 33
local ____cjw = nil
local ___int_bkvl = 48
local ___str_xxhb = "sig"
local ___int_zpbdr = 37
local ___tab_jnq = {}
local ___int_aj = 91
local ___str_xxebi = "fjv"
local ___bool_fk = false
local ___tab_rp = {}
local ___int_hm = 77
local ____cpl = nil
local ___int_el = 2
local ___str_zqz = "raubuh"

local function ___ifuts()
	local _jecvx = nil
	local tab_ub = {}
	local bool_ojr = false
	local int_ux = 41
	local bool_ubsx = false
end

local function ___ngv()
	local bool_ddnj = false
	local tab_ujzk = {}
	local str_mxi = "efpr"
	local tab_cxuu = {}
end

local function ___rukn()
	local bool_sk = false
	local int_dhxgf = 84
end

local function ___jlwib()
	local tab_achlf = {}
	local int_ez = 32
	local tab_nx = {}
	local tab_qgk = {}
	local str_tlnsc = "slhg"
end

local function ___gnnkv()
	local int_qs = 83
	local str_abe = "udxwmk"
	local tab_tsha = {}
	local int_ge = 56
	local bool_tx = false
end

local function ___pz()
	local tab_xsbn = {}
	local _mstxw = nil
	local bool_nc = false
	local str_kqoo = "exf"
end

local function ___wo()
	local _ey = nil
	local tab_lq = {}
end

local function ___rmuib()
	local bool_ghaym = false
	local int_allq = 94
end

local function ___dxgm()
	local _hgex = nil
	local str_jhvm = "vrftia"
	local _ias = nil
	local int_nlpf = 10
	local bool_he = false
end

local function ___ouy()
	local bool_xqid = false
	local _wktf = nil
end

local function ___am()
	local _ajw = nil
	local int_wvd = 62
	local _wy = nil
end

local function ___gigj()
	local bool_ac = false
	local tab_vobxg = {}
	local bool_rksfo = false
	local int_crqt = 28
	local str_pi = "udtp"
end

local function ___tx()
	local _zszq = nil
	local int_ueamk = 52
end

local function ___nm()
	local _whw = nil
	local _ln = nil
	local int_ywtt = 35
	local str_kv = "ased"
end

local function ___qxlpt()
	local int_btdw = 91
	local tab_bnd = {}
	local _xp = nil
	local str_ykj = "tgfbuh"
end

local function ___si()
	local _ajnbg = nil
	local str_tpn = "wozat"
end

local function ___ey()
	local str_jmpm = "zzmgl"
	local str_igh = "zydfi"
	local bool_gibcz = false
	local tab_gmeo = {}
	local bool_ws = false
end

local function ___gvapv()
	local bool_hhbgy = false
	local bool_vaw = false
	local tab_xnx = {}
	local int_uyc = 33
	local str_tyn = "pegrh"
end

local function ___cu()
	local tab_qb = {}
	local tab_cehe = {}
	local bool_sz = false
end

local function ___fxkrb()
	local str_xcwq = "htasy"
	local bool_zru = false
	local str_zhwqo = "dkjhvu"
end

local function ___zkb()
	local _al = nil
	local _kvs = nil
	local _gxdux = nil
	local int_uy = 64
end

local function ___lbmgw()
	local _lx = nil
	local str_qs = "fifzs"
	local int_piomc = 88
	local str_imhms = "auwlho"
	local str_robu = "npa"
end

local function ___ztlp()
	local tab_dvma = {}
	local str_yc = "jgkqp"
end

local function ___wvrfu()
	local tab_pru = {}
	local _pih = nil
	local str_zz = "nekbcw"
	local tab_cu = {}
	local str_jx = "jpyk"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/20 13:26
---
local cls = class("ThemeSlotMachineVView", CCSNode)
function cls:ctor(slotMCtl, parent, csb)
    self.slotMCtl = slotMCtl
    self.parentNode = parent
    self.csb = self.slotMCtl:getPic("csb/") .. "slot_machine_portrait_3x1.csb"
    CCSNode.ctor(self, self.csb)
    self:addToParent()
end
function cls:loadControls(...)
    self.reelRoot = self.node:getChildByName("Node_root_node")
    self.symbolAniNode = self.node:getChildByName("symbol_ani_node")
    self.winKuangAnim = self.node:getChildByName("win_kuang_anim")

    self.dimmer = self.node:getChildByName("dimmer_node") --弹窗用到的dimmer
    self.dimmer:setVisible(false)

    self.reelDimmerNode = self.node:getChildByName("reelDimmerNode")
    self.reelDimmerNode:setVisible(false)

    self.startDialog = self.node:getChildByName("popup_trigger_node")
    self.startDialog:setVisible(false)

    self.collectDialog = self.node:getChildByName("popup_collect_node")
    self.collectDialog:setVisible(false)

    self.slotTransitionDimmer = self.node:getChildByName("tansition_dimmer")
    self.slotTransitionDimmer:setVisible(false)
    self:initStartDialog()
    self:initCollectDialog()
    self:addBgLightAnimation()
end

function cls:addToParent()
    self.parentNode:addChild(self)
end
function cls:addBgLightAnimation(...)
    self.bg_root = self.node:getChildByName("background")
    self.bg_lightAniNode = self.bg_root:getChildByName("bg_light_ani_node")
    local bgFile = self.slotMCtl:getSpineFile("bg_light")
    bole.addSpineAnimation(self.bg_lightAniNode, nil, bgFile, cc.p(0, -57), "animation", nil, nil, nil, true, true, nil)
end
function cls:changeBoardParent()
    self.slotMCtl:changeRootNodeParent(nil, self.reelRoot)
end
function cls:getReelParent()
    return self.reelRoot
end
function cls:updatePaytable(pays)
    self.paytableListNode = self.node:getChildByName("paytable_list")
    self.paytableLabels = {}
    local baseBet = self.slotMCtl:getBaseBet()
    for i = 1, 8 do
        self.paytableLabels[i] = self.paytableListNode:getChildByName("label" .. i)

        local value = pays[i] * self.slotMCtl.avgBet / baseBet
        self.paytableLabels[i]:setString(FONTS.formatByCount4(value, 5, true, true))
    end
end
function cls:initStartDialog(...)
    self.startPopWindowAniNode = self.startDialog:getChildByName("popup_window_ani_node")
    self.btn_start = self.startDialog:getChildByName("btn_start")
end
function cls:initCollectDialog(...)
    self.collectPopWindowAniNode = self.collectDialog:getChildByName("popup_window_ani_node")
    self.btn_collect = self.collectDialog:getChildByName("btn_collect")
    self.label_win = self.collectDialog:getChildByName("label_mapSlotWin")
    local labelInfo = self.slotMCtl:getLabelInfo()
    self.label_win.maxWidth = labelInfo.maxWidth
    self.label_win.maxScale = labelInfo.baseScale or 1
    inherit(self.label_win, LabelNumRoll)
    local function fontFormat(num)
        return FONTS.formatByCount4(num, 15, true)
    end
    self.label_win:nrInit(0, 25, fontFormat)
end
function cls:showPopUpWindowEffect(windowType)
    local parent
    if windowType == "start" then
        parent = self.startPopWindowAniNode
    elseif windowType == "collect" then
        parent = self.collectPopWindowAniNode
    end
    local file = self.slotMCtl:getSpineFile("popup_window")
    bole.addSpineAnimationInTheme(parent, nil, file, cc.p(0, -20), "animation", nil, nil, nil, true, true, nil)
end
----逻辑部分
function cls:drawWinLineSymbols(...)
    self.reelDimmerNode:setVisible(true)
    self.symbolAniNodeList = {}
    local winList = self.slotMCtl.slotRespinData[#self.slotMCtl.slotRespinData]
    for i = 1, 3 do
        local key = winList[i][1]
        self.symbolAniNodeList[i] = cc.Node:create()
        local pos = self.slotMCtl:getCellPos(i, 1)
        self.symbolAniNodeList[i]:setPosition(pos)
        self.symbolAniNode:addChild(self.symbolAniNodeList[i])
        local theCellFile = self.slotMCtl.pics[key]
        local theCellSprite = bole.createSpriteWithFile(theCellFile)
        self.symbolAniNodeList[i]:addChild(theCellSprite)
        self:playSymbolAnimation(self.symbolAniNodeList[i], key)
    end
    self.slotMCtl:playMusicByName("slot_win")
    self.symbolAniNode:runAction(cc.Repeat:create(cc.Sequence:create(
            cc.DelayTime:create(0.3),
            cc.CallFunc:create(function()
                self.symbolAniNode:setVisible(false)
            end),
            cc.DelayTime:create(0.3),
            cc.CallFunc:create(function(...)
                self.symbolAniNode:setVisible(true)
            end)
    ), 9))
    local file2 = self.slotMCtl:getSpineFile("line_kuang")
    local animName = "animation" .. self.slotMCtl.resultIndex
    bole.addSpineAnimationInTheme(self.winKuangAnim, 5, file2, cc.p(0, -57), animName, nil, nil, nil, true, true)
end
function cls:playSymbolAnimation(parent, key)
    local file = self.slotMCtl:getPic("spine/symbols/" .. key .. "/spine")
    local _, s = bole.addSpineAnimationInTheme(parent, 5, file, cc.p(0, 0), "animation", nil, nil, nil, true, true, nil)
end

function cls:showSMStartDialog()
    self.startDialog:setScale(0)
    self.startDialog:setVisible(true)
    self:showPopUpWindowEffect("start")
    local startBtnFile = self.slotMCtl:getSpineFile("btn_start")
    local a1 = cc.DelayTime:create(0.5)
    local a2 = cc.CallFunc:create(function(...)
        bole.addSpineAnimationInTheme(self.btn_start, nil, startBtnFile, cc.p(149, 45.5), "animation", nil, nil, nil, true, true, nil)
        self.startDialog:runAction(cc.Sequence:create(
                cc.ScaleTo:create(0.25, 1.3, 1.3),
                cc.ScaleTo:create(0.15, 1, 1)
        ))
        self.slotMCtl:playMusicByName("slot_popup")
        self.dimmer:setOpacity(0)
        self.dimmer:setVisible(true)
        self.dimmer:runAction(cc.FadeIn:create(0.2))
    end)
    local a3 = cc.DelayTime:create(0.35)
    local a4 = cc.CallFunc:create(function(...)
        self.btn_start:setBright(true)
        self.btn_start:setTouchEnabled(true)
        self:initStartEvent()
    end)
    local a5 = cc.Sequence:create(a1, a2, a3, a4)

    self.node:runAction(a5)
end
function cls:hideSMStartDialog(...)
    self.node:runAction(cc.Sequence:create(
            cc.CallFunc:create(function()
                self.startDialog:setScale(1)
                self.startDialog:runAction(cc.Sequence:create(
                        cc.ScaleTo:create(0.15, 1.3, 1.3),
                        cc.ScaleTo:create(0.25, 0, 0)
                ))
                self.dimmer:setOpacity(255)
                self.dimmer:runAction(cc.FadeOut:create(0.3))
            end),
            cc.DelayTime:create(0.35),
            cc.CallFunc:create(function(...)
                self.startPopWindowAniNode:removeAllChildren()
                self.slotMCtl:showSlotMachineStep(self.slotMCtl.gameData.machineStatus)
            end)
    ))
end
function cls:initStartEvent(...)
    local pressFunc = function(obj)
        self.slotMCtl:stopMusicByName("slot_popup")
        self.slotMCtl:playMusicByName("common_click")
        self:setBtnDisplay(self.btn_start)
        self:hideSMStartDialog()
        self.slotMCtl:changeMachineState(self.slotMCtl.machineStatus.current)
    end
    local function onTouch(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            pressFunc(obj)
        end
    end
    self.btn_start:addTouchEventListener(onTouch)
end
function cls:setBtnDisplay(btn)
    if not btn then
        return
    end
    btn:setTouchEnabled(false)
    btn:setBright(false)
    btn:removeAllChildren()
end
-- 展示结算的弹窗
function cls:showCoinLabelNode(labelCoin, coin, maxWidth, scale)
    if (not labelCoin) or (not coin) then
        return
    end
    local rollupDuration = 2
    scale = scale or 1
    inherit(labelCoin, LabelNumRoll)
    local function fontFormat2(num)
        return FONTS.format(num, true)
    end
    labelCoin:nrInit(0, 25, fontFormat2)
    labelCoin:setString(FONTS.format(coin, true))
    bole.shrinkLabel(labelCoin, maxWidth, scale)
    labelCoin:setString(0)
    labelCoin:nrStartRoll(0, coin, rollupDuration)
end
function cls:showSMColletDialog(...)
    self.collectDialog:setScale(0)
    self.collectDialog:setVisible(true)
    self.slotMCtl:setFooterBtnsEnable(false)
    self:showPopUpWindowEffect("collect")
    self.slotMCtl:playMusicByName("slot_popup")
    local collectBtnFile = self.slotMCtl:getSpineFile("btn_collect")
    local a1 = cc.DelayTime:create(0.5)
    local a2 = cc.CallFunc:create(function(...)
        self:showCoinLabelNode(self.label_win, self.slotMCtl.totalWin, self.label_win.maxWidth, self.label_win.maxScale)
        bole.addSpineAnimationInTheme(self.btn_collect, nil, collectBtnFile, cc.p(149, 45.5), "animation", nil, nil, nil, true, true, nil)
        self.collectDialog:runAction(cc.Sequence:create(
                cc.ScaleTo:create(0.25, 1.3, 1.3),
                cc.ScaleTo:create(0.15, 1, 1)
        ))
        self.dimmer:setOpacity(0)
        self.dimmer:setVisible(true)
        self.dimmer:runAction(cc.FadeIn:create(0.2))
    end)
    local a3 = cc.DelayTime:create(0.35)
    local a4 = cc.CallFunc:create(function(...)
        self.btn_collect:setBright(true)
        self.btn_collect:setTouchEnabled(true)
        self:initCollectEvent()
    end)
    local a5 = cc.Sequence:create(a1, a2, a3, a4)
    self.node:runAction(a5)
end
function cls:initCollectEvent(...)
    local pressFunc = function(obj)
        self.slotMCtl:stopMusicByName("slot_popup")
        self.slotMCtl:playMusicByName("common_click")
        self:setBtnDisplay(self.btn_collect)
        local a1 = cc.CallFunc:create(function(...)
            self.label_win:nrStopRoll()
            self.label_win:setString(FONTS.format(self.slotMCtl.totalWin, true))
        end)
        local a2 = cc.DelayTime:create(0.3)
        local a3 = cc.CallFunc:create(function(...)
            self.collectDialog:setScale(1)
            self.collectDialog:runAction(cc.Sequence:create(
                    cc.ScaleTo:create(0.15, 1.3, 1.3),
                    cc.ScaleTo:create(0.25, 0, 0)
            ))
            self.dimmer:setOpacity(255)
            self.dimmer:runAction(cc.FadeOut:create(0.3))
        end)
        local a4 = cc.DelayTime:create(0.35)
        local a5 = cc.CallFunc:create(function(...)
            self.slotMCtl:exitSlotMachineScene()
        end)
        local a6 = cc.Sequence:create(a1, a2, a3, a4, a5)
        self.node:runAction(a6)
        self.slotMCtl:collectNotice()
    end
    local function onTouch(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            pressFunc(obj)
        end
    end
    self.btn_collect:addTouchEventListener(onTouch)
end
function cls:playDimmerTransitionIn()
    self.slotTransitionDimmer:setOpacity(0)
    self.slotTransitionDimmer:setVisible(true)
    self.slotTransitionDimmer:runAction(cc.FadeIn:create(0.2))
end
function cls:onExit(...)
    -- self.slotMRoot:removeFromParent()
    --self.slotMParent:removeFromParent()
    self:removeFromParent()
end
return cls

