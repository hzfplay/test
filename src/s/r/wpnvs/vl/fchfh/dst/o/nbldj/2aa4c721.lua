local ___tab_yo = {}
local ___tab_soux = {}
local ___tab_sibn = {}
local ___str_mli = "ljgt"
local ___int_vb = 80
local ___int_wjkg = 99
local ___int_loxy = 80
local ___str_fjkk = "obm"
local ___tab_fy = {}
local ___bool_yyze = false
local ___bool_cnxzv = false
local ___str_bycn = "pvbra"
local ___int_gzwi = 3
local ___bool_de = false
local ___int_gvs = 43
local ___int_hycmt = 88
local ____mb = nil
local ___int_dcmw = 22
local ___str_nix = "ljxb"
local ___str_rndcu = "pjfiws"
local ___tab_jagh = {}
local ___int_ll = 30
local ___tab_xjd = {}
local ___str_xjd = "tygm"
local ____by = nil
local ___bool_blc = false
local ___bool_lcc = false
local ___int_fkx = 44
local ___tab_gytl = {}

local function ___xxdh()
	local int_kgm = 3
	local str_lpc = "hfo"
	local str_wb = "jeapvt"
	local str_vqs = "idqdae"
end

local function ___vqrx()
	local _ztay = nil
	local _cnt = nil
	local tab_cecax = {}
	local int_hxcq = 49
	local str_dxach = "ezct"
end

local function ___slwo()
	local tab_ys = {}
	local bool_fm = false
end

local function ___hc()
	local str_sy = "hccks"
	local bool_momb = false
	local int_zykvr = 86
	local bool_su = false
	local str_ekt = "csb"
end

local function ___vnmvy()
	local tab_gq = {}
	local str_yantx = "rvubc"
	local _qdt = nil
	local tab_pwsun = {}
	local str_ih = "jdvqkc"
end

local function ___ej()
	local str_wunoo = "submc"
	local str_ez = "rbbz"
	local tab_chrs = {}
	local int_nx = 94
end

local function ___nhovl()
	local int_ti = 85
	local bool_ddyge = false
end

local function ___txdq()
	local bool_ca = false
	local int_yn = 53
	local _vn = nil
	local bool_zl = false
end

local function ___pevo()
	local str_kzeyc = "oiwn"
	local _ftnt = nil
	local int_ya = 26
end

local function ___tzty()
	local bool_hap = false
	local _iz = nil
	local _idvs = nil
	local bool_uss = false
	local str_ijvcr = "ybyyu"
end

local function ___el()
	local int_sx = 43
	local str_fj = "ucbp"
end

local function ___rb()
	local bool_qlj = false
	local tab_qaadg = {}
	local bool_afzoh = false
	local bool_mo = false
	local bool_vaci = false
end

local function ___fxrue()
	local _uesp = nil
	local tab_beil = {}
	local int_xmcf = 47
	local int_lu = 72
end

local function ___zor()
	local tab_futtl = {}
	local tab_vtox = {}
end

local function ___ila()
	local _aa = nil
	local tab_zl = {}
	local tab_tywa = {}
end

local function ___run()
	local str_zogi = "mqvyy"
	local bool_maitu = false
end

local function ___cawlp()
	local tab_mw = {}
	local str_nno = "qatklk"
	local str_gtsve = "bbcx"
end

local function ___fgbc()
	local int_rhx = 28
	local str_jjlz = "bqrqb"
end

local function ___dooi()
	local _kucqt = nil
	local str_qhlpm = "bmwdk"
end

local function ___yszm()
	local tab_tw = {}
	local _tt = nil
	local tab_htsw = {}
	local str_qefa = "utoojm"
	local str_sxq = "izjxq"
end

local function ___luv()
	local _fjsp = nil
	local str_galn = "kmaxt"
	local bool_ofen = false
	local int_yx = 53
end

local function ___kemy()
	local str_kegx = "kagl"
	local bool_ci = false
	local bool_hcfgx = false
	local int_jvwv = 61
	local str_tdo = "dzt"
end

