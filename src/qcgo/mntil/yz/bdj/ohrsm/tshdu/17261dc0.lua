local ____sudy = nil
local ___tab_jxj = {}
local ___tab_jwwv = {}
local ___bool_aj = false
local ___tab_gaez = {}
local ____opi = nil
local ___bool_qklhh = false
local ___int_ub = 92
local ___str_xd = "qdtiiq"
local ___bool_hsoy = false

local function ___xu()
	local str_tpv = "zvlcj"
	local tab_qbv = {}
	local int_nzzdq = 42
end

local function ___vrtz()
	local _nakma = nil
	local bool_jlhf = false
	local str_zlww = "kwqnf"
	local int_hckd = 98
	local str_hcvk = "mic"
end

local function ___zh()
	local _ouyr = nil
	local bool_fzfo = false
	local bool_xjmj = false
	local _wc = nil
end

local function ___mct()
	local bool_tkzu = false
	local tab_jihgn = {}
end

local function ___cu()
	local tab_tbl = {}
	local bool_iakj = false
	local _engix = nil
end

local function ___kpzvn()
	local bool_clke = false
	local int_uz = 50
	local bool_uidc = false
	local str_gjuqh = "ugy"
end

local function ___ldvg()
	local tab_bmlo = {}
	local int_ambnk = 35
	local bool_kq = false
	local str_ha = "iml"
	local int_zc = 31
end

local function ___ldzz()
	local bool_jd = false
	local bool_vyst = false
	local str_gpo = "qqwn"
	local bool_wzq = false
end

local function ___opfyl()
	local bool_xr = false
	local int_cd = 72
end

local function ___kjsw()
	local tab_az = {}
	local _ygjg = nil
	local str_ly = "qhcu"
	local _dflcu = nil
end

local function ___hqgbs()
	local str_xjvco = "aorzb"
	local bool_khie = false
	local str_mea = "tpk"
	local int_jckhv = 22
	local _ef = nil
end

local function ___lefsc()
	local str_adx = "uemp"
	local int_xkf = 73
	local _hdt = nil
end

local function ___vfpzu()
	local str_scq = "hrnusq"
	local str_vc = "izxvmd"
	local tab_udb = {}
	local tab_wca = {}
	local _ujzi = nil
end

local function ___nfhp()
	local _elu = nil
	local _hr = nil
	local tab_tml = {}
	local str_gpcm = "kdll"
	local str_qclux = "ght"
end

local function ___vsnq()
	local bool_kprnn = false
	local int_zqoxo = 68
	local int_jime = 48
	local bool_pahe = false
end

local function ___byemy()
	local str_jzgm = "uxibs"
	local int_quxff = 99
	local int_gz = 97
	local bool_fzez = false
	local _qa = nil
end

local function ___gdouk()
	local str_tkp = "idh"
	local str_mjwru = "efs"
	local _qtmu = nil
	local bool_mqfc = false
end

local function ___mwivh()
	local tab_er = {}
	local int_depmy = 47
end

local function ___cmjhq()
	local bool_shmbs = false
	local bool_yld = false
	local int_fwx = 0
end

local function ___dig()
	local _vz = nil
	local int_eaq = 99
	local _pfxce = nil
end

local function ___wykup()
	local _cujgg = nil
	local int_xws = 37
end

local function ___ms()
	local _kxxa = nil
	local _wys = nil
end

local function ___enyo()
	local _ixcm = nil
	local str_xal = "nxafa"
	local _douqy = nil
end

local function ___enn()
	local _bauh = nil
	local _kew = nil
	local tab_xmn = {}
	local int_tawy = 11
	local str_hyzw = "zmejw"
end

local function ___dib()
	local tab_aazdu = {}
	local str_umisd = "icwdnn"
end

local function ___xubv()
	local _wg = nil
	local str_klljj = "phleuv"
	local tab_inezh = {}
	local int_qt = 54
end

local function ___uh()
	local int_xxg = 31
	local str_adirp = "bussc"
	local str_ngma = "locx"
	local _swsj = nil
end

local function ___rdnft()
	local bool_vmgj = false
	local tab_pt = {}
end

local function ___pawqk()
	local tab_qi = {}
	local tab_qcjk = {}
	local str_dh = "eljpd"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/03/09 16:52
---
---
local cls = class("TCBattleView")
function cls:ctor(ctl, battleNode, flyNode)
    self.ctl = ctl
    self.battleNode = battleNode
    self.flyNode = flyNode
    self:initBattleNode()
end
function cls:initBattleNode()
    self.battleRoot = self.battleNode:getChildByName("root")
    self.logoNode = self.battleRoot:getChildByName("team_logo")
    self.redLogoNode = self.logoNode:getChildByName("red_logo")
    self.blueLogoNode = self.logoNode:getChildByName("blue_logo")
    self.scoreNode = self.battleRoot:getChildByName("score_node")
    self.redLabel = self.scoreNode:getChildByName("red_score")
    self.blueLabel = self.scoreNode:getChildByName("blue_score")
    self.barPanel = self.battleRoot:getChildByName("bar_panel")
    self.barNode = self.barPanel:getChildByName("bar_node")
    self.collectCell = self.barNode:getChildByName("bar_img")

    self.upNode = self.battleRoot:getChildByName("center_node")
    self.loopNode = self.battleRoot:getChildByName("loop_node")
    --self:initBattleBarNode()
    self:_initCenterAni()
    self:_initLabels()
    self:setProgress(0, 0)
    --bole.setEnableRecursiveCascading(self.battleRoot, true)
