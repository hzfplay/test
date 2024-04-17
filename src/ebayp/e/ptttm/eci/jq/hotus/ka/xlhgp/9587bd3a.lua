local ___tab_agf = {}
local ___int_gxtyc = 45
local ____wolg = nil
local ____hzh = nil
local ___str_blvim = "ksi"
local ____zofj = nil
local ____hoi = nil
local ___tab_ynaci = {}
local ___tab_zsyx = {}
local ___int_big = 39
local ___bool_soxr = false
local ___str_nec = "hynzii"
local ___tab_gm = {}
local ____mur = nil
local ___int_gs = 67
local ___str_mtwrr = "qad"
local ___str_zsfmc = "lfcpoj"
local ___tab_lrr = {}

local function ___sfk()
	local int_eyuk = 73
	local int_ctv = 9
end

local function ___ypkhw()
	local str_bermt = "rgbpms"
	local str_rh = "nxqfw"
end

local function ___mfbl()
	local _wbs = nil
	local _xp = nil
	local str_bn = "hbsq"
	local bool_qyd = false
	local int_wodg = 58
end

local function ___kirp()
	local _ia = nil
	local _kfo = nil
	local str_leg = "tfga"
end

local function ___pwzal()
	local int_pvy = 3
	local str_lrht = "bnefb"
	local bool_od = false
	local str_otm = "aphoan"
end

local function ___iyy()
	local bool_iitq = false
	local tab_gq = {}
	local int_hnot = 7
	local int_ydphk = 90
	local int_lin = 77
end

local function ___iwijx()
	local tab_vtq = {}
	local _obzad = nil
	local _vmxiv = nil
	local tab_frv = {}
	local int_wahhn = 32
end

local function ___sbroz()
	local int_yr = 72
	local bool_pruf = false
end

local function ___ap()
	local tab_mlhb = {}
	local _gtmtg = nil
	local str_sj = "qzb"
	local tab_izlz = {}
end

local function ___yxduf()
	local int_jssd = 86
	local str_hu = "eqtwjy"
	local bool_tkwl = false
	local _fn = nil
	local _xe = nil
end

local function ___uswtp()
	local str_ezx = "ral"
	local tab_mqjy = {}
end

local function ___lj()
	local bool_qd = false
	local int_mj = 85
	local bool_wtag = false
	local int_vyjm = 51
end

local function ___yoq()
	local str_woo = "vdkcq"
	local str_hphp = "gqwc"
	local bool_ufvb = false
	local _dqcei = nil
	local int_rtceu = 92
end

local function ___dunk()
	local tab_hhr = {}
	local int_yhw = 82
	local bool_qy = false
	local tab_obrx = {}
end

local function ___qxoa()
	local int_qo = 24
	local bool_cmdej = false
	local int_aog = 26
	local tab_wdhx = {}
end
---@program src
---@description:  theme2010
---@author: rwb  art:lijiling,math:yingtianqi,other:shanjingru,
---@create: : 2021/02/22 19:00:00
---
---/slots/Phoenix/client/src/Themes/TournCash/TCGorilla
local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local TCCommonDialog = require("Themes/TournCash/Common/TCCommonDialog")
local themeConfig = require("Themes/TournCash/Common/ThemeTC_Config")

local collectCtl = require "Themes/TournCash/Common/Collect/TCCollectControl"
local stageCtl = require "Themes/TournCash/Common/Stage/TCStageControl"
local rankCtl = require("Themes/TournCash/Common/Rank/TCRankControl")
local balloonCtl = require("Themes/TournCash/Common/Balloon/BalloonControl")
local prizePoolCtl = require("Themes/TournCash/Common/PrizePool/PrizePoolControl")
local multiCtl = require("Themes/TournCash/Common/Multi/MultiControl")
local commonView = require("Themes/TournCash/Common/ThemeTCMainView")
local cls = class("ThemeTC_Main", parentClass)
local fs_show_type
local STAGE_TIME = 180
function cls:ctor(themeCtl, themeid)
    self.gameConfig = themeConfig
    self.themeCtl = themeCtl
    self.themeid = themeid
    self.theme = self.themeCtl
    fs_show_type = themeConfig.fs_show_type
    self:listenEvent()
    self.curScene = bole.scene
    self:initGameControlAndMainView()
    self:initMusic()
    parentClass.ctor(self, self)
