local ___int_ox = 63
local ____eep = nil
local ____uor = nil
local ____rfv = nil
local ___tab_lk = {}
local ___int_brlb = 14
local ____dqwsb = nil
local ___tab_wvjft = {}
local ____lg = nil
local ___int_dhqv = 37
local ____zbbqn = nil
local ___tab_sei = {}
local ___bool_uih = false
local ____cw = nil
local ___bool_gr = false
local ___bool_ue = false
local ___tab_werx = {}
local ___tab_asvee = {}
local ___bool_mhat = false
local ___tab_gxxcy = {}
local ___bool_yvn = false
local ___bool_aogck = false
local ___tab_fj = {}
local ___int_jfav = 100
local ___int_tlbu = 82
local ___str_vl = "lblkx"
local ___int_bbgd = 55
local ____ygb = nil
local ___int_wnf = 59

local function ___vhji()
	local tab_ah = {}
	local int_unito = 53
	local str_wh = "stfyk"
	local tab_op = {}
end

local function ___oogt()
	local int_ikxbg = 61
	local bool_dfiyp = false
	local str_ih = "bvq"
	local str_gcbji = "srhoy"
end

local function ___gfpgq()
	local tab_wmjdk = {}
	local tab_puh = {}
	local _cs = nil
end

local function ___bc()
	local _bxq = nil
	local str_pd = "kvxc"
	local bool_io = false
	local int_odupp = 18
	local str_pleex = "sfxm"
end

local function ___ujexg()
	local str_dvc = "tma"
	local str_isqy = "hbf"
	local str_yjk = "raofbx"
	local str_izow = "indph"
end

local function ___pmlq()
	local str_pc = "crn"
	local _cdaia = nil
	local bool_jbovh = false
	local str_qu = "ipv"
	local bool_mi = false
end

local function ___pv()
	local bool_mjas = false
	local str_nghg = "guw"
end

local function ___tzyc()
	local bool_hnle = false
	local str_oo = "uervn"
	local tab_jqbkc = {}
	local bool_plwj = false
end

local function ___nl()
	local int_jbrf = 6
	local str_jy = "lwi"
end

local function ___mamzu()
	local tab_ch = {}
	local bool_wsdc = false
	local str_zb = "wuy"
	local _bflp = nil
end

local function ___ut()
	local _bpk = nil
	local str_hxo = "mjphdm"
end

local function ___vw()
	local str_vrn = "cdleii"
	local str_nta = "biezh"
	local int_ffwsq = 29
end

local function ___md()
	local int_kwbzi = 42
	local tab_efd = {}
	local bool_uh = false
end

local function ___uqr()
	local str_ajku = "mnaeax"
	local _vqt = nil
	local tab_kr = {}
	local tab_hm = {}
	local _epksc = nil
end

local function ___emxv()
	local tab_evzni = {}
	local str_akhh = "obkur"
	local _qvj = nil
end

local function ___hwv()
	local str_vqd = "surio"
	local int_voxhy = 84
	local _syfho = nil
end

local function ___iqn()
	local tab_qhu = {}
	local int_oxii = 62
end

local function ___zzeb()
	local int_klf = 82
	local bool_xh = false
	local _bnqmi = nil
end

local function ___zx()
	local tab_klm = {}
	local tab_offou = {}
	local tab_nl = {}
	local int_miq = 37
end

local function ___xyigj()
	local bool_wru = false
	local str_jevvr = "fbdu"
end

local function ___kf()
	local int_vo = 64
	local bool_qs = false
	local str_rurk = "otkfuk"
	local bool_pigaw = false
	local tab_onjo = {}
end

local function ___icza()
	local int_vdod = 79
	local str_rtffu = "odwl"
	local _ndvyi = nil
end

local function ___praa()
	local bool_pmi = false
	local bool_fj = false
end

local function ___ne()
	local str_ui = "wayjvd"
	local int_vl = 76
	local int_tp = 51
end

local function ___jgony()
	local int_zpb = 6
	local _ywao = nil
	local tab_oczw = {}
	local str_iqqjk = "lmeb"
end

local function ___vbfiv()
	local str_lpl = "jbv"
	local str_nnm = "oxxrgc"
	local str_sjiq = "fiipmq"
	local int_ycjkw = 46
	local int_ecsv = 50
end

local function ___bz()
	local bool_zl = false
	local bool_yk = false
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/02/24 11:11
---
local headItem = require("Themes/TournCash/Common/Rank/TCRankHeadItem")

local cls = class("TCRankItem", function()
    return cc.Node:create()
end)
function cls:ctor(ctl, parent, index, rankInfo)
    self.ctl = ctl
    self.parent = parent
    local path = self.ctl:getCsbPath("rank_item")
    self.node = cc.CSLoader:createNode(path)
    self:addChild(self.node)
    self.parent:addChild(self)
    self.rankInfo = rankInfo
    self:updateIndex(index)
    self:initUI()
end
function cls:updateIndex(index, isAni)
    local before = self.index

    if index ~= before then
        self.index = index
        if not before then
            before = index
        end
        self:updatePosition(index - 1, before - 1, isAni)
    end
