local ___str_qkjvf = "cze"
local ___tab_crxwl = {}
local ___tab_grl = {}
local ___int_xt = 54
local ___str_ls = "xxbvnu"
local ____kjury = nil
local ___str_twqg = "zalm"
local ____xa = nil
local ____otv = nil
local ___tab_oowi = {}
local ___int_nw = 32
local ___bool_jxyir = false
local ___tab_ct = {}
local ___str_agu = "nboig"
local ___int_bclbv = 91
local ___tab_dikd = {}
local ___tab_qpbx = {}
local ____slxz = nil
local ___int_cnbrh = 79
local ____pom = nil
local ___tab_dnalt = {}
local ___int_cwt = 5
local ___tab_hw = {}
local ____chjv = nil
local ___tab_li = {}
local ___bool_oy = false
local ___str_js = "bdn"
local ___bool_hrzl = false
local ____jlaa = nil

local function ___mzxvh()
	local bool_gshb = false
	local int_wmz = 49
end

local function ___toj()
	local bool_dwh = false
	local tab_xoopy = {}
	local str_slnbf = "quaga"
	local bool_knk = false
end

local function ___jqse()
	local str_xie = "crxr"
	local int_cwreb = 83
end

local function ___hg()
	local _dajf = nil
	local bool_qmi = false
	local str_ziv = "gwgyq"
end

local function ___zqlhi()
	local bool_vo = false
	local str_cnj = "isvn"
end

local function ___tbk()
	local _cuos = nil
	local bool_bfhte = false
end

local function ___yhthk()
	local _xtwc = nil
	local tab_wt = {}
	local bool_nu = false
	local str_sp = "thr"
	local _dv = nil
end

local function ___owwt()
	local _jxia = nil
	local _ri = nil
end

local function ___wf()
	local bool_ta = false
	local tab_rdb = {}
	local int_os = 48
	local bool_lfxr = false
	local bool_al = false
end

local function ___jdzer()
	local _fi = nil
	local _gqwji = nil
	local bool_ut = false
	local bool_cwe = false
	local _hx = nil
end

local function ___snos()
	local bool_opud = false
	local _zumi = nil
	local tab_gqe = {}
end

local function ___xfwu()
	local int_bjkzn = 18
	local str_ciuxi = "zmnt"
	local _qp = nil
	local int_rbt = 30
	local tab_vsd = {}
end

local function ___dvu()
	local bool_yaucw = false
	local _wnz = nil
	local str_nlbve = "yderw"
	local _swqux = nil
	local _wajt = nil
end

local function ___xxzc()
	local str_wamo = "iayox"
	local int_svd = 85
end

local function ___qm()
	local bool_pyvff = false
	local tab_wzev = {}
	local bool_xrs = false
	local int_haqfq = 49
	local str_sw = "fxix"
end

local function ___ufcfw()
	local int_mee = 55
	local int_mljhb = 62
end

local function ___mvp()
	local str_esced = "lfm"
	local int_ak = 60
	local tab_atyn = {}
	local tab_oei = {}
end

local function ___fzuz()
	local _ffqoa = nil
	local bool_un = false
	local str_vzhs = "mpxr"
	local tab_den = {}
	local tab_qar = {}
end

local function ___vz()
	local str_mwxjz = "pnw"
	local tab_ktqv = {}
	local str_bgz = "sxwy"
	local _zs = nil
	local int_pd = 32
end

local function ___yg()
	local tab_ya = {}
	local _or = nil
	local str_ptr = "ugnlr"
	local int_lnstn = 24
	local tab_ekh = {}
end

local function ___adk()
	local int_ocvtt = 10
	local int_wlr = 58
	local int_fe = 47
	local _otfgj = nil
	local int_qxfby = 14
end

local function ___qal()
	local str_rnl = "gaub"
	local bool_lblnf = false
	local _ujra = nil
end

local function ___jv()
	local str_izcx = "jytq"
	local int_cdv = 65
end

local function ___yjjig()
	local str_aa = "ujxtgp"
	local int_ns = 21
	local int_evjb = 22
	local str_mn = "ogzzfd"
