local ___int_rgua = 33
local ____vvfrz = nil
local ___bool_rz = false
local ___int_ryc = 51
local ____dy = nil
local ___bool_cpg = false
local ____ofn = nil
local ____cyway = nil
local ___tab_hn = {}
local ___int_vwprn = 69
local ____jepwk = nil
local ___str_oz = "mcqmp"
local ___tab_gyh = {}
local ___tab_caru = {}
local ___bool_fwvci = false
local ____lz = nil
local ___int_sxvo = 97
local ___bool_vvsdy = false
local ___bool_afx = false
local ___bool_aywo = false
local ___tab_vil = {}

local function ___tiz()
	local _iefqx = nil
	local bool_kbdvo = false
	local int_ltia = 47
end

local function ___vot()
	local bool_ty = false
	local bool_ovr = false
	local _wvz = nil
end

local function ___yza()
	local tab_alje = {}
	local _oilb = nil
	local _hmsyc = nil
end

local function ___jsn()
	local bool_dne = false
	local tab_fsgv = {}
	local str_dhtj = "pjrh"
end

local function ___uhow()
	local _pd = nil
	local bool_ebkat = false
	local _raug = nil
	local str_mubx = "hfjdpm"
	local int_mg = 62
end

local function ___yxr()
	local int_sajg = 43
	local int_hm = 8
	local tab_hqn = {}
	local int_kw = 66
	local _ykt = nil
end

local function ___rwf()
	local int_wc = 80
	local _emrxu = nil
end

local function ___wln()
	local str_bodd = "yczw"
	local int_viaa = 65
	local str_de = "dpe"
	local bool_jldvh = false
end

local function ___dtek()
	local _obczx = nil
	local int_thw = 99
end

local function ___jvuxy()
	local bool_wsjhs = false
	local _cuzi = nil
end

local function ___tmgq()
	local str_wxsl = "xeve"
	local int_apa = 92
	local tab_xj = {}
	local bool_letbf = false
	local int_bdpvr = 34
end

local function ___dy()
	local str_vbh = "bwj"
	local bool_on = false
	local int_efs = 3
end

local function ___wdukq()
	local tab_wmbot = {}
	local _qdqc = nil
	local str_jyl = "ahhzxu"
end

local function ___rikt()
	local bool_req = false
	local tab_proqs = {}
end

local function ___acx()
	local tab_xsuy = {}
	local _tpsy = nil
end

local function ___tgo()
	local _jsku = nil
	local int_hjh = 90
	local _rwbu = nil
end

local function ___sg()
	local _tlcsj = nil
	local int_qdbvh = 31
end

local function ___oplc()
	local _cmsb = nil
	local tab_ymsi = {}
end

local function ___sigj()
	local int_gs = 64
	local int_iwao = 45
	local _czeke = nil
	local str_qsbgt = "alvinj"
end

local function ___kxh()
	local bool_uexf = false
	local _zfaf = nil
	local bool_muox = false
	local int_wfbl = 37
	local bool_loi = false
end

local function ___vrzzb()
	local int_bvwn = 75
	local str_yxpfn = "ptgsqn"
end

local function ___ek()
	local _qicr = nil
	local bool_nd = false
	local str_uca = "jopg"
	local _pv = nil
end

local function ___carj()
	local bool_wp = false
	local _ije = nil
	local bool_kw = false
end

local function ___ehzdk()
	local str_fer = "eum"
	local _psmw = nil
	local bool_xdaz = false
end

local function ___doi()
	local bool_znb = false
	local bool_rz = false
	local int_mmps = 50
	local bool_kjk = false
	local bool_ej = false
end

local function ___yywml()
	local bool_urq = false
	local tab_dfug = {}
	local _qea = nil
end

local function ___tsd()
	local tab_xehef = {}
	local bool_aoa = false
end
--[[
Author: xiongmeng
Date: 2021-03-25 18:40:01
LastEditors: xiongmeng
LastEditTime: 2021-04-26 21:18:41
Description: 
--]]
local cls = class("ThemeSlotMachineVI_View", CCSNode)
function cls:ctor(slotMCtl, parent)
    self.slotMCtl = slotMCtl
    self.parentNode = parent
    self.csb = self.slotMCtl:getPic("csb/") .. "slot_machine_v.csb"
    CCSNode.ctor(self, self.csb)
    self:addToParent()