end
function cls:updatePosition(now_rank, before_rank, isAni)
    local endPos = self.ctl:getRankItemPosByRank(now_rank)
    self:stopActionByTag(1002)
    if self.now_parent and self.now_parent == 1 then
        self:stopAllActions()
        bole.changeParent(self, self.parent, 1)
        self:setScale(1)
        self.now_parent = 2
    end
    if isAni then
        if before_rank then
            local startPos = self.ctl:getRankItemPosByRank(before_rank)
            self:setPosition(startPos)
        end
        local action = cc.Sequence:create(
                cc.DelayTime:create(0.2),
                cc.MoveTo:create(0.6, endPos)
        )
        action:setTag(1002)
        self:runAction(action)
    else
        self:setPosition(endPos)
    end
end
function cls:initUI()
    self.headNode = self.node:getChildByName("head_node")
    self.isSelf = self.ctl:checkIsSelf(self.rankInfo)
    local teamType = self.ctl:getTeamTypeByInfo(self.rankInfo)
    self.headItem = headItem.new(self.ctl, self.headNode, self.isSelf)

    self.rankNode = self.node:getChildByName("rank_node")
    bole.setEnableRecursiveCascading(self.rankNode, true)
    self.rankLabel = self.rankNode:getChildByName("rank_label")
    self.rankImg = self.rankNode:getChildByName("rank_img")
    self.scoreNode = self.node:getChildByName("score_node")
    self.scoreBg = self.scoreNode:getChildByName("bg")
    self.scoreLabel = self.scoreNode:getChildByName("score_label")
    self.headItem:updateIcon(self.rankInfo, self.isSelf)
    self.spineNode = self.node:getChildByName("spine_node")

    self:updateRankIndex(self.rankInfo.rank)
    self:updateScoreLabel(self.rankInfo.score)
    self.headItem:setHeadStyle(self.rankInfo)
    self:updateScoreBg(self.isSelf)
    if self.isSelf then
        self.headItem:addLoopAni()
    end
end
function cls:showReveiveAni()
    local data = {}
    data.file = self.ctl:getSpineFile("rank_frame")
    data.parent = self.spineNode
    data.animateName = "animation2"
    local _, s = bole.addAnimationSimple(data)
    s:setScale(0.55)
end
function cls:updateRankItem(rankInfo, status)
    self:updateRankInfo(rankInfo)
    if status == "up" then
        self:updatePosition(self.rankInfo.rank, self.rankInfo.rank + 1, true)
    elseif status == "down" then
        self:updatePosition(self.rankInfo.rank, self.rankInfo.rank - 1, true)
    else
        self:updatePosition(self.rankInfo.rank)
    end

end
function cls:updateRankInfo(rankInfo)
    self.beforeInfo = self.rankInfo
    self.rankInfo = rankInfo
    self:updateScoreLabel(self.rankInfo.score)
    self:updateRankIndex(self.rankInfo.rank)
    self:updateHeadFrame(rankInfo)
end
function cls:updateRankItemInRound3(rankInfo)
    self.beforeInfo = self.rankInfo
    self.rankInfo = rankInfo
    if self.isSelf then
        self:updateScoreLabel(self.rankInfo.score)
    else
        self:updateScoreLabel("...")
    end
    self:updateRankIndex("?")
end
function cls:updateScoreBg(isSelf)
    --local score_bg_config = self.ctl:getRankConfig().score_bg
    --local img
    ----if isSelf then
    ----    img = score_bg_config[1]
    ----else
    --img = score_bg_config[2]
    ----end
    --bole.updateSpriteWithFile(self.scoreBg, img)
end
function cls:updateHeadFrame(rankInfo)
    self.headItem:updateHeadFrame(rankInfo)
end
function cls:updateScoreLabel(score)
    local str = score
    if type(score) == "number" then
        str = FONTS.formatByCount4(score, 8, true, true)
    end
    self.scoreLabel:setString(str)
end
function cls:updateRankIndex(rank)
    if type(rank) == "number" then
        local index = rank + 1
        if index == 1 then
            self.rankImg:setVisible(true)
            self.rankLabel:setVisible(false)
        else
            self.rankImg:setVisible(false)
            self.rankLabel:setVisible(true)
            self.rankLabel:setString(index)
            bole.shrinkLabel(self.rankLabel, 50, 1)
        end
    else
        self.rankImg:setVisible(false)
        self.rankLabel:setVisible(true)
        self.rankLabel:setString(rank)
    end

end
function cls:changePos(now, before)
end
function cls:rankChangeAni()
    self.rankNode:stopAllActions()
    local a1 = cc.FadeOut:create(0.2)

    local a2 = cc.DelayTime:create(0.3)
    local a3 = cc.FadeIn:create(0.2)
    local a4 = cc.CallFunc:create(function()
        self:showReveiveAni()
    end)
    self.rankNode:runAction(cc.Sequence:create(a1, a2, a4, a3))
end
function cls:getPos()
    return bole.getPos(self)
end
function cls:getUserID()
    return self.rankInfo.user_id
end
return cls