local function ___fbbbe()
	local tab_zhli = {}
	local bool_ll = false
	local int_vpbo = 80
	local bool_jrtes = false
end

local function ___gi()
	local _day = nil
	local tab_sv = {}
	local tab_lyeat = {}
	local str_ttucm = "pmhczt"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/02/24 11:05
---
local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local rankTipItem = require("Themes/TournCash/Common/Rank/TCRankTipView")
local view = require("Themes/TournCash/Common/Rank/TCRankView")
local battleView = require("Themes/TournCash/Common/Rank/TCBattleView")
local cls = class("TCRankControl", parentClass)
function cls:ctor(themeCtl, tcCommonCtl)
    parentClass.ctor(self, tcCommonCtl)
    self.themeCtl = themeCtl
    self.tcCommonCtl = tcCommonCtl
    local rank_config = self:getRankConfig()
    self.TEAM_TYPE = self:getTeamType()
    self.cellHeight = rank_config.rank_item.height
    self.cellWidth = rank_config.rank_item.width
    self:initRankMultiTip()
    self:setLockStatus(0)
end
function cls:initLayout(rankNode, flyNode)
    self.rankView = view.new(self, rankNode, flyNode)
end
function cls:getRankConfig()
    return self:getCommonConfig().rank_config
end
function cls:getTeamType()
    return self:getCommonConfig().TEAM_TYPE
end
function cls:getScoreConfig()
    return self:getCommonConfig().score_config
end
function cls:getScoreCount()
    return self.scoreCount or 0
end
function cls:getCellHeight()
    return self.cellHeight
end
function cls:setScoreCount(score)
    self.scoreCount = score
end
function cls:addScoreCount(add_score)
    self:setScoreCount(self:getScoreCount() + add_score)
end
function cls:sortRankList(rank_list)
    local comp = function(a, b)
        return a.score > b.score
    end
    table.sort(rank_list, comp)
    for key = 1, #rank_list do
        rank_list[key].rank = key - 1
    end
    return rank_list
end
function cls:checkIsSelf(rankInfo)

    if rankInfo and rankInfo.focus and rankInfo.focus == 1 then
        return true
    end
    return false
end
function cls:getTeamTypeByInfo(rankInfo)

    if not self.themeCtl:checkIsBattle() then
        return 0
    end
    if not rankInfo or not rankInfo.team_id then
        return 0
    end
    if rankInfo.team_id and rankInfo.team_id == self.TEAM_TYPE.BLUE then
        return rankInfo.team_id
    end
    return rankInfo.team_id

end

function cls:getMyTeamType()
    if not self.themeCtl:checkIsBattle() then
        return 0
    end
    local team_id = TournCashController:getInstance():getSelfTeamId()
    if not team_id then
        return 0
    end
    return team_id
end
function cls:getBlueAndTotalTeamScore(rankList)

    if not self.themeCtl:checkIsBattle() then
        return 0, 0
    end
    local score = 0
    local total = 0
    if rankList then
        for key = 1, #rankList do
            local info = rankList[key]
            total = total + info.score
            if info.team_id == self:getTeamType().BLUE then
                score = score + info.score
            end
        end
    end
    return score, total
end
function cls:checkIsInit()
    return self.initStatus
end
function cls:setLockStatus(status)
    if status < 0 then
        status = 0
    end
    self.lockStatus = status
end
function cls:getLockStatus()
    return self.lockStatus
end

function cls:getSelfIndexByList(info_list)
    if info_list then
        for i = 1, #info_list do
            if self:checkIsSelf(info_list[i]) then
                return i
            end
        end
    end

    return 0
end
function cls:setSelfIndex(index)
    self.selfIndex = index
end
function cls:getSelfIndex()
    return self.selfIndex or 1
end
function cls:setBeforeSelfIndex(index)
    self.beforeIndex = index
end
function cls:getBeforeSelfIndex()
    return self.beforeIndex
end
function cls:getSelfRankIndex()
    return self:getSelfIndex() - 1
end
function cls:getBeforeSelfRankIndex()
    return self:getBeforeSelfIndex() - 1