end

local function ___usskr()
	local bool_icghn = false
	local _un = nil
	local str_vierl = "ddtr"
	local bool_athym = false
end

local function ___vn()
	local int_wafy = 86
	local int_qfpxa = 76
	local bool_fj = false
end

local function ___vbqe()
	local _uk = nil
	local _kloin = nil
	local bool_bwco = false
	local int_taep = 82
	local str_bjw = "rvhtfh"
end
---@program src 2010
---@create: : 2021/02/22 18:00:00
---@author: rwb
---
local cls = class("ThemeTCMainView")
--local TCCommonView = require("Themes/TournCash/Common/ThemeTC_CommonView")
local SpinLayerType

function cls:ctor(mainThemeScene, tcCommonCtl, themeCtl)
    self.mainThemeScene = mainThemeScene
    self.tcCommonCtl = tcCommonCtl
    self.themeCtl = themeCtl
    self:initScene()
end
function cls:getRetCell(col, row)
    local cell = self.spinLayer.spins[col]:getRetCell(row)
    return cell
end
function cls:initScene(...)
    self.bgNode = self.mainThemeScene:getChildByName("theme_bg")
    self.balloonFlyNode = self.mainThemeScene:getChildByName("fly_node")
    self:_initBgNode()
    self:_initBoardNode()
    self.rankNode = self.mainThemeScene:getChildByName("rank_node")
    self:_initRankNode()

    self.top_node = self.mainThemeScene:getChildByName("top_node")
    self.tipNode = self.top_node:getChildByName("tip_node")
    self:_initTipBtn()
    self.stageNode = self.top_node:getChildByName("stage_node")
    self:_initStageNode()
    self.prizePoolNode = self.top_node:getChildByName("progressive")
    self:_initPrizePoolNode()
    self.collectNode = self.top_node:getChildByName("collect_node")
    self:_initCollectNode()
    self.battleNode = self.top_node:getChildByName("battle_node")
    self:_initBattleNode()
    self.multiTipNode = self.mainThemeScene:getChildByName("multi_tip")
    self:_initMultiTipNode()

    self.logoNode = self.mainThemeScene:getChildByName("logo_node")
    --self.dialogNode = self.down_node:getChildByName("dialog_node")
    self.topNode = self.mainThemeScene:getChildByName("top_node2")
    self:_initAddLongLabel()
    self:_initBalloonNode()
    self:_createTournCashNode()
end
function cls:_initAddLongLabel()
    if bole.getAdaptationWidthScreen() then
        local data = {}
        data.file = self.tcCommonCtl:getSpineFile("long_label")
        data.parent = self.logoNode
        local moveY = 320 + self.themeCtl:adaptMoveDownY() / 2
        data.pos = cc.p(0, moveY)
        data.isLoop = true
        bole.addAnimationSimple(data)
    end
end
function cls:getMainThemeScene()
    return self.mainThemeScene
end
function cls:_createTournCashNode()
    local node = TournCashController:getInstance():getDialogClass("TournCashPromotionEntrance").new()
    self.logoNode:addChild(node, 10)
    node:setPositionY(210)
    node:setPositionX(565)
end

--function cls:_addBoardSpine()
--    self.tableBaseSpine:removeAllChildren()
--    local data = {}
--    data.file = self.tcCommonCtl:getSpineFile("base_board")
--    data.parent = self.tableBaseSpine
--    data.isLoop = true
--    data.pos = cc.p(0, 0)
--    data.animateName = "animation2"
--    local _, s = bole.addAnimationSimple(data)
--    self.boardFrameSpine = s
--end