end
function cls:loadControls(...)
    self.reelRoot = self.node:getChildByName("Node_root_node")
    self.symbolAniNode = self.node:getChildByName("symbol_ani_node")
    self.winKuangAnim = self.node:getChildByName("win_kuang_anim")
    self.downNode = self.node:getChildByName("down_node")
    self.backgroundNode = self.node:getChildByName("background")
    local reel_bg = self.node:getChildByName("reel_bg")
    reel_bg:setScaleX(1.01)
    self:addBoardAnimation()
end

function cls:addToParent()
    self.parentNode:addChild(self)
    bole.adaptReelBoard(self.node)
    if self.backgroundNode then
        bole.adaptReelBoard(self.backgroundNode, -1)
    end
end
function cls:addBoardAnimation(...)
    self.bg_lightAniNode = self.downNode:getChildByName("bg_light_ani_node")
    local bgFile = self.slotMCtl:getSpineFile("bg_light")
    local _,spine = bole.addSpineAnimationInTheme(self.bg_lightAniNode, nil, bgFile, cc.p(0, 60), "animation", nil, nil, nil, true, true, nil)
    self.bgLightSpine = spine
end
function cls:changeBoardParent()
    self.slotMCtl:changeRootNodeParent(nil, self.reelRoot)
end
function cls:getReelParent()
    return self.reelRoot
end
function cls:updatePaytable(pays)
    self.paytableListNode = self.downNode:getChildByName("paytable_list")
    self.paytableLabels = {}
    local baseBet = self.slotMCtl:getBaseBet()
    for i = 1, 8 do
        self.paytableLabels[i] = self.paytableListNode:getChildByName("label" .. i)

        local value = pays[i] * self.slotMCtl.avgBet / baseBet
        self.paytableLabels[i]:setString(FONTS.formatByCount4(value, 5, true, true))
    end
end
----逻辑部分
function cls:drawWinLineSymbols(...)
    -- self.reelDimmerNode:setVisible(true)
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
    self.symbolAniNode:stopAllActions()
    if self.bgLightSpine and bole.isValidNode(self.bgLightSpine) then
        bole.spChangeAnimation(self.bgLightSpine, "animation2", true)
    end
    self.slotMCtl:setFooterBtnsEnable(false)
    local file2 = self.slotMCtl:getSpineFile("line_kuang")
    local animName = "animation" .. self.slotMCtl.resultIndex
    bole.addSpineAnimationInTheme(self.winKuangAnim, 5, file2, cc.p(0, 0), animName, nil, nil, nil, true, true)
end
function cls:playSymbolAnimation(parent, key)
    local file = self.slotMCtl:getPic("spine/symbols/" .. key .. "/spine")
    local _, s = bole.addSpineAnimationInTheme(parent, 5, file, cc.p(0, 0), "animation", nil, nil, nil, true, true, nil)
end
function cls:showSMStartDialog()
    local theData = {}
    local csbName = self.slotMCtl:getPopupCsb()
    local dialogName = "dailog_start"
    local btnStart = nil
    theData.click_event = function ( ... )
        self:setBtnDisplay(btnStart)
        self.slotMCtl:stopMusicByName("slot_popup")
        self.slotMCtl:changeMachineState(self.slotMCtl.machineStatus.current)
        self.slotMCtl:laterCallBack(1, function ()
            self.slotMCtl:showSlotMachineStep(self.slotMCtl.gameData.machineStatus)
        end)
	end
    self.slotMCtl:playMusicByName("slot_popup")
    local dailog = self.slotMCtl:showThemeDialog(theData, 1, csbName, dialogName)
    btnStart = dailog.startRoot.btnStart
end
function cls:setBtnDisplay(btn)
    if not btn then
        return
    end
    btn:setTouchEnabled(false)
    btn:setBright(false)
    btn:removeAllChildren()
end
function cls:showSMColletDialog(...)
    local theData = {}
    theData.coins = self.slotMCtl.totalWin
    local csbName = self.slotMCtl:getPopupCsb()
    local dialogName = "dailog_collect"
    local btnCollect = nil
    theData.click_event = function ( ... )
        self:setBtnDisplay(btnCollect)
        self.slotMCtl:stopMusicByName("slot_popup")
        self.slotMCtl:laterCallBack(1, function ()
            self.slotMCtl:exitSlotMachineScene()
        end)
	end
    self.slotMCtl:playMusicByName("slot_popup")
    self.slotMCtl:setFooterBtnsEnable(false)
    local dailog = self.slotMCtl:showThemeDialog(theData, 3, csbName, dialogName)
    btnCollect = dailog.collectRoot.btnCollect
end
function cls:onExit(...)
    self:removeFromParent()
end
return cls