end
function cls:getSinge()
    return
end

function cls:getRankItemPosByRank(rank)
    local startX = 0
    local realIndex = #self.rankList - rank
    local startY = (realIndex - 0.5) * self.cellHeight
    return cc.p(startX, startY)
end

------------------ left rank part------------------
function cls:refreshRankListByServer(rank_info, from, notAni)
    if not rank_info then
        self:refreshOnlyScore(from)
        return
    end
    if not from and self:getLockStatus() > 0 then
        return
    end
    if not self:checkIsInit() then
        self:initRankList(rank_info)
    end

    if self:getScoreCount() <= 0 then
        if self.themeCtl:checkIsBattle() then
            self:updateBattleProGress(rank_info)
        end
        return
    end
    local index = self:getSelfIndexByList(rank_info)
    if index > 0 and rank_info then
        local info = rank_info[index]
        info.score = self:getScoreCount()
        rank_info = self:sortRankList(rank_info)
    else
        self:refreshOnlyScore(from)
        return
    end
    if self.themeCtl:checkIsBattle() then
        self:updateBattleProGress(rank_info)
    end
    if not from then
        self:setLockStatus(self:getLockStatus() + 1)
    end

    if not self:isNeedShowRankDetail() or not rank_info then
        self:refreshOnlyScore()
        self:setLockStatus(self:getLockStatus() - 1)
        return
    end
    local extraDelay = self:updateRankList(rank_info, notAni)
    self.rankView:updateRankScoreInfo(self.rankList[self.selfIndex])
    if from then
        self:hideRankMask(0)
    end
    if extraDelay > 0 then
        self:laterCallBack(extraDelay, function()
            self:setLockStatus(self:getLockStatus() - 1)
        end)
    else
        self:setLockStatus(self:getLockStatus() - 1)
    end

end
function cls:initRankList(info_list)
    if info_list and #info_list == 28 then
        self.initStatus = true
        self.rankList = info_list
        self:setSelfIndex(self:getSelfIndexByList(info_list))
        self:setBeforeSelfIndex(self:getSelfIndex())
        self.rankView:initRankItemList(info_list)
        self:enterGameRankStatus()
    end
end
function cls:enterGameRankStatus()
    if self:isNeedShowRankDetail() then
        if self:getScoreCount() == 0 then
            self:showRankMaskAndWhy()
        else
            self:hideRankMask()
        end
    else
        self:showRankMaskAndNumber(true)
    end
end
function cls:updateRankList(info_list, notAni)
    self.beforeList = self.rankList
    self.rankList = info_list
    self:setBeforeSelfIndex(self:getSelfIndex())
    self:setSelfIndex(self:getSelfIndexByList(info_list))
    local status = self:refreshRankItemList(info_list, notAni)
    if status == "normal" then
        return 0
    end
    return 1.1
end

function cls:refreshRankItemList(info_list, notAni)
    local status = "normal"
    if notAni then
        self.rankView:refreshRankItemList(info_list, status)
    else
        if self:getSelfIndex() < self:getBeforeSelfIndex() then
            status = "up"
            self.rankView:refreshRankItemList(info_list, status, notAni)
        elseif self:getSelfIndex() > self:getBeforeSelfIndex() then
            status = "down"
            self.rankView:refreshRankItemList(info_list, status, notAni)
        else
            self.rankView:refreshRankItemList(info_list, status, notAni)
        end
    end
    return status
end
function cls:updateDialogUp()

    if not self.themeCtl:isNeedShowRankDetail() or self:getScoreCount() == 0 then
        return
    end
    local now_index = self:getSelfIndex()
    local next_index = self:getNextIndex()
    if next_index < now_index then
        self:showRankDialog(next_index, "up", now_index)
    end
end
function cls:getNextIndex()
    --if
    local rank_info = TournCashController:getInstance():getAllRankData()
    local index = self:getSelfIndexByList(rank_info)
    if index > 0 and rank_info then
        local info = rank_info[index]
        info.score = self:getScoreCount()
        rank_info = self:sortRankList(rank_info)
        local next = self:getSelfIndexByList(rank_info)
        return next
    end
    return 28