function cls:_initBoardNode(...)
    --self.excitationBg = self.reelRootNode:getChildByName("jili_bg")
    --self.skipNode = self.reelRootNode2:getChildByName("skip_node")
    --self.boardRoot = self.reelRootNode:getChildByName("board_root")
    --self.boardRoot:setLocalZOrder(1)
    --self.animateNode = self.reelRootNode2:getChildByName("animate_node")
    --self.animateNode:setLocalZOrder(4)
    --self.themeAnimateKuang = self.reelRootNode2:getChildByName("win_line")
    --self.themeAnimateKuang:setLocalZOrder(6)
    --
    --self.scatterNode = self.reelRootNode2:getChildByName("scatter_node")
    --self.scatterNode:setLocalZOrder(7)
    self.down_node = self.mainThemeScene:getChildByName("down_node")
    self.down_child = self.down_node:getChildByName("down_child")
    self.reelRootNode2 = self.down_child:getChildByName("node_board_2")
    self.flyNode = self.reelRootNode2:getChildByName("fly_node")
    --self.flyNode:setLocalZOrder(10)
    --
    --self.imgRespinMask = self.reelRootNode2:getChildByName("img_respin_mask")
    --self.imgRespinMask:setLocalZOrder(20)
    --self.imgRespinMask:setVisible(false)
    --self.imgBaseMask = self.reelRootNode2:getChildByName("img_base_mask")
    --self.imgBaseMask:setVisible(false)

end
--function cls:updateBaseUI()
--
--    self.collectNode:setVisible(true)
--    self.tableBase:setVisible(true)
--    self.battleNode:setVisible(false)
--    self.top_node:setPosition(cc.p(0, 244))
--end
--function cls:updateBattleUI()
--    self.collectNode:setVisible(true)
--    self.tableBase:setVisible(true)
--    self.battleNode:setVisible(true)
--    self.top_node:setPosition(cc.p(0, 253))
--end
--function cls:updateRound3UI(isAnimate)
--    self.collectNode:setVisible(true)
--    self.battleNode:setVisible(false)
--    self.top_node:setPosition(cc.p(0, 257))
--    self.multiTipNode:setVisible(false)
--    self.tcCommonCtl:setStartRound(3)
--end
function cls:changeBg(pType)

    local imgBG = { self.baseBg, self.freeBg, self.bonusBg }
    local showBg = imgBG[pType]
    if not showBg then
        return
    end
    if self.curBg ~= showBg then
        local _curBg = self.curBg
        _curBg:runAction(cc.Sequence:create(cc.FadeTo:create(0.5, 0), cc.DelayTime:create(0.5), cc.CallFunc:create(function(...)
            _curBg:setVisible(false)
        end)))
        showBg:setOpacity(0)
        showBg:setVisible(true)
        showBg:runAction(cc.FadeTo:create(0.5, 255))
        self.curBg = showBg
    end
end
function cls:_initBgNode(...)
    self.baseBg = self.bgNode:getChildByName("bg_base")
    self.curBg = self.baseBg
    self.freeBg = self.bgNode:getChildByName("bg_free")
    self.freeBg:setVisible(false)
    self.bonusBg = self.bgNode:getChildByName("bg_bonus")
    self.bonusBg:setVisible(false)

    self.spineBg = self.bgNode:getChildByName("bg_spine")
    local data = {}
    data.file = self.tcCommonCtl:getSpineFile("base_bg")
    data.parent = self.spineBg
    data.isLoop = true
    local _, s = bole.addAnimationSimple(data)
    self.bgSpine = s
    self:adaptBackgroundII(self.bgNode)
end
function cls:adaptBackgroundII(bg)
    local BG_WIDTH = 1560
    local BG_HEIGHT = 720
    if bg then
        local scale = FRAME_WIDTH / BG_WIDTH
        if scale > 1 then
            bg:setScale(bg:getScale() * scale)
        elseif scale < 0.82 then
            local showHeight = bole.getAdaptScale() * BG_HEIGHT
            if showHeight < DESIGN_HEIGHT then
                scale = DESIGN_HEIGHT / showHeight
                bg:setScale(bg:getScale() * scale)
            end
        end
    end
    self.themeCtl:adaptBottomHorizontal(bg, nil, 2)
end
function cls:_initRankNode(...)
    self.tcCommonCtl:getRankCtl():initLayout(self.rankNode, self.flyNode)