end
function cls:getDialogStep()
    return fs_show_type
end
function cls:getDialogType()
    return self.gameConfig.dialog_type
end
function cls:initLayout(mainThemeScene)

    self._view = commonView.new(mainThemeScene, self, self.themeCtl)
end
function cls:listenEvent()
    --EventCenter:registerEvent(EVENTNAMES.THEME.REFRESH_RANK, self.__cname, self.showThemeTourInfo, self)
    EventCenter:registerEvent(EVENTNAMES.THEME.REFRESH_BOARDCAST, self.__cname, self.showTournCashBoardCast, self)
    --EventCenter:registerEvent(EVENTNAMES.TOURN_CASH.STAGE_CHANGE, self.__cname, self.roundChange, self)
    --EventCenter:registerEvent(EVENTNAMES.TOURN_CASH.REFRESH_BET, self.__cname, self.dealAboutPromotionBet, self)
    --EventCenter:registerEvent(EVENTNAMES.THEME.ASK_QUIT_THEME, self.__cname, self.onAskQuitTheme, self)
end
function cls:removeEvent()
    --EventCenter:removeEvent(EVENTNAMES.THEME.REFRESH_RANK, self.__cname)
    EventCenter:removeEvent(EVENTNAMES.THEME.REFRESH_BOARDCAST, self.__cname)
    --EventCenter:removeEvent(EVENTNAMES.TOURN_CASH.STAGE_CHANGE, self.__cname)
    --EventCenter:removeEvent(EVENTNAMES.TOURN_CASH.REFRESH_BET, self.__cname)
    --EventCenter:removeEvent(EVENTNAMES.THEME.ASK_QUIT_THEME, self.__cname)
end
function cls:getStageTime()
    return STAGE_TIME
end
function cls:initThemeConfig()
    self.event_callback = {}
end
function cls:initGameControlAndMainView()
    self.collectViewCtl = collectCtl.new(self.themeCtl, self)
    self.stageViewCtl = stageCtl.new(self.themeCtl, self)
    self.rankCtl = rankCtl.new(self.themeCtl, self)
    self.balloonCtl = balloonCtl.new(self.themeCtl, self)
    self.prizePoolCtl = prizePoolCtl.new(self.themeCtl, self)
    self.multiCtl = multiCtl.new(self.themeCtl, self)
end

function cls:getRankCtl()
    return self.rankCtl
end
function cls:getBalloonCtl()
    return self.balloonCtl
end
function cls:getPrizePoolCtl()
    return self.prizePoolCtl
end
function cls:getCollectViewCtl(...)
    return self.collectViewCtl
end
function cls:getStageViewCtl(...)
    return self.stageViewCtl
end
function cls:getMultiCtl(...)
    return self.multiCtl
end
function cls:getCommonConfig()
    return self.gameConfig
end
function cls:getCommonMusic()
    return self.audio_list
end
function cls:initMusic()
    local audioList = self.gameConfig.audioList
    self.audio_list = self.audio_list or {}
    for music_key, music_path in pairs(audioList) do
        self.audio_list[music_key] = self:getPic(music_path)
    end
end

function cls:dealSpecialFeatureRet(data)
    if data["map_info"] then
        self:getCollectViewCtl():setMapInfo(data["map_info"])
        if data["map_info"].score_points then
            self:getRankCtl():setScoreCount(data["map_info"].score_points)
        end
    end
    if data.multi_spin then
        if data.multi_spin.count > 0 then
            local spins = data.multi_spin.count
            local multi = data.multi_spin.multi
            self:getMultiCtl():setLeftMultiSpins(spins)
            self:getMultiCtl():setPointsMulti(multi)
            self:getMultiCtl():setIsMultiSpin(true)
        end
    end