end

function cls:refreshOnlyScore(from)
    if from then
        if self:getLockStatus() > 0 then
            self:setLockStatus(self:getLockStatus() - 1)
        end
    end
    local score = self:getScoreCount()
    if self.rankView and bole.isValidNode(self.rankView.rankNode) then
        self.rankView:setRankScore(score)
    end
end
function cls:getScoreNodeWorldPos()
    return self.rankView:getScoreNodeWorldPos()
end
function cls:setRankPosition()
    if self.rankList and self:getLockStatus() == 0 then
        self.rankView:setRankPosition(self:getSelfRankIndex(), nil, nil)
    end
end
function cls:showRankDialog(rankIndex, status, beforeIndex)

    self.rankView:showRankDialog(rankIndex, status, beforeIndex)
end

function cls:showScoreAddDialog(addScore, multi, from, pick_pos)
    local index = self:getSelfIndex()
    local dialogType = self.tcCommonCtl:getDialogType()
    local dialogStep = self.tcCommonCtl:getDialogStep()
    local endWpos = self:getScoreNodeWorldPos()
    local data = {}
    data.coins = addScore
    data.mask_id = 0
    data.roll_time = 0.5
    data.music_mini = 1
    data.tip_bg = 2
    if multi > 1 then
        data.font_multi = "X" .. multi
    end
    self:playMusicByName("winscore1")
    self:setLockStatus(self:getLockStatus() + 1)
    self:hideRankMask()

    local dialog = self.tcCommonCtl:showThemeDialog(data, dialogStep.collect, dialogType.score)
    self.themeCtl:dealMusic_stopRollCoins()
    local endPos = dialog:getParent():convertToNodeSpace(endWpos)
    --local centerPos = bole.getPos(dialog)
    local a2 = cc.DelayTime:create(15 / 30)
    if pick_pos then
        local startPos = dialog:getParent():convertToNodeSpace(pick_pos)
        dialog:setPosition(startPos)
    end
    local endScale = 1
    local title1 = bole.deepFind(dialog.collectRoot, "title")
    local title2 = bole.deepFind(dialog.collectRoot, "title_2")
    if from == 3 then
        endScale = 0.625
        if title1 then
            title1:setVisible(false)
        end
        if title2 then
            title2:setVisible(true)
        end
    else
        if title1 then
            title1:setVisible(true)
        end
        if title2 then
            title2:setVisible(false)
        end
    end
    local a1 = cc.EaseIn:create(cc.ScaleTo:create(10 / 30, endScale), 2)
    dialog:runAction(
            cc.Sequence:create(
                    a1, a2,
                    cc.CallFunc:create(function()
                        self:playMusicByName("winscore2")
                    end),
                    cc.CallFunc:create(function()
                        self:addScoreCount(addScore)
                        self:updateDialogUp()
                    end),
                    cc.Spawn:create(
                            cc.EaseOut:create(cc.ScaleTo:create(10 / 30, 0), 2),
                            cc.MoveTo:create(0.3, endPos)
                    ),
                    cc.CallFunc:create(function()
                        self.themeCtl:showThemeTourInfo(true)
                    end),
                    cc.RemoveSelf:create()
            )
    )
    local label_node2 = dialog.collectRoot:getChildByName("label_node2")
    if multi > 1 then
        label_node2:setVisible(true)
    else
        label_node2:setVisible(false)
    end
    if from == 2 then
        dialog:setPosition(-140, 0)
    end

end

function cls:showRankMaskAndNumber(isFirst)
    self.rankView:showRankMaskAndNumber()
    self.rankView:setCurrentRank("?")
    --if self.themeCtl:checkIsBattle() and isFirst then
    --    self.battleView:hideBattleNode(true)
    --end
end
function cls:showRankMaskAndWhy()
    self.rankView:showRankMaskAndWhy()
    --if self.themeCtl:checkIsBattle() then
    --    self.battleView:hideBattleNode()
    --end