end
function cls:_initLabels()
    self.redLabel:setString(0)
    self.blueLabel:setString(0)
    inherit(self.redLabel, LabelNumRoll)
    inherit(self.blueLabel, LabelNumRoll)
    local function parseValue(num)
        return FONTS.formatByCount4(num, 5, true, true)
    end
    self.redLabel:nrInit(0, 24, parseValue)
    self.blueLabel:nrInit(0, 24, parseValue)
    self.curLeftScore = 0
    self.curRightScore = 0

end
function cls:_initCenterAni()
    local data = {}
    data.file = self.ctl:getSpineFile("battle_bg")
    data.parent = self.loopNode
    data.isLoop = true
    data.animateName = "animation2"
    bole.addAnimationSimple(data)

    local data2 = {}
    data2.file = self.ctl:getSpineFile("battle_lizi")
    data2.parent = self.upNode
    data2.isLoop = true
    data2.animateName = "animation2"
    bole.addAnimationSimple(data2)

    local data3 = {}
    data3.file = self.ctl:getSpineFile("battle_lead")
    data3.parent = self.scoreNode
    data3.isLoop = true
    data3.animateName = "animation2"
    local _, s = bole.addAnimationSimple(data3)
    self.leadIcon = s
    self.leadIcon.status = 0
end
function cls:setLeadIconPos(leftScore, rightScore)
    if leftScore == rightScore then
        self.leadIcon:setVisible(false)
        self.leadIcon.status = 0
    elseif leftScore < rightScore then
        self.leadIcon:setVisible(true)
        self.leadIcon:setPosition(cc.p(140, 0))
        if self.leadIcon.status ~= 1 then
            self.leadIcon:setAnimation(0, "animation1", false)
            self.leadIcon:addAnimation(0, "animation2", true)
        end
        self.leadIcon.status = 1
    else
        self.leadIcon:setVisible(true)
        self.leadIcon:setPosition(cc.p(-140, 0))
        if self.leadIcon.status ~= 2 then
            self.leadIcon:setAnimation(0, "animation1", false)
            self.leadIcon:addAnimation(0, "animation2", true)
        end
        self.leadIcon.status = 2
    end
end
--function cls:initBattleBarNode()
--local battleConfig = self.ctl:getBattleConfig()
--local stencil = cc.Node:create()
--local clipSp = bole.createSpriteWithFile(battleConfig.stencil_bar)
--clipSp:setAnchorPoint(0.5, 0.5)
--stencil:addChild(clipSp)
--local clipNode = cc.ClippingNode:create(stencil)
--clipNode:setAlphaThreshold(0)
--self.barNode:addChild(clipNode)
--self.clipNode = clipNode
--self.collectCell = cc.Node:create()
--self.clipNode:addChild(self.collectCell)
--local imgBar = bole.createSpriteWithFile(battleConfig.img_bar)
--self.collectCell:addChild(imgBar)
--end
function cls:setProgress(leftScore, rightScore, isAni)
    self:setLeadIconPos(leftScore, rightScore)
    local totoal = leftScore + rightScore
    if totoal == 0 then
        totoal = 1
    end
    local endPosX = (leftScore - rightScore) / totoal * 164
    if math.abs(endPosX) > 164 then
        if endPosX > 0 then
            endPosX = 164
        else
            endPosX = -164
        end
    end
    self.collectCell:stopAllActions()
    self.upNode:stopAllActions()
    if isAni then
        local a1 = cc.MoveTo:create(0.3, cc.p(endPosX, 0))
        self.collectCell:runAction(a1)
        self.upNode:runAction(a1:clone())
        self.redLabel:nrStartRoll(self.curLeftScore, leftScore, 1)
        self.blueLabel:nrStartRoll(self.curRightScore, rightScore, 1)
    else
        self.collectCell:setPosition(cc.p(endPosX, 0))
        self.upNode:setPosition(cc.p(endPosX, 0))
        self.redLabel:setString(self.redLabel.nrParserFunc(leftScore))
        self.blueLabel:setString(self.blueLabel.nrParserFunc(rightScore))
    end
    self.curLeftScore = leftScore
    self.curRightScore = rightScore
end
--function cls:showBattleNode(isAni)
--    if not self.battleRoot:isVisible() then
--        self.battleRoot:stopAllActions()
--        self.battleRoot:setVisible(true)
--        self.battleRoot:setOpacity(0)
--        self.battleRoot:runAction(cc.FadeIn:create(0.5))
--    end
--end
--function cls:hideBattleNode(isAni)
--    if self.battleRoot:isVisible() then
--        self.battleRoot:stopAllActions()
--        self.battleRoot:setVisible(true)
--        self.battleRoot:setOpacity(255)
--        self.battleRoot:runAction(
--                cc.Sequence:create(
--                        cc.FadeOut:create(0.5),
--                        cc.Hide:create()
--                )
--        )
--    end
--end
return cls