end
function cls:adjustTheme(data)
    self:updateCollectCount(self:getCollectViewCtl():getMapPoints())
    self:getRankCtl():refreshOnlyScore()
end
function cls:initSocialGame(stage)
    if stage == 1 or stage == 2 then
        if self:getMultiCtl():checkIsMultiSpin() then
            self:getMultiCtl():showMultiSpinLeftCount(false)
        end
        self:getStageViewCtl():setStartRound(stage)
        self:getStageViewCtl():updateStageNode(stage)
        if self.themeCtl:getRoundLeftTime() <= 0 then
            self:getStageViewCtl():resetStageTime(0)
        end
    end
end

--------------------- tourn cash boardcast start-------------------
function cls:showTournCashBoardCast(info)
    if info and info.type_name and info.type_name == "multi_points" then
        self:getRankCtl():initRankTipByUserId(info.user_id, info.value)
    end
end
--------------------- tourn cash boardcast end-------------------
------------------  rank start------------------
function cls:addCoinsToScore(score, from, pick_pos)
    local multi = 1
    if self:getMultiCtl():checkIsMultiSpin() and from == 1 and self:getMultiCtl():getLeftMultiSpins() < 8 then
        multi = self:getMultiCtl():getPointsMulti()
    end
    self.rankCtl:showScoreAddDialog(score, multi, from, pick_pos)
end
function cls:showRankMaskAndWhy()
    self.rankCtl:showRankMaskAndWhy()
end
function cls:showRankMaskAndNumber(firstTriggerLaster10)
    self.rankCtl:showRankMaskAndNumber(firstTriggerLaster10)

end
------------------  rank end------------------
--------------------- collect start-------------------
function cls:updateCollectCount(newCount, beforeCount, isAnimate)
    self.collectViewCtl:updateCollectCount(newCount, beforeCount, isAnimate)
end
function cls:getFlyItemList(item_list)
    return self.collectViewCtl:getFlyItemList(item_list)
end
function cls:dealFlyCollectItem(...)
    return self.collectViewCtl:dealFlyCollectItem(...)
end
--------------------- collect end-------------------
--------------------- prize pool start-------------------
function cls:updatePrizePool()
    local rank_jp = TournCashController:getInstance():getRankJp()
    if not rank_jp or rank_jp == 0 then
        local changeBetList = self.themeCtl:getChangeBetList()
        if changeBetList and #changeBetList > 0 then
            rank_jp = changeBetList[1] * 10
        end
    end
    if rank_jp and rank_jp > 0 then
        self:getPrizePoolCtl():updatePrizePool(rank_jp, nil, true)
    else
        self:getPrizePoolCtl():updatePrizePool(self.themeCtl:getCurTotalBet() * 10, nil, true)
    end
end
--------------------- prize pool end-------------------
--------------------- multi start -------------------
function cls:checkIsMultiSpin()
    return self.multiCtl:checkIsMultiSpin()
end
function cls:playMultiPointsDialog(...)
    self.multiCtl:playMultiPointsDialog(...)
end
function cls:getMultiNodeWorldPos()
    return self.multiCtl:getMultiNodeWorldPos()
end
--------------------- multi end-------------------
---------------------  balloon start -------------------
function cls:addBalloonList(...)
    self.balloonCtl:addBalloonList(...)
end
function cls:playMultiPointsByBalloon(spinCount, multi)
    self:getMultiCtl():playMultiPointsByBalloon(spinCount, multi)
end
--------------------- balloon end-------------------
--------------------- stage start-------------------
function cls:setStartRound(...)
    self:getStageViewCtl():setStartRound(...)
end
--------------------- stage end-------------------





function cls:clearMultiStatus()
    self:getMultiCtl():clearMultiStatus()