end
function cls:updateRankMask()
    if self:getScoreCount() > 0 then
        if self:getRoundLeftTime() > 10 then
            self:showRankMaskAndWhy()
            self:hideRankMask()
        else
            self:showRankMaskAndNumber()
        end
    else
        if self:getRoundLeftTime() <= 10 then
            self:showRankMaskAndNumber()
        else
            self:showRankMaskAndWhy()
        end
    end

end

function cls:hideRankMask()
    if not self:checkIsInit() then
        return
    end
    if self:isNeedShowRankDetail() and self:getScoreCount() > 0 then
        self.rankView:hideRankMask()
        --if self.themeCtl:checkIsBattle() then
        --    self.battleView:showBattleNode()
        --end

        self.rankView:setCurrentRank(self:getSelfIndex())
    end
end
function cls:getRoundLeftTime()
    return self.themeCtl:getRoundLeftTime()
end
function cls:onSpinFinish()
end
function cls:isNeedShowRankDetail()
    local base_status = self.themeCtl:isNeedShowRankDetail()
    return base_status
end
-----------------battle part start------------------------
function cls:initBattleLayout(battleNode)
    self.battleView = battleView.new(self, battleNode)
end
--function cls:initBattleBarNode()
--    self.battleView:initBattleBarNode()
--end
--function cls:getBattleConfig()
--    return self:getRankConfig().battle_config
--end
function cls:updateBattleProGress(rankList)
    local blueScore, totalScore = self:getBlueAndTotalTeamScore(rankList)
    local redScore = totalScore - blueScore
    self:setBattleProgress(redScore, blueScore, true)
end
function cls:setBattleProgress(left, right, ani)
    self.battleView:setProgress(left, right, ani)
end
function cls:updateTeamUI()
    local isRed = false
    local teamType = self:getMyTeamType()
    if teamType == self:getTeamType().RED then
        isRed = true
    end
    self.rankView:updateTeamUI(isRed)
    self:setTeamColor(teamType)
end
function cls:setTeamColor(teamType)
    self.teamColor = teamType
end
function cls:getTeamColor()
    return self.teamColor or 0
end
function cls:clearAllRankTipList()
    self.rankTipList = {}
end

-----------------battle part  end------------------------
------------------ multi points boardcast start -------------
function cls:initRankMultiTip()
    self.rankTipList = {}
    self.isRankTipCreateIng = false
end
function cls:initRankTip(rankInfo, multi)
    local isSelf = self:checkIsSelf(rankInfo)
    rankTipItem.new(self, rankInfo, isSelf, multi)
    self:laterCallBack(3, function()
        self:showNextRankTip()
    end)
end
function cls:initRankTipByUserId(user_id, multi)
    if self.themeCtl:getCurStage() == 1 or self.themeCtl:getCurStage() == 2 then
        local info = self:getUserInfoByUserID(user_id)
        if info then
            table.insert(self.rankTipList, { info, multi })
            if not self.isRankTipCreateIng then
                self:showNextRankTip()
            end
        end
    end
end
function cls:showNextRankTip()
    if self.themeCtl:getCurStage() == 1 or self.themeCtl:getCurStage() == 2 then
        if self.rankTipList and #self.rankTipList > 0 then
            self.isRankTipCreateIng = true
            local data = table.remove(self.rankTipList, 1)
            self:initRankTip(data[1], data[2])
        else
            self.isRankTipCreateIng = false
        end
    else
        self:clearAllRankTipList()
        self.isRankTipCreateIng = false
    end
end
function cls:getUserInfoByUserID(user_id)
    if self.rankList then
        for i = 1, #self.rankList do
            local info = self.rankList[i]
            if info.user_id == user_id then
                return info
            end
        end
    end
    return nil
end
------------------ multi points boardcast end -------------
------------------ clear rank -------------
function cls:clearRank()
    self.initStatus = false
    self.rankList = nil
    self.selfIndex = nil
    self.rankView:clearRankList()
    self:setScoreCount(0)
end

------------------ clear rank -------------
return cls