end
function cls:_initCollectNode(...)
    self.tcCommonCtl:getCollectViewCtl():initLayout(self.collectNode, self.flyNode)
end
function cls:_initBattleNode(...)
    self.tcCommonCtl:getRankCtl():initBattleLayout(self.battleNode)
end
function cls:_initBalloonNode(...)
    self.ballonBtns = self.mainThemeScene:getChildByName("node_btns")
    self.balloonNoTouchDown = self.ballonBtns:getChildByName("btn_down")
    self.balloonNoTouchTop = self.ballonBtns:getChildByName("btn_top")
    local moveY = self.themeCtl:adaptMoveDownY()
    local adaptMoveY1 = self.balloonNoTouchDown:getPositionY() / bole.getAdaptScale()
    local adaptMoveY2 = self.balloonNoTouchTop:getPositionY() / bole.getAdaptScale()
    self.themeCtl:adaptBottomHorizontal(self.ballonBtns, nil, 2)
    self.balloonNoTouchDown:setPositionY(adaptMoveY1)
    self.balloonNoTouchTop:setPositionY(adaptMoveY2)
    self.tcCommonCtl:getBalloonCtl():initLayout(self.balloonFlyNode)
end
---------------------- multi tip start ------------------------------------------
function cls:_initMultiTipNode()
    self.tcCommonCtl:getMultiCtl():initLayout(self.multiTipNode)
end
---------------------- multi tip end ----------------------------------------
------------------ stage node start ------------------------------------------
function cls:_initStageNode()
    self.tcCommonCtl:getStageViewCtl():initLayout(self.stageNode)
end
------------------ prize pool start --------------------------------
function cls:_initPrizePoolNode()
    self.tcCommonCtl:getPrizePoolCtl():initLayout(self.prizePoolNode)
end
------------------ prize pool end -------------------------------------
-------------------------  tip node start-------------------------
function cls:_initTipBtn()
    self.tipBtn = self.tipNode:getChildByName("tip_btn")
    self:_initTipBtnEvent()
end
function cls:_initTipBtnEvent()
    local click_event = function(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            libDebug.endLog("tourncash")
            PopupController:getInstance():addDialogToPopupFront("game_rules", { controller = self.themeCtl }, nil)
        end
    end
    self.tipBtn:addTouchEventListener(click_event)
end
---@override
function cls:setDelayToFadeOutLoopMusic()

end
---------------------------- tip node end-------------------------

--------------------- time out start -------------------------------------
function cls:playStartGoDialog()
    local data = {}
    data.file = self.tcCommonCtl:getSpineFile("dialog_start")
    data.parent = self.topNode
    data.pos = cc.p(0, 0)
    bole.addAnimationSimple(data)
    self.tcCommonCtl:playMusicByName("sound_num_go")
    if self.bgSpine and bole.isValidNode(self.bgSpine) then
        self.bgSpine:setAnimation(0, "animation2", false)
        self.bgSpine:addAnimation(0, "animation", true)
    end
    self:addForbidTouchLinster()
end
function cls:initBgListen()
    if self.listener then
        return
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    local function onTouchBegan (touch, event)
        return true
    end
    local function onTouchCancelled (touch, event)
        --self.baseBg.startPosition = nil
    end
    local function onTouchEnded (touch, event)
        --if self.baseBg.canTouch then
        --    local location = touch:getLocation()
        --end
    end
    self.baseBg.canTouch = true
    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchCancelled, cc.Handler.EVENT_TOUCH_CANCELLED) -- 同楼上
    listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
    local eventDispatcher = self.topNode:getEventDispatcher() -- 通过它管理当前节点（场景、层、精灵等）的所有事件的分发。
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self.topNode)-- 添加一个事件监听器到事件派发器
    self.listener = listener
end

function cls:addForbidTouchLinster()
    self:initBgListen()
    self.listener:setSwallowTouches(true)
end
function cls:removeForbidTouchLinster()
    if self.listener then
        self.listener:setSwallowTouches(false)
    end
end
------------------ time out end -------------------------------------

return cls