end
function cls:updateOnSpinStart()
    self:getMultiCtl():subMultiPoint()
end
function cls:clearAllStage()
    local data = {}
    data.map_points = 100
    data.score_points = 0
    self:getCollectViewCtl():setMapInfo(data)
    self:getRankCtl():clearRank()
    self:updateCollectCount(self:getCollectViewCtl():getMapPoints())
end
function cls:showThemeTourInfo(from, notAni, step, status)

    if not self:getRankCtl().rankView then
        return
    end
    if status == 3 then
        local rank_info = TournCashController:getInstance():getAllRankData()
        if step > 1 then
            if rank_info and #rank_info == 28 then
                self:getRankCtl():refreshRankListByServer(rank_info, from, notAni)
            else
                self:getRankCtl():refreshOnlyScore(from)
            end
        else
            self:getRankCtl():refreshOnlyScore(from)
        end
        self:updatePrizePool()
    elseif status < 3 then
        if not self:getRankCtl().rankView then
            return
        end
        self:getRankCtl():refreshOnlyScore(from)
        self:updatePrizePool()
    else
        self:updatePrizePool()
        self:getRankCtl():refreshOnlyScore(from)
    end
end
function cls:roundChange(curStageName)
    self:getRankCtl():refreshOnlyScore()
    if curStageName == "ROUND_ONE_SPIN" then
        self.rankCtl:updateRankMask(1)
    elseif curStageName == "ROUND_ONE_END" then
        self.balloonCtl:removeAllBalloon()
    elseif curStageName == "ROUND_TWO_SPIN" then
        self.rankCtl:updateRankMask(2)
        self.rankCtl:setRankPosition()
    elseif curStageName == "ROUND_TWO_END" then
        self.balloonCtl:removeAllBalloon()
    elseif curStageName == "ROUND_THREE_SPIN" then
        self:updatePrizePool()
    end
end
function cls:showThemeDialog(theData, sType, dialogType)
    self.themeCtl:playFadeToMinVlomeMusic(theData.music_mini)
    local mask_id = theData.mask_id or 3
    local end_event = theData.click_event
    theData.click_event = function()
        if end_event then
            end_event()
        end
        if sType == fs_show_type.start or sType == fs_show_type.collect then
            self.themeCtl:playMusicByName("common_click")
        end
        self.themeCtl:laterCallBack(0.2, function()
            self.themeCtl:playMusicByName("dialog_close")
            self.themeCtl:setMaskNodeStatus(mask_id, false, true)
        end)
    end
    local config = {}
    config["csb_file"] = self:getCsbPath("dialog_" .. dialogType)
    config["frame_config"] = {
        ["start"]   = { nil, 1, nil, 2 },
        ["more"]    = { nil, 50 / 30, nil, 2 },
        ["collect"] = { nil, 1, nil, 2 },
        ["choose"]  = { nil, 1, nil, 2 },
    }
    config.dialog_config = themeConfig.dialog_config[dialogType][sType]
    local theDialog = TCCommonDialog.new(self, config)
    if sType == fs_show_type.start then
        theDialog:showStart(theData, nil)
    elseif sType == fs_show_type.more then
        theDialog:showMore(theData, nil)
    elseif sType == fs_show_type.collect then
        theDialog:showCollect(theData, nil)
    end
    self.themeCtl:setMaskNodeStatus(mask_id, true, true)
    local moveY = self.themeCtl:adaptMoveDownY()
    if moveY > 0 then
        theDialog:setPosition(cc.p(0, -moveY))
    end
    theDialog.nodeEventListener:setSwallowTouches(false)
    return theDialog
end
function cls:playStartGoDialog()
    self._view:playStartGoDialog()
end
function cls:removeForbidTouchLinster()
    self._view:removeForbidTouchLinster()
    EventCenter:pushEvent(EVENTNAMES.TOURN_CASH.START_SPIN)
end
function cls:changeBg(index)
    self._view:changeBg(index)
end

return cls